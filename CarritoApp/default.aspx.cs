using System;
using System.Collections.Generic;
using Negocio;
using Dominio;
using System.Web.Services.Description;

namespace CarritoApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulo> listaArt { get; set; }
        public List<Articulo> listaFiltrados { get; set; }
        public List<Imagen> listaImg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArt = new List<Articulo>();
            listaFiltrados = new List<Articulo>();
            listaArt = negocio.listarconSP();

            if (!IsPostBack)
            {
                listaArt = negocio.listarconSP();
            }

            ImagenNegocio negocioImg = new ImagenNegocio();
            listaImg = new List<Imagen>();
            foreach (Articulo ar in listaArt)
            {
                Imagen aux = new Imagen();
                aux = negocioImg.listar(ar.Id)[0];
                listaImg.Add(aux);
            }
        }

        protected void btnVermas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx#title");
        }

        protected void btFiltro_Click(object sender, EventArgs e)
        {
            listaFiltrados = new List<Articulo>();
            string criterio = ddl_Criterio.SelectedItem.Text;
            if (criterio == "Marca")
            {
                foreach (var item in listaArt)
                {
                    if (item.Marca.ToString() == tbFiltro.Text.ToString())
                    {
                        listaFiltrados.Add(item);
                    }
                }
                listaArt = listaFiltrados;

            }
            
            //Filtros


            //Si no hay coincidencias, devuelve la lista original
            //if (listaFiltrados.Count <= 0)
            //{
            //    listaArt = listaFiltrados; 
            //}

        }
    }
}
