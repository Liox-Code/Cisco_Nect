using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using System;
using UnityEngine.UI;

public class Logro_Manager : MonoBehaviour
{
    Conex_DB conex_db;

    public GameObject prefab_panel_logro;
    public Transform prefab_padre;

    private List<Logro> lista_logro = new List<Logro>();
    public List<Sprite> lista_img_logro = new List<Sprite>();

    public Text logros_mensaje_debug;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    private void Start()
    {
        conex_db = new Conex_DB();
        verificar_logros();
        mostrar_logro();
    }

    void buscar_logro_db()
    {
        lista_logro.Clear();

        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT tl.nombre_tipo_logro, tl.descripcion_logro, ln.cantidad_objetivo_alcanzar, l.progreso_objetivo_actual, l.nivel_logro FROM logro l INNER JOIN tipo_logro tl ON l.nombre_tipo_logro = tl.nombre_tipo_logro INNER JOIN logro_niveles ln ON tl.nombre_tipo_logro = ln.nombre_tipo_logro INNER JOIN usuario u ON u.nombre_cuenta = l.nombre_cuenta WHERE l.nivel_logro = ln.nivel_logro AND u.nombre_cuenta = \"{0}\" AND u.usuario_cuenta_activo = 1;", Global_Session.Nombre_Usuario);

        Debug.Log(query);

        comando_db.CommandText = query;

        lector_db = comando_db.ExecuteReader();

        while (lector_db.Read())
        {
            string nombre_logro = lector_db.GetString(0);
            string descripcion_logro = lector_db.GetString(1);
            int cantidad_objetivo_alcanzar = lector_db.GetInt32(2);
            int progreso_objetivo_actual = lector_db.GetInt32(3);
            int nivel_logro = lector_db.GetInt32(4);
            Sprite img_logro = lista_img_logro[1];

            for (int i = 0; i < lista_img_logro.Count; i++)
            {
                if (nombre_logro == lista_img_logro[i].name)
                {
                    img_logro = lista_img_logro[i];
                    //Debug.Log(lista_img_logro[i].name);
                }
            }

            logros_mensaje_debug.text = string.Format("{0}, {1}, {2}, {3}", nombre_logro, descripcion_logro, cantidad_objetivo_alcanzar, progreso_objetivo_actual);

            //Debug.Log(string.Format("{0} , {1} , {2} , {3}", nombre_logro, descripcion_logro, cantidad_objetivo_alcanzar, progreso_objetivo_actual));
            lista_logro.Add(new Logro ( nombre_logro, descripcion_logro, cantidad_objetivo_alcanzar, progreso_objetivo_actual, img_logro, nivel_logro));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    void mostrar_logro()
    {
        buscar_logro_db();

        for (int i = 0; i < lista_logro.Count; i++)
        {
            GameObject temp_prefab_panel_control = Instantiate(prefab_panel_logro) as GameObject;
            temp_prefab_panel_control.transform.SetParent(prefab_padre, false);
            Logro temp_logro = lista_logro[i];
            temp_prefab_panel_control.GetComponent<Logro_Script>().poner_Datos( temp_logro.Nombre_Logro, temp_logro.Descripcion_Logro, temp_logro.Cantidad_Objetivo_Alcanzar, temp_logro.Progreso_Objetivo_Actual, temp_logro.Img_Logro, temp_logro.Nivel_Logro);
        }
    }



    void verificar_logros()
    {
        string[] nombres_logros = { "DINERO_PUNTOS", "NIVEL_ALCANZADO", "TRUENO_RAPIDEZ", "FUEGO_RACHA", "PERSEVERANTE", "IMPARABLE" };

        for (int i = 0; i < nombres_logros.Length; i++)
        {
            do
            {
                if (verificar_logro(nombres_logros[i]))
                {
                    subir_nivel_puntos(nombres_logros[i]);
                }
            } while (verificar_logro(nombres_logros[i]));
        }
    }

    bool verificar_logro(string nombre_logro)
    {
        bool subir_Nivel = false;
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT l.progreso_objetivo_actual, ln.cantidad_objetivo_alcanzar, l.nivel_logro, tl.nivel_tipo_logro_max " +
            "FROM logro_niveles ln " +
            "INNER JOIN tipo_logro tl ON ln.nombre_tipo_logro = tl.nombre_tipo_logro " +
            "INNER JOIN logro l ON tl.nombre_tipo_logro = l.nombre_tipo_logro " +
            "INNER JOIN usuario u ON l.nombre_cuenta = u.nombre_cuenta " +
            "WHERE l.nivel_logro = ln.nivel_logro " +
            "AND u.nombre_cuenta = \"{0}\" " +
            "AND l.nombre_tipo_logro = \"{1}\";", Global_Session.Nombre_Usuario, nombre_logro);

        comando_db.CommandText = query;

        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            int progreso_objetivo_actual = lector_db.GetInt32(0);
            int cantidad_objetivo_alcanzar = lector_db.GetInt32(1);
            int nivel_logro = lector_db.GetInt32(2);
            int nivel_logro_max = lector_db.GetInt32(3);

            if (cantidad_objetivo_alcanzar <= progreso_objetivo_actual && nivel_logro < nivel_logro_max)
            {
                subir_Nivel = true;
                //Debug.Log("subir de nivel");
            }
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
        return subir_Nivel;
    }

    void subir_nivel_puntos(string nombre_logro)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE logro " +
            "SET nivel_logro = nivel_logro + 1 " +
            "WHERE nombre_cuenta = \"{0}\" " +
            "AND nombre_tipo_logro = \"{1}\";"
            ,  Global_Session.Nombre_Usuario, nombre_logro);

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
