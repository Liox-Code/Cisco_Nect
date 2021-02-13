using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

using System.Data;
using System.IO;
using Mono.Data.Sqlite;
using System;

public class GraficoEstadistico : MonoBehaviour
{
    [SerializeField] private Sprite SpriteCirculo;
    [SerializeField] private RectTransform ContenedorGrafico;

    Conex_DB conexion_db;

    IDbConnection db_conexion;
    IDbCommand db_comando;
    IDataReader db_lector;

    private void Awake()
    {
        conexion_db = new Conex_DB();
        ContenedorGrafico = transform.Find("ContenedorGrafico").GetComponent<RectTransform>();
    }

    private void OnEnable()
    {
        List<float> valoresY = new List<float>();
        int numeroDatos = 7;
        for (int i = 0; i < numeroDatos; i++)
        {
            DateTime DiaActual = DateTime.Now.AddDays(i + 1 - numeroDatos);
            valoresY.Add(getPorcentajeAcertado(DiaActual));
        }
        mostrarGrafico(valoresY);
    }

    float getPorcentajeAcertado(DateTime fecha)
    {
        string strFecha = fecha.ToString("yyyy-MM-dd");
        
        db_conexion = conexion_db.Abrir_DB();

        db_comando = db_conexion.CreateCommand();
        string query = string.Format("SELECT (SUM(E.porcentaje_acertado) / COUNT(*)) AS porcentaje_Exito FROM estadistica e INNER JOIN usuario u ON e.nombre_cuenta = u.nombre_cuenta WHERE u.nombre_cuenta = \"{0}\" AND date(e.fecha_dia) = \"{1}\" GROUP BY e.fecha_dia;", Global_Session.Nombre_Usuario, strFecha);

        db_comando.CommandText = query;
        db_lector = db_comando.ExecuteReader();

        float porcentaje_acertado = 0;

        if (db_lector.Read())
        {
            porcentaje_acertado = db_lector.GetFloat(0);
        }

        db_lector.Close();
        db_lector = null;
        db_comando.Dispose();
        db_comando = null;
        conexion_db.Cerrar_DB();

        return porcentaje_acertado;
    }

    private GameObject crearCirculo(Vector2 posicionPunto)
    {
        GameObject objetoCirculo = new GameObject("circulo", typeof(Image));
        objetoCirculo.transform.SetParent(ContenedorGrafico, false);
        objetoCirculo.GetComponent<Image>().sprite = SpriteCirculo;

        RectTransform rectTransform = objetoCirculo.GetComponent<RectTransform>();
        rectTransform.anchoredPosition = posicionPunto;
        rectTransform.sizeDelta = new Vector2(30, 30);
        rectTransform.anchorMin = new Vector2(0, 0);
        rectTransform.anchorMax = new Vector2(0, 0);

        return objetoCirculo;
    }

    private void mostrarGrafico(List <float> valoresY)
    {
        float AnchoGrafico = ContenedorGrafico.sizeDelta.x - 90;
        float AltoGrafico = ContenedorGrafico.sizeDelta.y - 90;
        float numeroDatosX = valoresY.Count - 1;
        float numeroDatosY = 100;
        float separacionAncho = AnchoGrafico / numeroDatosX;
        float separacionAlto = AltoGrafico / numeroDatosY;

        GameObject UltimoPuntoObjeto = null;

        for (int i = 0; i < valoresY.Count; i++)
        {
            float posicionX = 45 + (separacionAncho * i);
            float posicionY = 45 + (separacionAlto * valoresY[i]);
            GameObject puntoObjeto = crearCirculo(new Vector2(posicionX, posicionY));
            if (UltimoPuntoObjeto != null)
            {
                coneccion_Entre_Puntos(UltimoPuntoObjeto.GetComponent<RectTransform>().anchoredPosition, puntoObjeto.GetComponent<RectTransform>().anchoredPosition);
            }
            UltimoPuntoObjeto = puntoObjeto;
        }

    }

    private void coneccion_Entre_Puntos(Vector2 posicionPuntoA, Vector2 posicionPuntoB)
    {
        GameObject objetoCirculo = new GameObject("ConecionPuntos", typeof(Image));
        objetoCirculo.transform.SetParent(ContenedorGrafico, false);
        objetoCirculo.GetComponent<Image>().color = new Color32( 46, 206, 242, 255);

        Vector2 direccion = (posicionPuntoB - posicionPuntoA).normalized;
        float distancia = Vector2.Distance(posicionPuntoA, posicionPuntoB);

        RectTransform rectTransform = objetoCirculo.GetComponent<RectTransform>();
        rectTransform.sizeDelta = new Vector2(distancia, 10f);
        rectTransform.anchorMin = new Vector2(0, 0);
        rectTransform.anchorMax = new Vector2(0, 0);
        rectTransform.anchoredPosition = posicionPuntoA + direccion * distancia * 0.5f;
        float angulo = Mathf.Atan2(direccion.y, direccion.x) * Mathf.Rad2Deg;
        if (angulo < 0) {
            angulo += 360;
        }
        rectTransform.localEulerAngles = new Vector3(0,0, angulo);
    }
}
