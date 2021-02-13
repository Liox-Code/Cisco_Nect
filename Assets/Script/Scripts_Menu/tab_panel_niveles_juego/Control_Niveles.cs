using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using System;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Control_Niveles : MonoBehaviour
{
    Conex_DB conex_db;

    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    public GameObject panel_Info_Nivel;

    public List<GameObject> lista_btn_niveles = new List<GameObject>();

    //public Efecto_Fade_Escena Efecto_Fade;

    private void Start()
    {
        conex_db = new Conex_DB();

        actualizar_logro();
        desbloquear_nivel();

        for(int i = 0; i < lista_btn_niveles.Count; i++)
        {
            verificar_nivel(lista_btn_niveles[i]);
        }
    }

    void desbloquear_nivel()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE nivel_desbloqueado SET disponible = 1 WHERE (nombre_nivel, nombre_cuenta) IN (SELECT nj.nombre_nivel, nd.nombre_cuenta FROM nivel_desbloqueado nd INNER JOIN usuario u ON nd.nombre_cuenta = u.nombre_cuenta INNER JOIN nivel_juego nj ON nj.nombre_nivel = nd.nombre_nivel WHERE nd.nombre_cuenta = \"{0}\" AND nd.disponible = 0 AND nj.nivel_requerido <= u.nivel_cuenta);", Global_Session.Nombre_Usuario);

        comando_db.CommandText = query;

        int filas = comando_db.ExecuteNonQuery();

        if (filas <= 0)
        {
            //Debug.Log("No se actualizo nivel.");
        }
        else
        {
            //Debug.Log("Nivel actualizado");
        }
        
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    void verificar_nivel(GameObject btn_nivel)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string nombre_nivel_seleccionado = btn_nivel.name.ToString();
        string query = string.Format("SELECT nd.nombre_nivel, nd.disponible FROM nivel_desbloqueado nd INNER JOIN usuario u ON nd.nombre_cuenta = u.nombre_cuenta INNER JOIN nivel_juego nj ON nj.nombre_nivel = nd.nombre_nivel WHERE nd.nombre_cuenta = \"{0}\" AND nd.nombre_nivel = \"{1}\" AND nd.disponible = 1;", Global_Session.Nombre_Usuario, nombre_nivel_seleccionado);

        comando_db.CommandText = query;

        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            bool disponible = lector_db.GetBoolean(1);
            btn_nivel.GetComponent<Button>().interactable = disponible;
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }

    public void buscar_nivel(string nombre_nivel)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT nombre_nivel, descripcion FROM nivel_juego WHERE nombre_nivel = \"{0}\" AND nivel_juego_activo = 1;", nombre_nivel);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        if (lector_db.Read())
        {
            string nombre_nivel_juego = lector_db.GetString(0);
            string descripcion_nivel = lector_db.GetString(1);

            panel_Info_Nivel.SetActive(true);
            panel_Info_Nivel.GetComponent<niveles_juego_manager>().poner_datos(nombre_nivel_juego, descripcion_nivel);
        }

        conex_db.Cerrar_DB();
    }

    void actualizar_logro()
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("UPDATE logro SET progreso_objetivo_actual = (SELECT count(*) " +
            "FROM nivel_desbloqueado nd INNER JOIN usuario u ON nd.nombre_cuenta = u.nombre_cuenta INNER JOIN nivel_juego nj ON nj.nombre_nivel = nd.nombre_nivel WHERE nd.nombre_cuenta = \"{0}\" AND nd.disponible = 1) " +
            "WHERE nombre_cuenta = \"{0}\" " +
            "AND nombre_tipo_logro = \"IMPARABLE\";"
            , Global_Session.Nombre_Usuario);

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
        catch (Exception)
        {
            Debug.Log("catch actualizar_logro no se actualizo");
            throw;
        }
    }
}
