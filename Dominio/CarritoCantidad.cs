using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CarritoCantidad
    {
        public int IdArticulo { get; set; }
        public int Cantidad { get; set; }

        public CarritoCantidad(int idArticulo, int cantidad)
        {
            IdArticulo = idArticulo;
            Cantidad = cantidad;
        }
        public CarritoCantidad() { }
        
    }
}
