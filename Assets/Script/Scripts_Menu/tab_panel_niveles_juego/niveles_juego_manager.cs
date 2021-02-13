using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class niveles_juego_manager : MonoBehaviour
{
    public GameObject txt_nombre_nivel;
    public GameObject txt_descripcion_nivel;
    public GameObject btn_jugar_play;

    public Efecto_Fade_Escena Efecto_Fade;

    public void poner_datos(string nombre_nivel, string descripcion_nivel)
    {
        txt_nombre_nivel.GetComponent<Text>().text = nombre_nivel;
        txt_descripcion_nivel.GetComponent<Text>().text = descripcion_nivel;

        UnityEngine.Events.UnityAction ir_escena_juego = () => 
        {
            Global_Session.Nombre_Nivel = nombre_nivel;
            Efecto_Fade.Cambiar_Escene_Efecto_Fade(nombre_nivel);
        };

        btn_jugar_play.GetComponent<Button>().onClick.AddListener(ir_escena_juego);
    }
}
