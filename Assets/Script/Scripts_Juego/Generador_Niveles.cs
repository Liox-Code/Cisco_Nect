using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using UnityEngine.UI;

public class Generador_Niveles : MonoBehaviour
{
    public GameObject[] posiciones_preguntas;

    public List<Pregunta> preguntas = new List<Pregunta>();

    int cantidad_preguntas;

    private GameObject Signo_Interrogacion_Seleccionado;

    Conex_DB conex_db;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    void Start()
    {
        conex_db = new Conex_DB();

        cantidad_preguntas = buscar_cantidad_preguntas();
        escoger_preguntas(cantidad_preguntas);

        List<int> numeros_random = new List<int>();

        int numero_random;
        for (int i = 0; i < posiciones_preguntas.Length / 2; i++)
        {
            do
            {
                numero_random = Random.Range(0, posiciones_preguntas.Length);
            } while (numeros_random.Contains(numero_random));
            numeros_random.Add(numero_random);
            posiciones_preguntas[numero_random].SetActive(true);
            posiciones_preguntas[numero_random].GetComponent<Pregunta_Activada>().Poner_Datos_Pregunta(preguntas[cantidad_preguntas-1].Cod_Pregunta, preguntas[cantidad_preguntas - 1].Texto_Pregunta, preguntas[cantidad_preguntas - 1].Dificultad_Pregunta, preguntas[cantidad_preguntas - 1].Pregunta_Contestada);
            reducir_cantidad_preguntas(1);
        }

        //for (int i = 0; i < 10; i++)
        //{
        //    Debug.Log(string.Format("{0} {1} {2} {3}",preguntas[i].Cod_Pregunta, preguntas[i].Texto_Pregunta, preguntas[i].Dificultad_Pregunta, preguntas[i].Pregunta_Contestada));
        //}
    }

    private void Update()
    {
        //verificar_toque();
    }

    void verificar_toque()
    {
        //if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)
        //{        
        //    Vector3 touchPosicion3D = Camera.main.ScreenToWorldPoint(Input.GetTouch(0).position);
        //    Vector2 touchPosicion2D = new Vector2(touchPosicion3D.x, touchPosicion3D.y);
        //    RaycastHit2D hit = Physics2D.Raycast(touchPosicion2D, Camera.main.transform.forward);

        //    if (hit.collider != null && hit.collider.transform.tag == "Pregunta")
        //    {
        //        Debug.Log("Nombre: " + hit.transform.gameObject.name);
        //    }
        //    else
        //    {
        //        //Debug.Log("No touching nothing");
        //    }
        //}
    }

    public int buscar_cantidad_preguntas()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT cantidad_preguntas FROM nivel_juego nj WHERE nombre_nivel = \"{0}\" AND nivel_juego_activo = 1;", Global_Session.Nombre_Nivel);

        comando_db.CommandText = query;

        try
        {
            lector_db = comando_db.ExecuteReader();

            if (lector_db.Read())
            {
                int cant_preguntas = 0;
                cant_preguntas = lector_db.GetInt32(0);
                //Debug.Log(cant_preguntas);

                lector_db.Close();
                lector_db = null;
                comando_db.Dispose();
                comando_db = null;
                coneccion_db.Close();
                coneccion_db= null;
                return cant_preguntas;
            }

            lector_db.Close();
            lector_db = null;
            comando_db.Dispose();
            comando_db = null;
            coneccion_db.Close();
            coneccion_db = null;
            return 0;
        }
        catch (System.Exception)
        {
            coneccion_db.Close();
            Debug.Log("Error buscar_cantidad_preguntas()");
            return 0;
        }
    }

    private void escoger_preguntas(int cantidad_preguntas)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT * " +
            "FROM (SELECT p.cod_pregunta, p.texto_pregunta, p.dificultad_pregunta " +
            "FROM respuestas_dadas rd " +
            "INNER JOIN preguntas p ON rd.cod_pregunta = p.cod_pregunta " +
            "INNER JOIN preguntas_nivel pn ON p.cod_pregunta = pn.cod_pregunta " +
            "INNER JOIN nivel_juego nj ON pn.nombre_nivel = nj.nombre_nivel INNER JOIN usuario u ON rd.nombre_cuenta = u.nombre_cuenta " +
            "WHERE nj.nombre_nivel = \"{0}\" AND nj.nivel_juego_activo = 1 AND p.preguntas_activo = 1 AND u.nombre_cuenta = \"{1}\" " +
            "ORDER BY (rd.cantidad_veces_respondido_correctamente - rd.Cantidad_Veces_Respondido_Incorrectamente) LIMIT {2}) " +
            "ORDER BY RANDOM()", Global_Session.Nombre_Nivel, Global_Session.Nombre_Usuario, cantidad_preguntas);

        Debug.Log(query);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        while (lector_db.Read())
        {
            string cod_pregunta = lector_db.GetString(0);
            string texto_pregunta = lector_db.GetString(1);
            string dificultad_pregunta = lector_db.GetString(2);

            Debug.Log(cod_pregunta + " " + texto_pregunta + " " + dificultad_pregunta);
            preguntas.Add(new Pregunta( cod_pregunta, texto_pregunta, dificultad_pregunta, false));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    public void reducir_cantidad_preguntas( int cantidad_preguntas_activicadas)
    {
        cantidad_preguntas = cantidad_preguntas - cantidad_preguntas_activicadas;
    }

    public void Seleccionar_Pregunta()
    {
        for (int i = 0; i < posiciones_preguntas.Length; i++)
        {
            if (!posiciones_preguntas[i].activeSelf)
            {
                posiciones_preguntas[i].SetActive(true);
                posiciones_preguntas[i].GetComponent<Pregunta_Activada>().Poner_Datos_Pregunta(preguntas[cantidad_preguntas - 1].Cod_Pregunta, preguntas[cantidad_preguntas - 1].Texto_Pregunta, preguntas[cantidad_preguntas - 1].Dificultad_Pregunta, preguntas[cantidad_preguntas - 1].Pregunta_Contestada);
                reducir_cantidad_preguntas(1);
            }
        }
    }

    public void activar_Pregunta()
    {
        if (cantidad_preguntas > 0)
        {
            List<int> numeros_preguntas_activadas = new List<int>();

            for (int i = 0; i < posiciones_preguntas.Length; i++)
            {
                if (posiciones_preguntas[i].activeSelf)
                {
                    numeros_preguntas_activadas.Add(i);
                }
            }

            int numero_pregunta_random;
            do
            {
                numero_pregunta_random = Random.Range(0, posiciones_preguntas.Length);
            } while (numeros_preguntas_activadas.Contains(numero_pregunta_random));

            posiciones_preguntas[numero_pregunta_random].SetActive(true);
            posiciones_preguntas[numero_pregunta_random].GetComponent<Pregunta_Activada>().Poner_Datos_Pregunta(preguntas[cantidad_preguntas - 1].Cod_Pregunta, preguntas[cantidad_preguntas - 1].Texto_Pregunta, preguntas[cantidad_preguntas - 1].Dificultad_Pregunta, preguntas[cantidad_preguntas - 1].Pregunta_Contestada);
            reducir_cantidad_preguntas(1);
        }

        Signo_Interrogacion_Seleccionado.SetActive(false);

    }

    public void signo_interrogacion_presionado(GameObject signo_interrogacion_seleccionado)
    {
        Signo_Interrogacion_Seleccionado = signo_interrogacion_seleccionado;
    }
}
