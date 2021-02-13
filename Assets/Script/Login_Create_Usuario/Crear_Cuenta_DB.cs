using UnityEngine;
using UnityEngine.UI;

using System.Data;
using UnityEngine.SceneManagement;

using System.Collections;
using System.Collections.Generic;
using UnityEngine.Networking;
using SimpleJSON;


public class Crear_Cuenta_DB : MonoBehaviour
{
    Conex_DB conexion_db;

    public InputField nombre_cuenta;
    public InputField nombre;
    public InputField apellido;
    public InputField contraseña;

    public GameObject Panel_Login;

    public Text error;

    IDbConnection db_conexion;
    IDbCommand db_comando;
    IDataReader db_lector;

    private bool todos_inputs_llenos = true;

    private void Start()
    {
        conexion_db = new Conex_DB();
    }

    void verificar_campo_vacio()
    {
        todos_inputs_llenos = true;
        if (string.IsNullOrEmpty(nombre_cuenta.text)
            || string.IsNullOrEmpty(nombre.text)
            || string.IsNullOrEmpty(apellido.text)
            || string.IsNullOrEmpty(contraseña.text))
        {
            todos_inputs_llenos = false;
        }
    }

    void añadir_cuenta_db(string nombre_cuenta, string nombre, string apellido, string contraseña)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query = string.Format("INSERT INTO usuario Values( \"{0}\", \"{1}\", \"{2}\", \"{3}\", 1, 200, 0, 0, 1, DATE());", nombre_cuenta, nombre, apellido, contraseña);
        db_comando.CommandText = query;
        error.text = query;
        Debug.Log(query);

