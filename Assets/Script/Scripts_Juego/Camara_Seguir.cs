using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Camara_Seguir : MonoBehaviour
{
    [SerializeField]
    private GameObject Objetivo_Seguir;
    [SerializeField]
    private Vector3 Posicion_Objetivo;
    [SerializeField]
    private float Velocidad_Camara = 4.0f;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Posicion_Objetivo = new Vector3(Objetivo_Seguir.transform.position.x, Objetivo_Seguir.transform.position.y, this.transform.position.z);
        this.transform.position = Vector3.Lerp(this.transform.position, Posicion_Objetivo, Time.deltaTime * Velocidad_Camara);
    }
}
