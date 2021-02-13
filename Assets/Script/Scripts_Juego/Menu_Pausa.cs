using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu_Pausa : MonoBehaviour
{
    public static bool Juego_En_Pausa = false;
    public GameObject Menu_Pausa_UI;
    public GameObject btn_Pausa;

    public void Continuar_Juego()
    {
        Menu_Pausa_UI.SetActive(false);
        btn_Pausa.SetActive(true);

        Time.timeScale = 1f;
        Juego_En_Pausa = false;
    }

    public void Repetir_Nivel()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void Pausar_Juego()
    {
        Menu_Pausa_UI.SetActive(true);
        btn_Pausa.SetActive(false);

        Time.timeScale = 0f;
        Juego_En_Pausa = true;
    }

    public void Volver_Menu()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene("Menu");
    }
}
