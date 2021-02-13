using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using UnityEngine.UI;

public class Datos_Extra_Cisco_Manager : MonoBehaviour
{
    private List<Datos_Extra_Cisco> dato_extra = new List<Datos_Extra_Cisco>();

    public GameObject[] posiciones_dato_extra;

    private GameObject empleado_seleccionado;
    
    Conex_DB conex_db;
    IDbConnection coneccion_db;
    IDbCommand comando_db;
    IDataReader lector_db;

    void Start()
    {
        conex_db = new Conex_DB();

        int cantidad_datos_extra = posiciones_dato_extra.Length;
        escoger_dato_extra(cantidad_datos_extra);

        for (int i = 0; i < cantidad_datos_extra; i++)
        {
            posiciones_dato_extra[i].GetComponent<Datos_Extra_Cisco_Activado>().Poner_Datos_Extra(dato_extra[i].Cod_Dato, dato_extra[i].Dato_Texto);
        }


    }

    private void escoger_dato_extra(int cantidad_datos_extra)
    {
        coneccion_db = conex_db.Abrir_DB();

        comando_db = coneccion_db.CreateCommand();

        string query = string.Format("SELECT * " +
            "FROM (SELECT dn.cod_dato, dc.dato_texto " +
            "FROM dato_cisco dc " +
            "INNER JOIN dato_nivel dn ON dc.cod_dato = dn.cod_dato " +
            "INNER JOIN nivel_juego nj ON dn.nombre_nivel = nj.nombre_nivel " +
            "WHERE dn.nombre_nivel = \"{0}\" AND nj.nivel_juego_activo = 1 AND dc.dato_activo = 1 " +
            "ORDER BY dn.cantidad_veces_visto DESC LIMIT {1}) " +
            "ORDER BY random();", Global_Session.Nombre_Nivel, cantidad_datos_extra);

        Debug.Log(query);

        comando_db.CommandText = query;
        lector_db = comando_db.ExecuteReader();

        while (lector_db.Read())
        {
            string cod_dato = lector_db.GetString(0);
            string dato_texto = lector_db.GetString(1);

            Debug.Log(cod_dato + " " + dato_texto);

            dato_extra.Add(new Datos_Extra_Cisco(cod_dato, dato_texto));
        }

        lector_db.Close();
        lector_db = null;
        comando_db.Dispose();
        comando_db = null;
        coneccion_db.Close();
        coneccion_db = null;
    }
}
