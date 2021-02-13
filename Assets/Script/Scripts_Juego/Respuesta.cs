using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Respuesta
{
    public string Cod_Respuesta { get; set; }
    public string Respuestas_Descripcion { get; set; }

    public Respuesta(string cod_respuesta, string respuesta_descripcion)
    {
        this.Cod_Respuesta = cod_respuesta;
        this.Respuestas_Descripcion = respuesta_descripcion;
    }
}
