using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

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

            if (listaArt[indiceArt].Descripcion.ToString() != null && listaArt[indiceArt].Descripcion.ToString().Length != 0)
            {
                lblDescripcion.Text = listaArt[indiceArt].Descripcion.ToString();
            }
            else{
                lblDescripcion.Text = "Sin descripción";
            }

            if (listaArt[indiceArt].Marca.ToString() != null && listaArt[indiceArt].Marca.ToString().Length != 0)
            {
                txtMarca.Text = listaArt[indiceArt].Marca.Descripcion.ToString();
            }
            else
            {                
                lblDescripcion.Text = "Sin especificar";
            }


        }

        public bool validarCampoCantidad()
        {
            if (string.IsNullOrEmpty(txtCantidad.Text))
            {
                LabelMensaje.Text = "Debes completar el campo número.";
                return false;
            }
            else
            {
                return true;
            }

        }


        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (!validarCampoCantidad())
            {
                return;
            }
                 
            CarritoCantidad carritoItem = new CarritoCantidad();
            List<CarritoCantidad> miCarrito = new List<CarritoCantidad>();            

            carritoItem.Cantidad = int.Parse(txtCantidad.Text);
            carritoItem.IdArticulo = int.Parse(Request.QueryString["Id"]);            
              
            
            if (Session["CarritoCompra"] == null)
            {
                miCarrito.Add(carritoItem);
                Session.Add("carritoCompra", miCarrito);
            }
            else
            {
                agregarItem(carritoItem);
            }
            
            Response.Redirect("Carrito.aspx", false);
        } 
        
        protected void btnAgregarYSeguir_Click(object sender, EventArgs e)
        {
            if (!validarCampoCantidad())
            {
                return;
            }
            CarritoCantidad carritoItem = new CarritoCantidad();
            List<CarritoCantidad> miCarrito = new List<CarritoCantidad>();

            carritoItem.Cantidad = int.Parse(txtCantidad.Text);
            carritoItem.IdArticulo = int.Parse(Request.QueryString["Id"]);


            if (Session["CarritoCompra"] == null)
            {
                miCarrito.Add(carritoItem);
                Session.Add("carritoCompra", miCarrito);
            }
            else
            {
                agregarItem(carritoItem);
            }


            Response.Redirect("Default.aspx#title", false);
        }

        public void agregarItem(CarritoCantidad carritoItem) {
            List<CarritoCantidad> miCarrito = new List<CarritoCantidad>();
            miCarrito = (List<CarritoCantidad>)Session["carritoCompra"];

            bool idArticuloExistente = false;

            foreach (var item in miCarrito)
            {
                if (item.IdArticulo == carritoItem.IdArticulo)
                {
                    item.Cantidad += carritoItem.Cantidad;                    
                    idArticuloExistente = true;                   
                }
            }
            if (idArticuloExistente == false)
            {
                miCarrito.Add(carritoItem);
            }

            Session["carritoCompra"] = miCarrito;
        }

        


    }
}