        try
        {
            int filas = db_comando.ExecuteNonQuery();

            if (filas <= 0)
            {
                db_comando.Dispose();
                db_comando = null;
                conexion_db.Cerrar_DB();
                error.text = "Error, no se creo la cuenta IF.";
                Debug.Log("Error, no se creo la cuenta IF.");
            }
            else
            {
                db_comando.Dispose();
                db_comando = null;
                conexion_db.Cerrar_DB();
                error.text = "eXITO,se creo la cuenta.";
                añadir_logros_db(nombre_cuenta);
                añadir_nivel_desbloqueado_db(nombre_cuenta);
                añadir_respuestas_dadas(nombre_cuenta);
            }
        }
        catch (System.Exception)
        {
            error.text = "Error, no se creo la cuenta CATCH.";
            Debug.Log("Error, no se creo la cuenta CATCH.");
            throw;
        }
    }

    void añadir_nivel_desbloqueado_db(string nombre_cuenta)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query_preguntas = "SELECT nombre_nivel FROM nivel_juego;";
        db_comando.CommandText = query_preguntas;
        db_lector = db_comando.ExecuteReader();

        string query_insert_rd = string.Format("INSERT INTO nivel_desbloqueado VALUES");

        while (db_lector.Read())
        {
            string nombre_nivel = db_lector.GetString(0);
            query_insert_rd = query_insert_rd + string.Format("( \"{0}\", \"{1}\", 0),", nombre_cuenta, nombre_nivel);
            //añadir_respuesta_dadas(query_insert_rd);
            //db_comando.CommandText = query_insert_rd;
            //db_comando.ExecuteNonQuery();
            //Debug.Log(cod_pregunta);
        }

        query_insert_rd = query_insert_rd.Remove(query_insert_rd.Length - 1, 1) + ";";

        Debug.Log(query_insert_rd);

        db_lector.Close();
        db_lector = null;
        db_comando.Dispose();
        db_comando = null;
        conexion_db.Cerrar_DB();

        ejecutar_insert(query_insert_rd);
    }

    void añadir_logros_db(string nombre_cuenta)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query = string.Format("INSERT INTO logro Values( \"FUEGO_RACHA\", \"{0}\", 1, 0, 0),( \"IMPARABLE\", \"{0}\", 1, 0, 0),( \"DINERO_PUNTOS\", \"{0}\", 1, 0, 0),( \"NIVEL_ALCANZADO\", \"{0}\", 1, 0, 0),( \"PERSEVERANTE\", \"{0}\", 1, 0, 0);", nombre_cuenta);
        Debug.Log(query);
        error.text = query;
        db_comando.CommandText = query;

        try
        {
            int filas = db_comando.ExecuteNonQuery();

            if (filas <= 0)
            {
                Debug.Log("Error, No se creo logros.");
                error.text = "Error, No se creo logros.";
            }
            else
            {
                error.text = "Se creo la cuenta exitosamente";
            }
        }
        catch (System.Exception)
        {
            Debug.Log("Error, No se creo logros.");
            error.text = "Error, No se creo logros.";
            throw;
        }

        db_comando.Dispose();
        db_comando = null;
        conexion_db.Cerrar_DB();
    }

    void añadir_respuestas_dadas(string nombre_cuenta)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query_preguntas = "SELECT cod_pregunta FROM preguntas;";
        db_comando.CommandText = query_preguntas;
        db_lector = db_comando.ExecuteReader();

        string query_insert_rd = string.Format("INSERT INTO respuestas_dadas VALUES");

        while (db_lector.Read())
        {
            string cod_pregunta = db_lector.GetString(0);
            query_insert_rd = query_insert_rd + string.Format("( \"{0}\", \"{1}\", 0, 0),", nombre_cuenta, cod_pregunta);
            //añadir_respuesta_dadas(query_insert_rd);
            //db_comando.CommandText = query_insert_rd;
            //db_comando.ExecuteNonQuery();
            //Debug.Log(cod_pregunta);
        }

        query_insert_rd = query_insert_rd.Remove(query_insert_rd.Length - 1, 1) + ";";

        db_lector.Close();
        db_lector = null;
        db_comando.Dispose();
        db_comando = null;
        conexion_db.Cerrar_DB();

        ejecutar_insert(query_insert_rd);
    }

    void ejecutar_insert(string cod_pregunta)
    {
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();

        db_comando.CommandText = cod_pregunta;

        db_comando.ExecuteNonQuery();

        db_comando.Dispose();
        db_comando = null;
        conexion_db.Cerrar_DB();
    }

    public void crear_cuenta()
    {
        string str_nombre_cuenta = nombre_cuenta.text.ToLower();
        string str_nombre = nombre.text.ToLower();
        string str_apellido = apellido.text.ToLower();
        string str_contraseña = contraseña.text.ToLower();
        string str_puntos = "0";
        StartCoroutine(Crear_Cuenta_Usuario("https://nerbi.digital/elmono/ranckingManager.php", str_nombre_cuenta, str_nombre, str_apellido, str_contraseña, str_puntos));
    }

    IEnumerator Crear_Cuenta_Usuario(string uri, string nombre_cuenta, string nombre, string apellido, string contraseña,  string puntos)
    {
        WWWForm form = new WWWForm();
        form.AddField("nombre_cuenta", nombre_cuenta);
        form.AddField("contraseña", contraseña);
        form.AddField("nombre", nombre);
        form.AddField("apellido", apellido);
        form.AddField("puntos", puntos);
        form.AddField("Crear_Cuenta_Usuario", "Crear_Cuenta_Usuario");
        using (UnityWebRequest webRequest = UnityWebRequest.Post(uri, form))
        {
            yield return webRequest.SendWebRequest();

            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            if (webRequest.isNetworkError || webRequest.isHttpError)
            {
                error.text = "No hay conexión a internet";
                error.gameObject.SetActive(true);
                Debug.Log(pages[page] + ": Error: " + webRequest.error);
            }
            else
            {
                try
                {
                    bool creado = bool.Parse(webRequest.downloadHandler.text);
                    Debug.Log(creado);
                    if (creado)
                    {
                        verificar_campo_vacio();
                        if (todos_inputs_llenos != false)
                        {
                            añadir_cuenta_db(nombre_cuenta, nombre, apellido, contraseña);
                            Panel_Login.SetActive(true);
                            this.gameObject.SetActive(false);

                            error.gameObject.SetActive(false);
                        }
                        else
                        {
                            Debug.Log("Algun campo esta vacio");
                            error.text = "Error, No se creo logros.";
                        }
                    }
                    else
                    {
                        error.text = "Esta nombre de cuenta ya existe.";
                        error.gameObject.SetActive(true);
                    }
                }
                catch (System.Exception e)
                {
                    Debug.Log("Error Verificar_Cuenta_Existe" + e);
                }
            }
        }
    }
}
