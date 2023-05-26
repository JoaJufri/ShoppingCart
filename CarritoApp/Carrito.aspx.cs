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
        ArticuloNegocio negocio = new ArticuloNegocio();
        public List<Articulo> articulos;
        public ImagenNegocio imagen = new ImagenNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Carrito"] = negocio.listarconSP();

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
    }
}
