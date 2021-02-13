using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using UnityEngine.UI;

public class Pregunta_Activada : MonoBehaviour
{
    private string Cod_Pregunta;
    private string Texto_Pregunta;
    private string Dificultad_Pregunta;
    private bool Pregunta_Contestada;

    private List<Respuesta> respuestas = new List<Respuesta>();

    public GameObject btn_responder;
    public GameObject panel_pregunta_respuestas;

    Conex_DB conex_db = new Conex_DB();

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    public void Poner_Datos_Pregunta(string cod_pregunta, string texto_pregunta, string dificultad_pregunta, bool pregunta_contestada)
    {
        this.Cod_Pregunta = cod_pregunta;
        this.Texto_Pregunta = texto_pregunta;
        this.Dificultad_Pregunta = dificultad_pregunta;
        this.Pregunta_Contestada = pregunta_contestada;
        respuestas.Clear();
        escoger_respuesta_correcta();
        escoger_respuesta_incorrecta();
    }

    private void Start()
    {

    }

    private void escoger_respuesta_correcta()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT DISTINCT r.cod_respuesta, r.respuesta_descripcion " +
        "FROM preguntas p " +
        "INNER JOIN res_pre rp ON p.cod_pregunta = rp.cod_pregunta " +
        "INNER JOIN respuesta r ON rp.cod_respuesta = r.cod_respuesta " +
        "WHERE r.respuesta_activo = 1 AND p.preguntas_activo = 1 AND p.cod_pregunta = \"{0}\" AND rp.respuesta_correcta = 1 " +
        "ORDER BY random() " +
        "LIMIT 1 ", Cod_Pregunta);
        //Debug.Log(query);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        if(lector_db.Read())
        {
            string cod_respuesta = lector_db.GetString(0);
            string texto_pregunta = lector_db.GetString(1);
            //Debug.Log(cod_respuesta + " " + texto_pregunta);
            respuestas.Add(new Respuesta(cod_respuesta, texto_pregunta));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    private void escoger_respuesta_incorrecta()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT DISTINCT r.cod_respuesta, r.respuesta_descripcion " +
            "FROM preguntas p " +
            "INNER JOIN res_pre rp ON p.cod_pregunta = rp.cod_pregunta " +
            "INNER JOIN respuesta r ON rp.cod_respuesta = r.cod_respuesta " +
            "WHERE r.respuesta_activo = 1 AND p.preguntas_activo = 1 AND p.cod_pregunta = \"{0}\"  AND rp.respuesta_correcta = 0 " +
            "ORDER BY random() " +
            "LIMIT 3; ", Cod_Pregunta);
        //Debug.Log(query);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        while (lector_db.Read())
        {
            string cod_respuesta = lector_db.GetString(0);
            string texto_pregunta = lector_db.GetString(1);
            //Debug.Log(cod_respuesta + " " + texto_pregunta);
            respuestas.Add(new Respuesta(cod_respuesta, texto_pregunta));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        //Debug.Log("Cod_Pregunta" + Cod_Pregunta);
        //Debug.Log("Texto_Pregunta" + Texto_Pregunta);
        //Debug.Log("Dificultad_Pregunta" + Dificultad_Pregunta);
        //Debug.Log("Pregunta_Contestada" + Pregunta_Contestada);

        //for (int i = 0; i < respuestas.Count; i++)
        //{
        //    Debug.Log(string.Format("Respuesta {0} : {1} ||| {2}", i, respuestas[i].Cod_Respuesta, respuestas[i].Respuestas_Descripcion));
        //}

        activar_boton_responder();
        añadir_pregunta_respuestas();
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        btn_responder.SetActive(false);
    }

    private void activar_boton_responder()
    {
        UnityEngine.Events.UnityAction Mostrar_Panel_Pregunta = () =>
        {
            btn_responder.SetActive(false);
            panel_pregunta_respuestas.SetActive(true);
        };

        btn_responder.GetComponent<Button>().onClick.AddListener(Mostrar_Panel_Pregunta);
        btn_responder.SetActive(true);
    }

    private void añadir_pregunta_respuestas()
    {
        string[] cod_respuestas_Pregunta = new string[respuestas.Count];
        string[] respuestas_descripcion_Pregunta = new string[respuestas.Count];

        for (int i = 0; i < respuestas.Count; i++)
        {
            cod_respuestas_Pregunta[i] = respuestas[i].Cod_Respuesta;
            respuestas_descripcion_Pregunta[i] = respuestas[i].Respuestas_Descripcion;
        }

        panel_pregunta_respuestas.GetComponent<Responder_Pregunta>().signo_interrogacion_presionado(this.gameObject);
        panel_pregunta_respuestas.GetComponent<Responder_Pregunta>().poner_pre_res(Cod_Pregunta, Texto_Pregunta, cod_respuestas_Pregunta, respuestas_descripcion_Pregunta);
    }
}
