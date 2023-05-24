using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace CarritoApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {   
        public List<Articulo> listaArt { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            dgvArticulos.DataSource = negocio.listarconSP();
            dgvArticulos.DataBind();
            
        }
    }
}