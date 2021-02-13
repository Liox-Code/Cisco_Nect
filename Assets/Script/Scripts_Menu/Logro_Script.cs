using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Logro_Script : MonoBehaviour
{
    public Image img_logro;
    public GameObject Titulo;
    public GameObject Descripcion;
    public GameObject Objetivo_Total_y_Final;
    public GameObject Nivel_Logro;
    public Image img_barra_experiencia;

    public void poner_Datos(string titulo, string descripcion, int objetivo_final, int objetivo_total, Sprite spt_logro, int nivel_logro)
    {
        img_logro.sprite = spt_logro;
        this.Titulo.GetComponent<Text>().text = titulo;
        this.Descripcion.GetComponent<Text>().text = descripcion;
        if (objetivo_total > objetivo_final)
        {
            this.Objetivo_Total_y_Final.GetComponent<Text>().text = "M a x";
        }
        else
        {
            this.Objetivo_Total_y_Final.GetComponent<Text>().text = string.Format("{0} / {1}", objetivo_total.ToString(), objetivo_final.ToString());
        }
        Nivel_Logro.GetComponent<Text>().text = "LV. " + nivel_logro.ToString();
        img_barra_experiencia.fillAmount = (((100 * (float)objetivo_total) / (float)objetivo_final) / 100);
    }
}
