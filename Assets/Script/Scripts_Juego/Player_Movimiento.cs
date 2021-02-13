using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Pathfinding;
using UnityEngine.EventSystems;

public class Player_Movimiento : MonoBehaviour
{
    
    Rigidbody2D rb_Heroe;

    private float siguiente_Punto_Distancia = 0.1f;
    private float velocidadMovimiento = 4.0f;

    Path path;
    Touch toque;
    public Animator animacion_Jugador;

    Vector3 posicionToque, objetivoDondeMover, posicionSigObjetivo;

    int punto_Actuall = 0;

    bool alcanzado_Objetivo = false;

    Seeker buscador;

    [SerializeField]
    private int ordenSorting = 5000;
    [SerializeField]
    public int offset = 0;
    public Renderer Heroe_Renderer;

    void Start()
    {
        buscador = GetComponent<Seeker>();
        rb_Heroe = GetComponent<Rigidbody2D>();
    }

    void ActualizarPath()
    {
        if (buscador.IsDone())
        {
            buscador.StartPath(rb_Heroe.position, posicionToque, Path_Completado);
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
        if (Input.touchCount > 0)
        {
            toque = Input.GetTouch(0);

            if (toque.phase == TouchPhase.Ended)
            {
                if (!EventSystem.current.IsPointerOverGameObject(toque.fingerId))
                {
                    //Debug.Log("Toque**************************************************");
                    //CancelInvoke("ActualizarPath");
                    rb_Heroe.velocity = Vector2.zero;
                    posicionToque = Camera.main.ScreenToWorldPoint(toque.position);
                    posicionToque.z = 0;
                    //InvokeRepeating("ActualizarPath", 0f, 0.5f);
                    buscador.StartPath(rb_Heroe.position, posicionToque, Path_Completado);
                }
            }
        }

        if (path == null)
        {
            return;
        }

        if (punto_Actuall >= path.vectorPath.Count)
        {
            rb_Heroe.velocity = Vector2.zero;
            animacion_Jugador.SetFloat("Velocidad", 0);
            alcanzado_Objetivo = true;
            return;
        }
        else
        {
            alcanzado_Objetivo = false;
        }

        posicionSigObjetivo = new Vector3(path.vectorPath[punto_Actuall].x, path.vectorPath[punto_Actuall].y, 0);
        objetivoDondeMover = (posicionSigObjetivo - transform.position).normalized;

        rb_Heroe.velocity = new Vector2(objetivoDondeMover.x * velocidadMovimiento, objetivoDondeMover.y * velocidadMovimiento);

        //Debug.Log("Velocidad =====" + rb_Heroe.velocity);
        //Debug.Log(rb_Heroe.velocity.x);

        animacion_Jugador.SetFloat("Horizontal", rb_Heroe.velocity.x);
        animacion_Jugador.SetFloat("Vertical", rb_Heroe.velocity.y);
        animacion_Jugador.SetFloat("Velocidad",1);

        float distancia = Vector2.Distance(rb_Heroe.position, path.vectorPath[punto_Actuall]);

        Heroe_Renderer.sortingOrder = (int)(ordenSorting - rb_Heroe.position.y - offset);

        if (distancia < siguiente_Punto_Distancia)
        {
            punto_Actuall++;
        }
    }
}
