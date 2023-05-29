using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public List <CarritoItem> ListaCarrito{ get; set; }

        public void AgregarItem(int idArt, int cant)
        {
            bool idArticuloExistente = false;

            foreach (var item in ListaCarrito)
            {
                if (item.IdArticulo == idArt)
                {
                    item.Cantidad += cant;
                    idArticuloExistente = true;
                }
            }
            if (idArticuloExistente == false)
            {
                CarritoItem item = new CarritoItem();
                ListaCarrito.Add(item);
            }
        }
    }
}
