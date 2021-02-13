using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using SimpleJSON;

public class ranckingManager : MonoBehaviour
{

    public GameObject puntos_Prefab;
    public Transform puntos_Padre;

    private List<Rancking> rancking = new List<Rancking>();

    void Start()
    {
        StartCoroutine(IniciarSesion("https://nerbi.digital/elmono/ranckingManager.php", "1", "1"));
    }

    private void OnEnable()
    {
        StartCoroutine(ActualizarPuntuacionRanking("https://nerbi.digital/elmono/ranckingManager.php", Global_Session.Nombre_Usuario, Global_Session.Contraseña, Global_Session.Nombre, Global_Session.Apellido, Global_Session.Puntos));
    }

    IEnumerator ActualizarPuntuacionRanking(string uri, string nombre_cuenta, string contraseña, string nombre, string apellido, string puntos)
    {
        WWWForm form = new WWWForm();
        form.AddField("nombre_cuenta", nombre_cuenta);
        form.AddField("contraseña", contraseña);
        form.AddField("nombre", nombre);
        form.AddField("apellido", apellido);
        form.AddField("puntos", puntos);
        form.AddField("ActualizarPuntuacionRanking", "ActualizarPuntuacionRanking");
        using (UnityWebRequest webRequest = UnityWebRequest.Post(uri, form))
        {
            yield return webRequest.SendWebRequest();

            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            if (webRequest.isNetworkError)
            {
                Debug.Log(pages[page] + ": Error: " + webRequest.error);
            }
            else
            {
                Debug.Log(webRequest.downloadHandler.text);
            }
            StartCoroutine(BuscarRancking("https://nerbi.digital/elmono/ranckingManager.php"));
        }
    }

    IEnumerator BuscarRancking(string uri)
    {
        WWWForm form = new WWWForm();
        form.AddField("mostrarRanking", "mostrarRanking");
        using (UnityWebRequest webRequest = UnityWebRequest.Post(uri, form))
        {
            yield return webRequest.SendWebRequest();

            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            if (webRequest.isNetworkError)
            {
                Debug.Log(pages[page] + ": Error: " + webRequest.error);
            }
            else
            {

                try
                {
                    rancking.Clear();
                    //Debug.Log(pages[page] + ":\nReceived: " + webRequest.downloadHandler.text);
                    JSONArray listaRanking = JSON.Parse(webRequest.downloadHandler.text) as JSONArray;

                    for (int i = 0; i < listaRanking.Count; i++)
                    {
                        string nombre = listaRanking[i].AsObject["nombre_cuenta"];
                        int puntaje = listaRanking[i].AsObject["puntos"];
                        rancking.Add(new Rancking(nombre, puntaje));
                    }

                    mostrar_rancking();
                }
                catch (System.Exception e)
                {
                    Debug.Log("Error " + e);
                }
            }
        }
    }

    void mostrar_rancking()
    {
        foreach (Transform child in puntos_Padre)
        {
            Destroy(child.gameObject);
        }
        for (int i = 0; i < rancking.Count; i++)
        {
            GameObject temporal_puntos_prefab = Instantiate(puntos_Prefab) as GameObject;
            temporal_puntos_prefab.transform.localScale = new Vector3(1, 1, 1);
            temporal_puntos_prefab.transform.SetParent(puntos_Padre, false);
            Rancking temporal_rancking = rancking[i];
            temporal_puntos_prefab.GetComponent<rancking_Script>().poner_Datos("#" + (i + 1).ToString(), temporal_rancking.NombreCuenta, temporal_rancking.Puntaje.ToString());

        }
    }

    IEnumerator IniciarSesion(string uri, string nombre_cuenta, string contraseña)
    {
        WWWForm form = new WWWForm();
        form.AddField("nombre_cuenta", nombre_cuenta);
        form.AddField("contraseña", contraseña);
        form.AddField("iniciarSecion", "iniciarSecion");

        using (UnityWebRequest webRequest = UnityWebRequest.Post(uri,form))
        {
            yield return webRequest.SendWebRequest();

            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            if (webRequest.isNetworkError || webRequest.isHttpError)
            {
                Debug.Log(pages[page] + ": Error: " + webRequest.error);
            }
            else
            {

                try
                {
                    //Debug.Log(pages[page] + ":\nReceived: " + webRequest.downloadHandler.text);
                    JSONArray listaRanking = JSON.Parse(webRequest.downloadHandler.text) as JSONArray;

                    for (int i = 0; i < listaRanking.Count; i++)
                    {
                        string nombre = listaRanking[i].AsObject["nombre_cuenta"];
                        Debug.Log("NOMBRE : "+ nombre);
                    }
                }
                catch (System.Exception e)
                {
                    Debug.Log("Error iniciar Sesion" + e);
                }
            }
        }
    }
}
