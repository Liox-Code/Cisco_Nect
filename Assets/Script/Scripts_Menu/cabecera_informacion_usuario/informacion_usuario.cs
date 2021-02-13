using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

using System;
using System.IO;
using System.Data;
using Mono.Data.Sqlite;
using UnityEngine.SceneManagement;


public class informacion_usuario : MonoBehaviour
{

    Conex_DB conexion_db;

    public Text txt_exp_total_y_sig_nivel;
    public Text txt_level;
    public Text txt_puntos;
    public Image img_barra_experiencia;

    IDbConnection db_conexion;
    IDbCommand db_comando;
    IDataReader db_lector;

    void Awake()
    {
        conexion_db = new Conex_DB();
        do
        {
            if (verificar_exp_sig_nivel_obtenida())
            {
                subir_nivel();
            }
        } while (verificar_exp_sig_nivel_obtenida());
        actualizar_info();
    }

    void actualizar_info()
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        string query = string.Format("SELECT nivel_cuenta, exp_actual, exp_sig_nivel, puntos, nombre_usuario, apellido_usuario FROM usuario WHERE nombre_cuenta = \"{0}\" and contraseña = \"{1}\";", Global_Session.Nombre_Usuario, Global_Session.Contraseña);
        //Debug.Log(query);

        int nivel_cuenta = 0;
        int puntos = 0;

        db_comando.CommandText = query;
        db_lector = db_comando.ExecuteReader();

        if (db_lector.Read())
        {
            //Debug.Log(string.Format("{0}  :  {1}",Global_Session.Nombre_Usuario, Global_Session.Contraseña));
            //Debug.Log(string.Format("{0}, {1}, {2}, {3}", db_lector.GetInt32(0).ToString(), db_lector.GetInt32(1).ToString(), db_lector.GetInt32(2).ToString(), db_lector.GetInt32(3).ToString()));

            nivel_cuenta = db_lector.GetInt32(0);
            puntos = db_lector.GetInt32(3);
            string nombre = db_lector.GetString(4);
            string apellido = db_lector.GetString(5);

            txt_level.text = "NV. "+nivel_cuenta.ToString();
            txt_exp_total_y_sig_nivel.text = "E X P. " + db_lector.GetInt32(1).ToString() + "/" +db_lector.GetInt32(2).ToString();
            txt_puntos.text = puntos.ToString();
            img_barra_experiencia.fillAmount = (((100 * (float)db_lector.GetInt32(1)) / (float)db_lector.GetInt32(2)) / 100);
            Debug.Log((((100 * (float)db_lector.GetInt32(1)) / (float)db_lector.GetInt32(2))) / 100);

            Global_Session.Nombre = nombre;
            Global_Session.Apellido = apellido;
            Global_Session.Puntos = puntos.ToString();
        }

        db_lector.Close();
        db_lector = null;
        db_comando.Dispose();
        db_comando = null;
        db_conexion.Close();
        db_conexion = null;

        string[] nombres_logros = { "DINERO_PUNTOS", "NIVEL_ALCANZADO"};
        actualizar_logro(puntos, nombres_logros[0]);
        actualizar_logro(nivel_cuenta, nombres_logros[1]);
    }

    void actualizar_logro(int puntos_totales, string nombre_logro)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        string query = string.Format("UPDATE logro " +
            "SET progreso_objetivo_actual = {0} " +
            "WHERE nombre_cuenta = \"{1}\" " +
            "AND nombre_tipo_logro = \"{2}\";"
            , puntos_totales, Global_Session.Nombre_Usuario, nombre_logro);

        //Debug.Log(query);

        db_comando.CommandText = query;

        try
        {
            int filas = db_comando.ExecuteNonQuery();

            db_comando.Dispose();
            db_comando = null;
            db_conexion.Close();
            db_conexion = null;

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

    bool verificar_exp_sig_nivel_obtenida()
    {
        bool subir_Nivel = false;

        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        string query = string.Format("SELECT exp_sig_nivel, exp_actual FROM usuario WHERE nombre_cuenta = \"{0}\";", Global_Session.Nombre_Usuario);

        db_comando.CommandText = query;
        db_lector = db_comando.ExecuteReader();

        if (db_lector.Read())
        {
            int exp_sig_nivel = db_lector.GetInt32(0);
            int exp_actual = db_lector.GetInt32(1);

            if (exp_sig_nivel <= exp_actual)
            {
                subir_Nivel = true;
            }
        }

        db_lector.Close();
        db_lector = null;
        db_comando.Dispose();
        db_comando = null;
        db_conexion.Close();
        db_conexion = null;

        return subir_Nivel;
    }

    private void subir_nivel()
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        string query = string.Format("UPDATE usuario " +
            "SET nivel_cuenta = (nivel_cuenta + 1), exp_sig_nivel = (exp_sig_nivel + 200)" +
            "WHERE nombre_cuenta = \"{0}\";"
            , Global_Session.Nombre_Usuario);

        db_comando.CommandText = query;

        try
        {
            int filas = db_comando.ExecuteNonQuery();

            db_comando.Dispose();
            db_comando = null;
            db_conexion.Close();
            db_conexion = null;

            if (filas <= 0)
            {
                Debug.Log("No se subio el nivel");
            }
            else
            {
                Debug.Log("Se subio el nivel");
            }
        }
        catch (Exception)
        {
            Debug.Log("No se subio el nivel");
            throw;
        }
    }

}
