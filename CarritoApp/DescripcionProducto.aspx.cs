using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarritoApp
{
    public partial class DescripcionProducto : System.Web.UI.Page
    {

        Negocio.ArticuloNegocio negocio = new Negocio.ArticuloNegocio();
        Negocio.ImagenNegocio imgNegocio = new Negocio.ImagenNegocio();
        Negocio.MarcaNegocio marcaNegocio = new Negocio.MarcaNegocio();
        public List<Dominio.Articulo> listaArt { set; get; }
        public List<Dominio.Imagen> listaImg { set; get; }
        public List<Dominio.Marca> ListaMarca { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {

            listaArt = negocio.listar();
            listaImg = imgNegocio.listar(listaArt[0].Id);
            lblDescripcion.Text = listaArt[0].Descripcion.ToString();
            txtMarca.Text = listaArt[0].Marca.Descripcion.ToString();
       

        }
    }
}