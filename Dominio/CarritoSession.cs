using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CarritoSession
    {
        public int Id { set; get; }
        public string Codigo { set; get; }
        public string Nombre { set; get; }
        public string Descripcion { set; get; }
        public decimal Precio { set; get; }
        public Marca Marca { set; get; }
        public Categoria Categoria { set; get; }
        public int Cantidad { set; get; }
        public string PrimeraImagen { set; get; }
    }
}
