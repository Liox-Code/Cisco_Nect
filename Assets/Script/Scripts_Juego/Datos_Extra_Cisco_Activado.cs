using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using UnityEngine.UI;

public class Datos_Extra_Cisco_Activado : MonoBehaviour
{
    private string Cod_Dato;
    private string Dato_Texto;

    public GameObject btn_hablar;
    public GameObject cuadro_dialogo;

    public void Poner_Datos_Extra(string cod_dato, string dato_texto)
    {
        this.Cod_Dato = cod_dato;
        this.Dato_Texto = dato_texto;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        activar_boton_responder();
        cuadro_dialogo.GetComponent<Panel_Dialogo>().poner_datos(Cod_Dato, Dato_Texto);
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        btn_hablar.SetActive(false);
    }

    private void activar_boton_responder()
    {
        UnityEngine.Events.UnityAction Mostrar_Dialogo = () =>
        {
            btn_hablar.SetActive(false);
            cuadro_dialogo.SetActive(true);
        };

        btn_hablar.GetComponent<Button>().onClick.AddListener(Mostrar_Dialogo);
        btn_hablar.SetActive(true);
    }
}
