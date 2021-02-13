using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu_Principal : MonoBehaviour
{
    public void PlayJuego()
    {
        SceneManager.LoadScene("Nivel01");
    }

    public void SalirJuego()
    {
        Application.Quit();
    }
}
