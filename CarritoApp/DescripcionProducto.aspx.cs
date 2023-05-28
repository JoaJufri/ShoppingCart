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
        public int id_art { set; get; }
        public int indiceArt { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {

            id_art = int.Parse(Request.QueryString["Id"]);
            listaArt = negocio.listar();
            listaImg = imgNegocio.listar(id_art);

            //BUSCAR INDICE                    
            int indice = 0;
            foreach (var art in listaArt)
            {

                if (art.Id == id_art)
                {
                    indiceArt = indice;
                }
                indice ++;
            }

            try
            {
                lblDescripcion.Text = listaArt[indiceArt].Descripcion.ToString();
            }
            catch{
                lblDescripcion.Text = "Sin descripción";
            }
            try
            {
                txtMarca.Text = listaArt[indiceArt].Marca.Descripcion.ToString();
            }
            catch
            {
                lblDescripcion.Text = "Sin especificar";
            }

            
        }

       
    }
}