using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using System;
using UnityEngine.UI;

class Logro
{
    public string Nombre_Logro { get; set; }
    public string Descripcion_Logro { get; set; }
    public int Cantidad_Objetivo_Alcanzar { get; set; }
    public int Progreso_Objetivo_Actual { get; set; }
    public Sprite Img_Logro { get; set; }
    public int Nivel_Logro { get; set; }

    public Logro(string nombre_logro, string descripcion_logro, int cantidad_objetivo_alcanzar, int progreso_objetivo_actual, Sprite img_logro, int nivel_logro)
    {
        this.Nombre_Logro = nombre_logro;
        this.Descripcion_Logro = descripcion_logro;
        this.Cantidad_Objetivo_Alcanzar = cantidad_objetivo_alcanzar;
        this.Progreso_Objetivo_Actual = progreso_objetivo_actual;
        this.Img_Logro = img_logro;
        this.Nivel_Logro = nivel_logro;
    }
}