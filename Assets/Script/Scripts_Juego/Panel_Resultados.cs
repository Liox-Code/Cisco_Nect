using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using System;

public class Panel_Resultados : MonoBehaviour
{
    private string Cant_Preguntas_Correctas;
    private string Cant_Preguntas_Incorrectas;
    private string Preguntas_Puntos;
    private string Experiencia_Obtenida;
    private string Preguntas_Tiempo_Total;

    public Text txt_cant_preguntas_Correctas;
    public Text txt_cant_preguntas_Incorrectas;
    public Text txt_preguntas_Puntos;
    public Text txt_experiencia_Obtenida;
    public Text txt_preguntas_Tiempo_Total;

    public GameObject btn_guardar_resultados_y_salir;

    Conex_DB conex_db;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    private void OnEnable()
    {
        txt_cant_preguntas_Correctas.text = Convert.ToString(Cant_Preguntas_Correctas);
        txt_cant_preguntas_Incorrectas.text = Convert.ToString(Cant_Preguntas_Incorrectas);
        txt_preguntas_Puntos.text = Convert.ToString(Preguntas_Puntos);
        txt_experiencia_Obtenida.text = Convert.ToString(Experiencia_Obtenida);
        txt_preguntas_Tiempo_Total.text = Convert.ToString(Preguntas_Tiempo_Total);
    }

    private void Start()
    {
        conex_db = new Conex_DB();
        btn_guardar_resultados_y_salir.GetComponent<Button>().onClick.AddListener(() => salir_Menu());
        insertar_resultado_juego();
        Insertar_Estadisica();
        actualizar_Cuenta();
        actualizar_logro(minutos_totales(), "PERSEVERANTE");
    }

    public void poner_datos(string cant_preguntas_Correctas, string cant_preguntas_Incorrectas, string preguntas_Puntos, string experiencia_Obtenida, string preguntas_Tiempo_Total)
    {
        Cant_Preguntas_Correctas = cant_preguntas_Correctas;
        Cant_Preguntas_Incorrectas = cant_preguntas_Incorrectas;
        Preguntas_Puntos = preguntas_Puntos;
        Experiencia_Obtenida = experiencia_Obtenida;
        Preguntas_Tiempo_Total = preguntas_Tiempo_Total;
    }

    private void salir_Menu()
    {
        SceneManager.LoadScene("Menu");
    }

    private void insertar_resultado_juego()
    {
        string hoy = DateTime.Now.ToString("yyyy-MM-dd");

        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("INSERT INTO juego_resultados " +
            "VALUES( \"{0}\", \"{1}\", {2}, {3}, \"{4}\", {5}, {6}, \"{7}\");"
            , Global_Session.Nombre_Usuario, Global_Session.Nombre_Nivel, Cant_Preguntas_Correctas, Cant_Preguntas_Incorrectas, Preguntas_Tiempo_Total, Preguntas_Puntos, Experiencia_Obtenida, hoy);

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
                Debug.Log("No se guardo los resultados");
            }
            else
            {
                Debug.Log("Se guardo los resultados");
            }
        }
        catch (Exception)
        {
            Debug.Log("No se guardo los resultados CATCH");
            throw;
        }

    }

    private void actualizar_Cuenta()
    {
        int exp_obtenida = Convert.ToInt32(Experiencia_Obtenida);
        int puntos_Obtenidos = Convert.ToInt32(Preguntas_Puntos);

        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE usuario " +
            "SET exp_actual = (exp_actual + {0}), puntos = (puntos + {1}) " +
            "WHERE nombre_cuenta = \"{2}\";"
            , exp_obtenida, puntos_Obtenidos, Global_Session.Nombre_Usuario);

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
                Debug.Log("No se actualizo la cuenta");
            }
            else
            {
                Debug.Log("Se actualizo la cuenta");
            }
        }
        catch (Exception)
        {
            Debug.Log(query);
            Debug.Log("No se actualizo la cuenta CATCH");
            throw;
        }
    }

    private void Insertar_Estadisica()
    {
        string hoy = DateTime.Now.ToString("yyyy-MM-dd");

        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        float Correctas = float.Parse(Cant_Preguntas_Correctas);
        float Incorrectas = float.Parse(Cant_Preguntas_Incorrectas);
        float porcentaje_acertado = ( 100 / (Correctas + Incorrectas)) * Correctas;

        string query = string.Format("INSERT INTO estadistica VALUES ( \"{0}\", \"{1}\", \"{2}\");", Global_Session.Nombre_Usuario, hoy, porcentaje_acertado);

        Debug.Log(hoy);
        Debug.Log(query);

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
                Debug.Log("No se Insertar_Estadisica");
            }
            else
            {
                Debug.Log("Se Insertar_Estadisica");
            }
        }
        catch (Exception)
        {
            Debug.Log("No se Insertar_Estadisica CATCH");
            throw;
        }
    }

    private int minutos_totales()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        double segundos = 0;
        string query = string.Format("SELECT  jr.tiempo_total " +
            "FROM usuario u " +
            "INNER JOIN juego_resultados jr ON u.nombre_cuenta = jr.nombre_cuenta " +
            "INNER JOIN nivel_juego nj ON nj.nombre_nivel = jr.nombre_nivel " +
            "WHERE u.nombre_cuenta = \"{0}\";", Global_Session.Nombre_Usuario);

        Debug.Log(query);

        comando_db.CommandText = query;

        lector_db = comando_db.ExecuteReader();

        while (lector_db.Read())
        {
            segundos = segundos + TimeSpan.Parse("00:" + lector_db.GetString(0)).TotalSeconds;
        }

        int minutos = Mathf.FloorToInt((float)segundos / 60);

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;

        return minutos;
    }

    void actualizar_logro(int puntos_totales, string nombre_logro)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE logro " +
            "SET progreso_objetivo_actual = {0} " +
            "WHERE nombre_cuenta = \"{1}\" " +
            "AND nombre_tipo_logro = \"{2}\";"
            , puntos_totales, Global_Session.Nombre_Usuario, nombre_logro);

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
                Debug.Log("Logro puntos no subio nivel");
            }
            else
            {
                Debug.Log("Logro subio el nivel");
            }
        }
        catch (Exception)
        {
            Debug.Log("Logro puntos no subio nivel catch");
            throw;
        }
    }
}
