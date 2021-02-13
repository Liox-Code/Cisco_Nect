using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class rancking_Script : MonoBehaviour
{
    public GameObject Posicion;
    public GameObject Nombre;
    public GameObject Puntaje;

    public void poner_Datos(string posicion, string nombreCuenta, string puntos)
    {
        this.Posicion.GetComponent<Text>().text = posicion;
        this.Nombre.GetComponent<Text>().text = nombreCuenta;
        this.Puntaje.GetComponent<Text>().text = puntos;
    }
}
