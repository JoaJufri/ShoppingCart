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
        ArticuloNegocio negocio = new ArticuloNegocio();
        public List<Articulo> articulos;
        public ImagenNegocio imagen = new ImagenNegocio();
        public List<CarritoCantidad> cantidad = new List<CarritoCantidad>();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Carrito"] = negocio.listarconSP();
            Session["Cantidades"] = cantidad;
            ((List<CarritoCantidad>)Session["Cantidades"]).Add(new CarritoCantidad(3, 3));
            ((List<CarritoCantidad>)Session["Cantidades"]).Add(new CarritoCantidad(5, 9));
            ((List<CarritoCantidad>)Session["Cantidades"]).Add(new CarritoCantidad(2, 11));

            if (Session["Carrito"] == null)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "No hay productos en el carrito";
            }
            else
            {
                articulos = (List<Articulo>)Session["Carrito"];
                lblMessage.Visible = false;             
            }
        }
        public int ObtenerCantidadArticulo(int idArticulo)
        {
            List<CarritoCantidad> cantidades = (List<CarritoCantidad>)Session["Cantidades"];
            if (cantidades != null)
            {
                CarritoCantidad cantidadItem = cantidades.Find(c => c.IdArticulo == idArticulo);
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
