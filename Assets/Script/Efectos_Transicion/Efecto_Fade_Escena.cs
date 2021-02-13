using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Efecto_Fade_Escena : MonoBehaviour
{
    public Image Fondo_Negro;
    public AnimationCurve animacion_curva;

    private void Start()
    {
        StartCoroutine(FadeIn());
    }

    public void Cambiar_Escene_Efecto_Fade(string nombre_Escena)
    {
        StartCoroutine(FadeOut(nombre_Escena));
    }

    IEnumerator FadeIn()
    {
        float tiempo = 1f;

        while (tiempo > 0f)
        {
            tiempo -= Time.deltaTime;
            float a = animacion_curva.Evaluate(tiempo);
            Fondo_Negro.color = new Color(0f, 0f, 0f, a);
            yield return 0;
        }
    }

    IEnumerator FadeOut(string nombre_Escena)
    {
        float tiempo = 0f;

        while (tiempo < 1f)
        {
            tiempo += Time.deltaTime;
            float a = animacion_curva.Evaluate(tiempo);
            Fondo_Negro.color = new Color(0f, 0f, 0f, a);
            yield return 0;
        }

        SceneManager.LoadScene(nombre_Escena);
    }
}
