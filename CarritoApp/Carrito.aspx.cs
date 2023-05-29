using System;
using System.Collections.Generic;
using System.Web.UI;
using Dominio;
using Negocio;

namespace CarritoApp
{
    public partial class Carrito : System.Web.UI.Page
    {
        // Para probar
        protected decimal totalInicial = 0;
        public List<Articulo> articulos = new List<Articulo>();
        public ImagenNegocio imagen = new ImagenNegocio();
        public List<CarritoCantidad> listaID = new List<CarritoCantidad>();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            listaID = null;
            listaID = (List<CarritoCantidad>)Session["carritoCompra"];
            
            if (listaID != null)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                foreach (var item in listaID)
                {
                    articulos.Add(negocio.obtenerArticulo(item.IdArticulo));
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "No hay productos en el carrito";
            }
        }
        public int ObtenerCantidadArticulo(int idArticulo)
        {
            if (listaID != null)
            {
                CarritoCantidad cantidadItem = listaID.Find(c => c.IdArticulo == idArticulo);
                if (cantidadItem != null)
                {
                    return cantidadItem.Cantidad;
                }
            }

            return 1; // Valor predeterminado de 1 si no se encuentra la cantidad
        }

        protected void btnPasarPagar_Click(object sender, EventArgs e)
        {

        }
    }
}
