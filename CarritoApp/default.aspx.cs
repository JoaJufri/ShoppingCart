using System;
using System.Collections.Generic;
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
            listaArt = negocio.listarconSP();
            
        }
    }
}