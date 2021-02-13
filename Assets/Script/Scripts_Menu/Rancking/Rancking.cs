using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

class Rancking
{
    public string NombreCuenta { get; set; }
    public int Puntaje { get; set; }

    public Rancking(string nombreCuenta, int puntaje)
    {
        this.NombreCuenta = nombreCuenta;
        this.Puntaje = puntaje;
    }
}
