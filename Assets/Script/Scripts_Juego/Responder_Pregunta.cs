using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.EventSystems;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;

public class Responder_Pregunta : MonoBehaviour
{
    Conex_DB conex_db;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    public GameObject btn_Cerrar;

    public GameObject Pregunta_Sel;

    public GameObject[] Respuesta;

    public GameObject Panel_Correcto;
    public GameObject Panel_Incorrecto;

    public GameObject Panel_Corr_Incorr;

    public GameObject generador_niveles;
    private GameObject Signo_Interrogacion_Seleccionado;

    private string Cod_Pregunta;
    private string Txt_Pregunta;

    private int preguntas_racha = 0;

    private List<string> Cod_Res = new List<string>();
    private List<string> Txt_Res = new List<string>();

    private void OnEnable()
    {
        Pregunta_Sel.GetComponent<Text>().text = Txt_Pregunta;
        btn_Cerrar.GetComponent<Button>().enabled = true;

        for (int i = 0; i < Respuesta.Length; i++)
        {
            Respuesta[i].GetComponent<Button>().enabled = true;
            Respuesta[i].transform.GetChild(0).gameObject.GetComponent<Text>().text = Txt_Res[i];
        }
    }

    void Start()
    {
        conex_db = new Conex_DB();

        for (int i = 0; i < Respuesta.Length; i++)
        {
            int index = i;
            Respuesta[index].GetComponent<Button>().onClick.AddListener(() => Responder(Cod_Pregunta,Cod_Res[index],Txt_Res[index]));
        }

        UnityAction Cerrar_Panel = () =>
        {
            this.gameObject.SetActive(false);
        };

        btn_Cerrar.GetComponent<Button>().onClick.AddListener(Cerrar_Panel);
    }

    private void Responder(string cod_pregunta, string cod_res, string txt_res)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        bool res_correcta = false;
        string query = string.Format("SELECT RP.respuesta_correcta " +
            "FROM preguntas p " +
            "INNER JOIN res_pre rp ON p.cod_pregunta = rp.cod_pregunta " +
            "INNER JOIN respuesta r ON rp.cod_respuesta = r.cod_respuesta " +
            "WHERE p.cod_pregunta = \"{0}\" AND r.cod_respuesta = \"{1}\";", cod_pregunta, cod_res);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            res_correcta = lector_db.GetBoolean(0);
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;

