using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Grupo_Tabs : MonoBehaviour
{
    public List<Boton_Tab> Botones_Tab;

    public Boton_Tab Tab_Seleccionado;

    public List<GameObject> lista_Paginas_Tab;

    public void Añadir_Tab(Boton_Tab boton)
    {
        if (Botones_Tab == null)
        {
            Botones_Tab = new List<Boton_Tab>();
        }
        Botones_Tab.Add(boton);
    }

    public void Entrar_Tab(Boton_Tab boton)
    {
        Reset_Tab_Style();
        if (Tab_Seleccionado == null || Tab_Seleccionado != boton)
        {
            boton.background.color = new Color32(46, 206, 242, 255);
            boton.icono.color = new Color32(44, 47, 64, 255);
        }
    }

    public void Salir_Tab(Boton_Tab boton)
    {
        Reset_Tab_Style();
    }

    public void Seleccionar_Tab(Boton_Tab boton)
    {
        if (Tab_Seleccionado != null)
        {
            Tab_Seleccionado.Deseleccionar();
        }

        Tab_Seleccionado = boton;

        Tab_Seleccionado.Seleccionar();

        Reset_Tab_Style();
        boton.background.color = new Color32(46, 206, 242, 255);
        boton.icono.color = new Color32(44, 47, 64, 255);

        int index = boton.transform.GetSiblingIndex();

        for (int i = 0; i < lista_Paginas_Tab.Count; i++)
        {
            if (i == index)
            {
                lista_Paginas_Tab[i].SetActive(true);
            }
            else
            {
                lista_Paginas_Tab[i].SetActive(false);
            }
        }
    }

    public void Reset_Tab_Style()
    {
        foreach (Boton_Tab boton in Botones_Tab)
        {
            if (Tab_Seleccionado != null && boton == Tab_Seleccionado)
            {
                continue;
            }
            boton.background.color = new Color32(44,47,64,255);
            boton.icono.color = new Color32(46, 206, 242, 255);
        }
    }
}
