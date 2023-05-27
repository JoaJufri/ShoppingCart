using System;
using System.Collections.Generic;
using Negocio;
using Dominio;

namespace CarritoApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {   
        public List<Articulo> listaArt { get; set; }
        public List<Imagen> listaImg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArt = negocio.listarconSP();
            
            ImagenNegocio negocioImg = new ImagenNegocio();
            listaImg = new List<Imagen>();
            foreach (Articulo ar in listaArt)
            {
                Imagen aux = new Imagen();
                aux=negocioImg.listar(ar.Id)[0];
                listaImg.Add(aux);
            }
        }
    }
}