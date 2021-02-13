using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

using System;
using System.Data;
using System.IO;
using Mono.Data.Sqlite;

public class resultados_juego : MonoBehaviour
{
    public GameObject Generador_Niveles;
    public GameObject Panel_Resultados;

    public Text txt_Cant_Res_Correctas;
    public Text txt_Cant_Res_Incorrecto;
    public Text txt_Tiempo_Total;

    int Cant_Res_Correctas;
    int Cant_Res_Incorrecto;
    int Cantidad_Preguntas_Respondidas;
    int Puntaje_Obtenido;

    float tiempo_total = 0;

    Conex_DB conex_db;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    private void Start()
    {
        Cant_Res_Correctas = 0;
        Cant_Res_Incorrecto = 0;
        conex_db = new Conex_DB();
    }

    private void Update()
    {
        tiempo_total += Time.deltaTime;

        float minutos = Mathf.FloorToInt(tiempo_total / 60);
        float segundos = Mathf.FloorToInt(tiempo_total % 60);

        txt_Tiempo_Total.text = string.Format("{0:00}:{1:00}", minutos, segundos);
    }

    public void cantidad_res_correctas()
    {
        Cantidad_Preguntas_Respondidas++;
        Cant_Res_Correctas++;

        //Debug.Log(Cant_Res_Correctas);
    }

    public void cantidad_res_incorrectas()
    {
        Cantidad_Preguntas_Respondidas++;
        Cant_Res_Incorrecto++;
        //Debug.Log(Cant_Res_Incorrecto);
    }

    public void mostrar_cant_corr_incorr()
    {
        string str_Cant_Res_Correctas = "";
        string str_Cant_Res_Incorrecto = "";

        if (Cant_Res_Correctas >= 0 && Cant_Res_Correctas <= 9)
        {
            str_Cant_Res_Correctas = "0";
        }

        if (Cant_Res_Correctas >= 0 && Cant_Res_Incorrecto <= 9)
        {
            str_Cant_Res_Incorrecto = "0";
        }
        str_Cant_Res_Correctas = str_Cant_Res_Correctas + Convert.ToString(Cant_Res_Correctas);
        str_Cant_Res_Incorrecto = str_Cant_Res_Incorrecto + Convert.ToString(Cant_Res_Incorrecto);

        txt_Cant_Res_Correctas.text = str_Cant_Res_Correctas;
        txt_Cant_Res_Incorrecto.text = str_Cant_Res_Incorrecto;

        if (Cantidad_Preguntas_Respondidas >= Generador_Niveles.GetComponent<Generador_Niveles>().buscar_cantidad_preguntas())
        {
            Mostrar_Resultados_Nivel( str_Cant_Res_Correctas, str_Cant_Res_Incorrecto, calcular_Puntaje_Obtenido().ToString(), calcular_Experiencia_Obtenido().ToString(), txt_Tiempo_Total.text);
        }
    }

    public void Mostrar_Resultados_Nivel(string cant_preguntas_Correctas, string cant_preguntas_Incorrectas, string preguntas_Puntos, string experiencia_Obtenida, string preguntas_Tiempo_Total)
    {
        Panel_Resultados.GetComponent<Panel_Resultados>().poner_datos( cant_preguntas_Correctas, cant_preguntas_Incorrectas, preguntas_Puntos, experiencia_Obtenida, preguntas_Tiempo_Total);
        //Debug.Log(cant_preguntas_Correctas + " " + cant_preguntas_Incorrectas + " " + preguntas_Puntos + " " + experiencia_Obtenida + " " + preguntas_Tiempo_Total);
        Panel_Resultados.SetActive(true);
    }

    int calcular_Experiencia_Obtenido()
    {
        int puntaje_obtenido = calcular_Puntaje_Obtenido();
        int experiencia_obtenida = calcular_Puntaje_Obtenido() / 10;

        return experiencia_obtenida;
    }

    int calcular_Puntaje_Obtenido()
    {
        int puntaje_por_intento = 100;
        int puntaje_tiempo_obtenido = 0;
        int puntaje_res_correctas_obtenido = Cant_Res_Correctas * 200;
        int puntaje_total = 0;
        int Tiempo_Optimo = puntaje_Total_Nivel();
        TimeSpan tiempo_obtenido = TimeSpan.Parse("00:"+txt_Tiempo_Total.text);
        int tiempo_obtenido_segundos = Convert.ToInt32(Math.Floor(tiempo_obtenido.TotalSeconds));

        if (Tiempo_Optimo <= tiempo_obtenido_segundos)
        {
            tiempo_obtenido_segundos = Tiempo_Optimo;
        }

        Debug.Log(string.Format("{0} - {1} + {2} * 100",(int)Tiempo_Optimo, tiempo_obtenido_segundos, Cant_Res_Correctas));
        puntaje_tiempo_obtenido = ((int)Tiempo_Optimo - tiempo_obtenido_segundos + Cant_Res_Correctas);
        Debug.Log(string.Format("{0} + {1} + {2}", puntaje_tiempo_obtenido, puntaje_res_correctas_obtenido, puntaje_por_intento));
        puntaje_total = puntaje_tiempo_obtenido + puntaje_res_correctas_obtenido + puntaje_por_intento;
        return puntaje_total;
    }

    int puntaje_Total_Nivel()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        TimeSpan Tiempo_Optimo;
        string query = string.Format("SELECT tiempo FROM nivel_juego WHERE nombre_nivel = \"{0}\" AND nivel_juego_activo = 1;", Global_Session.Nombre_Nivel);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            Tiempo_Optimo = TimeSpan.Parse(lector_db.GetString(0));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
        return Convert.ToInt32(Math.Floor(Tiempo_Optimo.TotalSeconds));
    }
}
