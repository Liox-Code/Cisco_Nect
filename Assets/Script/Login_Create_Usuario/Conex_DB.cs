using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.IO;
using System.Data;
using Mono.Data.Sqlite;

class Conex_DB
{

    string db_ruta;
    string str_conexion;
    string db_nombre = "BD_NECT_Cisco_Gami.sqlite";

    IDbConnection db_conexion;
    IDbCommand db_comando;

    public IDbConnection Abrir_DB()
    {
        if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            db_ruta = Application.dataPath + "/StreamingAssets/" + db_nombre;
        }

        if (Application.platform == RuntimePlatform.Android)
        {
            db_ruta = Application.persistentDataPath + "/" + db_nombre;
            if (!File.Exists(db_ruta))
            {
                WWW cargar_db = new WWW("jar:file://" + Application.dataPath + "!/assets/" + db_nombre);
                while (!cargar_db.isDone)
                {
                    Debug.Log("Error Conexion Android");
                }
                File.WriteAllBytes(db_ruta, cargar_db.bytes);
            }
        }

        str_conexion = "URI = file:" + db_ruta;
        db_conexion = new SqliteConnection(str_conexion);
        db_conexion.Open();

        return db_conexion;
    }

    public void Cerrar_DB()
    {
        db_conexion.Close();
        db_conexion = null;
    }
}
