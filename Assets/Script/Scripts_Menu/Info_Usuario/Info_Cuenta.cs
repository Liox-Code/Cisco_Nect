using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

using System;
using System.IO;
using System.Data;
using Mono.Data.Sqlite;
using UnityEngine.SceneManagement;

public class Info_Cuenta : MonoBehaviour
{
    public Text txt_Nombre_Cuenta;
    public Text txt_level;
    public Text txt_exp_total_y_sig_nivel;
    public Image img_barra_experiencia;
    public Text txt_puntos;

    Conex_DB conexion_db;

    IDbConnection db_conexion;
    IDbCommand db_comando;
    IDataReader db_lector;

    void Awake()
    {
        conexion_db = new Conex_DB();
        actualizar_info();
    }

    void actualizar_info()
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        string query = string.Format("SELECT nivel_cuenta, exp_actual, exp_sig_nivel, puntos, nombre_usuario, apellido_usuario, nombre_cuenta FROM usuario WHERE nombre_cuenta = \"{0}\" and contraseña = \"{1}\";", Global_Session.Nombre_Usuario, Global_Session.Contraseña);

        db_comando.CommandText = query;
        db_lector = db_comando.ExecuteReader();

        if (db_lector.Read())
        {
            int nivel_cuenta = db_lector.GetInt32(0);
            int puntos = db_lector.GetInt32(3);
            string nombre = db_lector.GetString(4);
            string apellido = db_lector.GetString(5);
            string nombre_cuenta = db_lector.GetString(6);

            txt_Nombre_Cuenta.text = nombre_cuenta.ToString();
            txt_level.text = nivel_cuenta.ToString();
            txt_exp_total_y_sig_nivel.text = db_lector.GetInt32(1).ToString() + "/" + db_lector.GetInt32(2).ToString();
            txt_puntos.text = puntos.ToString();
            img_barra_experiencia.fillAmount = (((100 * (float)db_lector.GetInt32(1)) / (float)db_lector.GetInt32(2)) / 100);

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
    }
}
