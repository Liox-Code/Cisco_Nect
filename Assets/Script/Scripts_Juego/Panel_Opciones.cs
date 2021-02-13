using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Panel_Opciones : MonoBehaviour
{
    bool opciones_mostrar = false;

    void Start()
    {
        
    }

    void Update()
    {
        
    }

    public void mostrar_panel_opciones()
    {
        opciones_mostrar = !opciones_mostrar;
        this.gameObject.SetActive(opciones_mostrar);
    }

    public void Cerrar_Sesion()
    {
        Global_Session.Nombre_Usuario = "";
        Global_Session.Contraseña = "";
        Global_Session.Nombre = "";
        Global_Session.Apellido = "";
        Global_Session.Puntos = "";
        Global_Session.Nombre_Nivel = "";
        SceneManager.LoadScene("Login_Create_User");
    }

    public void Salir()
    {
        Application.Quit();
    }
}
