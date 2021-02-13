using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;

public class Boton_Tab : MonoBehaviour, IPointerEnterHandler, IPointerClickHandler, IPointerExitHandler
{
    public Grupo_Tabs GrupoTab;

    public Image background;
    public Image icono;

    public UnityEvent al_Seleccionar_Tab;
    public UnityEvent al_Deseleccionar_Tab;

    void Start()
    {
        background = GetComponent<Image>();
        GrupoTab.Añadir_Tab(this);
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        GrupoTab.Seleccionar_Tab(this);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        GrupoTab.Entrar_Tab(this);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        GrupoTab.Salir_Tab(this);
    }

    public void Seleccionar()
    {
        if (al_Seleccionar_Tab != null)
        {
            al_Seleccionar_Tab.Invoke();
        }
    }

    public void Deseleccionar()
    {
        if (al_Deseleccionar_Tab != null)
        {
            al_Deseleccionar_Tab.Invoke();
        }
    }

}
