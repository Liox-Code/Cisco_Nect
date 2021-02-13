using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovimientoJugador : MonoBehaviour
{
    public float velocidadMovimiento = 5f;

    private Rigidbody2D rbHeroe;
    public Animator animador;

    Vector2 movimiento;

    private void Start()
    {
        rbHeroe = GetComponent<Rigidbody2D>();
        animador = GetComponent<Animator>();
    }

    void Update()
    {
        movimiento.x = Input.GetAxisRaw("Horizontal");
        movimiento.y = Input.GetAxisRaw("Vertical");

        animador.SetFloat("Horizontal", movimiento.x);
        animador.SetFloat("Vertical", movimiento.y);
        animador.SetFloat("Velocidad", movimiento.sqrMagnitude);
    }

    private void FixedUpdate()
    {
        rbHeroe.MovePosition(rbHeroe.position + movimiento * velocidadMovimiento * Time.fixedDeltaTime);
    }
}
