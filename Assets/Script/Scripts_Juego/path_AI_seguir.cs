using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Pathfinding;

public class path_AI_seguir : MonoBehaviour
{

    public Transform objetivo;

    public float velocidad = 200f;
    public float siguiente_Punto_Distancia = 1.2f;

    Path path;
    int punto_Actuall = 0;
    bool alcanzado_Objetivo = false;

    Seeker buscador;
    Rigidbody2D rb_Heroe;


    void Start()
    {
        buscador = GetComponent<Seeker>();
        rb_Heroe = GetComponent<Rigidbody2D>();

        InvokeRepeating("ActualizarPath", 0f, 0.5f);
    }

    void ActualizarPath()
    {
        if (buscador.IsDone())
        {
            buscador.StartPath(rb_Heroe.position, objetivo.position, Path_Completado);
        }
    }

    void Path_Completado(Path p)
    {
        if (!p.error)
        {
            path = p;
            punto_Actuall = 0;
        }
    }

    private void FixedUpdate()
    {
        if (path == null)
        {
            return;
        }

        if (punto_Actuall >= path.vectorPath.Count)
        {
            alcanzado_Objetivo = true;
            return;
        }
        else
        {
            alcanzado_Objetivo = false;
        }

        Vector2 direccion = ((Vector2)path.vectorPath[punto_Actuall] - rb_Heroe.position).normalized;
        Vector2 fuerza = direccion * velocidad * Time.deltaTime;

        rb_Heroe.AddForce(fuerza);

        float distancia = Vector2.Distance(rb_Heroe.position, path.vectorPath[punto_Actuall]);

        if (distancia < siguiente_Punto_Distancia)
        {
            punto_Actuall++;
        }


    }
}
