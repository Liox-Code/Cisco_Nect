using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Datos_Extra_Cisco
{
    public string Cod_Dato { get; set; }
    public string Dato_Texto { get; set; }

    public Datos_Extra_Cisco(string cod_dato, string dato_texto)
    {
        this.Cod_Dato = cod_dato;
        this.Dato_Texto = dato_texto;
    }
}
