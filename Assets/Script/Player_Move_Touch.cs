using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Player_Move_Touch : MonoBehaviour
{
    [SerializeField]
    float velocidadMovimiento = 4.0f;

    Rigidbody2D rbPlayer;

    Touch toque;
    Vector3 posicionToque, objetivoDondeMover;
    
    bool moviendo = false;

    float distanciaPreviaAlToquePos, distanciaActualAlToquePos;


    // Start is called before the first frame update
    void Start()
    {
        rbPlayer = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        if (moviendo)
        {
            distanciaActualAlToquePos = (posicionToque - transform.position).magnitude;
        }

        if (Input.touchCount > 0)
        {
            toque = Input.GetTouch(0);

            if (toque.phase == TouchPhase.Began)
            {
                distanciaPreviaAlToquePos = 0;
                distanciaActualAlToquePos = 0;
                moviendo = true;
                posicionToque = Camera.main.ScreenToWorldPoint(toque.position);
                posicionToque.z = 0;
                objetivoDondeMover = (posicionToque - transform.position).normalized;
                rbPlayer.velocity = new Vector2(objetivoDondeMover.x * velocidadMovimiento, objetivoDondeMover.y * velocidadMovimiento);
            }
        }

        if (distanciaActualAlToquePos > distanciaPreviaAlToquePos)
        {
            moviendo = false;
            rbPlayer.velocity = Vector2.zero;
        }

        if (moviendo)
        {
            distanciaPreviaAlToquePos = (posicionToque - transform.position).magnitude;
        }
    }
}