        responder_pregunta(res_correcta, txt_res);
        //Debug.Log(res_correcta);
        //Debug.Log(EventSystem.current.currentSelectedGameObject.transform.GetChild(0).gameObject.GetComponent<Text>().text);
    }

    private void responder_pregunta(bool correcto, string txt_res)
    {
        btn_Cerrar.GetComponent<Button>().enabled = false;
        for (int i = 0; i < Respuesta.Length; i++)
        {
            Respuesta[i].GetComponent<Button>().enabled = false;
        }
        StartCoroutine(mostrar_resultado_pregunta(correcto, txt_res, 1));
        if (correcto)
        {
            //Incrementar_Cantidad_Respondido_Correctamente();
            Panel_Corr_Incorr.GetComponent<resultados_juego>().cantidad_res_correctas();
        }
        else
        {
            //Incrementar_Cantidad_Respondido_Incorrectamente();
            Panel_Corr_Incorr.GetComponent<resultados_juego>().cantidad_res_incorrectas();
        }

        generador_niveles.GetComponent<Generador_Niveles>().signo_interrogacion_presionado(Signo_Interrogacion_Seleccionado);
        generador_niveles.GetComponent<Generador_Niveles>().activar_Pregunta();
    }

    IEnumerator mostrar_resultado_pregunta(bool correcto, string txt_res, float retardo)
    {
        if (correcto)
        {
            Panel_Correcto.SetActive(true);
            yield return new WaitForSeconds(retardo);
            Panel_Correcto.SetActive(false);
            verificar_racha(preguntas_racha);
            preguntas_racha++;
            Incrementar_Cantidad_Respondido_Correctamente();
        }
        else
        {
            Panel_Incorrecto.SetActive(true);
            yield return new WaitForSeconds(retardo);
            Panel_Incorrecto.SetActive(false);
            verificar_racha(preguntas_racha);
            preguntas_racha = 0;
            Incrementar_Cantidad_Respondido_Incorrectamente();
        }
        this.gameObject.SetActive(false);
        Panel_Corr_Incorr.GetComponent<resultados_juego>().mostrar_cant_corr_incorr();
    }

    void verificar_racha(int preguntas_racha)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT l.progreso_objetivo_actual, ln.cantidad_objetivo_alcanzar, l.nivel_logro, tl.nivel_tipo_logro_max " +
            "FROM logro_niveles ln " +
            "INNER JOIN tipo_logro tl ON ln.nombre_tipo_logro = tl.nombre_tipo_logro " +
            "INNER JOIN logro l ON tl.nombre_tipo_logro = l.nombre_tipo_logro " +
            "INNER JOIN usuario u ON l.nombre_cuenta = u.nombre_cuenta " +
            "WHERE l.nivel_logro = ln.nivel_logro " +
            "AND u.nombre_cuenta = \"{0}\" " +
            "AND l.nombre_tipo_logro = \"FUEGO_RACHA\";", Global_Session.Nombre_Usuario);

        int racha_maxima = 0;

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            racha_maxima = lector_db.GetInt32(0);
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;


        if (preguntas_racha > racha_maxima)
        {
            actualizar_logro(preguntas_racha);
        }
    }

    void actualizar_logro(int puntos_totales)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE logro " +
            "SET progreso_objetivo_actual = {0} " +
            "WHERE nombre_cuenta = \"{1}\" " +
            "AND nombre_tipo_logro = \"FUEGO_RACHA\";"
            , puntos_totales, Global_Session.Nombre_Usuario);
        Debug.Log("actualizaer");

        comando_db.CommandText = query;

        try
        {
            int filas = comando_db.ExecuteNonQuery();

            comando_db.Dispose();
            comando_db = null;
            coneccion_db.Close();
            coneccion_db = null;

            if (filas <= 0)
            {
                Debug.Log("actualizar_logro no se actualizo");
            }
            else
            {
                Debug.Log("actualizar_logr se actualizo");
            }
        }
        catch (System.Exception)
        {
            Debug.Log("catch actualizar_logro no se actualizo");
            throw;
        }
    }

    private void Incrementar_Cantidad_Respondido_Correctamente()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE respuestas_dadas " +
            "SET cantidad_veces_respondido_correctamente = (cantidad_veces_respondido_correctamente + 1) " +
            "WHERE nombre_cuenta = \"{0}\" AND cod_pregunta = \"{1}\"; ", Global_Session.Nombre_Usuario, Cod_Pregunta);
        Debug.Log(query);

        comando_db.CommandText = query;

        try
        {
            int filas = comando_db.ExecuteNonQuery();
            if (filas <= 0)
            {
                Debug.Log("No se modifico cantidad_veces_respondido_correctamente");
            }
            else
            {
                Debug.Log("Se modifico cantidad_veces_respondido_correctamente");
            }
        }
        catch (System.Exception)
        {
            Debug.Log("No se modifico cantidad_veces_respondido_correctamente");
        }

        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    private void Incrementar_Cantidad_Respondido_Incorrectamente()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE respuestas_dadas " +
            "SET Cantidad_Veces_Respondido_Incorrectamente = (Cantidad_Veces_Respondido_Incorrectamente + 1) " +
            "WHERE nombre_cuenta = \"{0}\" AND cod_pregunta = \"{1}\"; ", Global_Session.Nombre_Usuario, Cod_Pregunta);

        comando_db.CommandText = query;

        try
        {
            int filas = comando_db.ExecuteNonQuery();

            if (filas <= 0)
            {
                Debug.Log("No se modifico Cantidad_Veces_Respondido_Incorrectamente");
            }
            else
            {
                Debug.Log("Se modifico Cantidad_Veces_Respondido_Incorrectamente");
            }
        }
        catch (System.Exception)
        {
            Debug.Log("No se modifico Cantidad_Veces_Respondido_Incorrectamente");
        }


        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    public void poner_pre_res(string cod_pregunta, string txt_pregunta, string[] cod_res, string[] txt_res)
    {
        Cod_Res.Clear();
        Txt_Res.Clear();

        List<int> numeros_random = new List<int>();
        int numero_random;
        for (int i = 0; i < cod_res.Length; i++)
        {
            do
            {
                numero_random = Random.Range(0, cod_res.Length);
            } while (numeros_random.Contains(numero_random));
            numeros_random.Add(numero_random);
        }

        this.Cod_Pregunta = cod_pregunta;
        this.Txt_Pregunta = txt_pregunta;

        for (int i = 0; i < cod_res.Length; i++)
        {
            Cod_Res.Add(cod_res[numeros_random[i]]);
            Txt_Res.Add(txt_res[numeros_random[i]]);
        }
    }

    public void signo_interrogacion_presionado(GameObject signo_interrogacion_seleccionado)
    {
        Signo_Interrogacion_Seleccionado = signo_interrogacion_seleccionado;
    }

}
