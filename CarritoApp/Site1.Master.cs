using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarritoApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected int ObtenerCantidadCarrito()
        {
            List<CarritoCantidad> listaID = (List<CarritoCantidad>)Session["carritoCompra"];
            int cantidad = 0;
            if (listaID != null)
            {
                cantidad = listaID.Count;
                return cantidad;
            }
            return 0;
        }
    }
}