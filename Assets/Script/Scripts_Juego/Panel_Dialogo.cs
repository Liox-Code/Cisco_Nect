using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Panel_Dialogo : MonoBehaviour
{
    public GameObject btn_cerrar;
    public Text Cod_Dato;
    public Text Dato_Texto;

    void Start()
    {
        UnityEngine.Events.UnityAction Cerrar_Dialogo = () =>
        {
            this.gameObject.SetActive(false);
        };

        btn_cerrar.GetComponent<Button>().onClick.AddListener(Cerrar_Dialogo);
    }

    public void poner_datos(string cod_dato, string dato_texto)
    {
        this.Dato_Texto.text = dato_texto;
    }
}
