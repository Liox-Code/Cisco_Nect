using UnityEngine;
using UnityEngine.UI;

using System.Data;
using UnityEngine.SceneManagement;

public class Login_DB : MonoBehaviour
{
    Conex_DB conexion_db;

    public InputField nombre_cuenta;
    public InputField contraseña;

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
            || string.IsNullOrEmpty(contraseña.text))
        {
            todos_inputs_llenos = false;
        }
    }

    bool iniciar_sesion_cuenta_db(string nombre_cuenta, string contraseña)
    {
        bool existe_cuenta = false;
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query = string.Format("SELECT nombre_cuenta, contraseña FROM usuario WHERE usuario_cuenta_activo = 1 AND nombre_cuenta = \"{0}\" AND contraseña = \"{1}\";", nombre_cuenta, contraseña);
        db_comando.CommandText = query;

        db_lector = db_comando.ExecuteReader();

        while (db_lector.Read())
        {
            string nom_cuenta = db_lector.GetString(0);
            string con = db_lector.GetString(1);
            if (nombre_cuenta == nom_cuenta && contraseña == con)
            {
                existe_cuenta = true;
                Global_Session.Nombre_Usuario = nom_cuenta;
                Global_Session.Contraseña = con;
                break;
            }
        }

        conexion_db.Cerrar_DB();

        return existe_cuenta;
    }

    public void iniciar_sesion()
    {
        verificar_campo_vacio();
        if (todos_inputs_llenos != false)
        {
            string str_nombre_cuenta = nombre_cuenta.text.ToLower();
            string str_contraseña = contraseña.text.ToLower();
            bool cuenta_encontrada = iniciar_sesion_cuenta_db(str_nombre_cuenta, str_contraseña);
            if (cuenta_encontrada)
            {
                Debug.Log("Cuenta Encontrada");
                SceneManager.LoadScene("Menu");
            }
            else
            {
                Debug.Log("No existe cuenta");
            }
        }
        else
        {
            Debug.Log("Algun campo esta vacio");
        }
    }
}
