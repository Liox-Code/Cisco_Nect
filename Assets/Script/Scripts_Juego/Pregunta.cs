using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pregunta
{
    public string Cod_Pregunta { get; set; }
    public string Texto_Pregunta { get; set; }
    public string Dificultad_Pregunta { get; set; }
    public bool Pregunta_Contestada { get; set; }

    public Pregunta(string cod_pregunta, string texto_pregunta, string dificultad_pregunta, bool pregunta_contestada)
    {
        this.Cod_Pregunta = cod_pregunta;
        this.Texto_Pregunta = texto_pregunta;
        this.Dificultad_Pregunta = dificultad_pregunta;
        this.Pregunta_Contestada = pregunta_contestada;
    }
}
