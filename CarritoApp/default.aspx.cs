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

        protected void btnVermas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx#title");
        }

        protected void btFiltro_Click(object sender, EventArgs e)
        {   
            //Filtros

            //string criterio = ddl_Criterio.SelectedItem.Text;
            //if (criterio == "Marca") {
                
                
            //}
        }
    }
}