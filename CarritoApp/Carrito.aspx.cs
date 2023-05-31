using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web;
using System.Web.UI;
using Dominio;
using Negocio;
using System.Web.UI.WebControls;

namespace CarritoApp
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected decimal totalInicial = 0;
        public List<Articulo> articulos = new List<Articulo>();
        public ImagenNegocio imagen = new ImagenNegocio();
        public List<CarritoCantidad> listaID = new List<CarritoCantidad>();
        public List<CarritoSession> carritoSession = new List<CarritoSession>();

        protected void Page_Load(object sender, EventArgs e)
        {
            listaID = (List<CarritoCantidad>)Session["carritoCompra"];
            if (!IsPostBack)
            {

                if (listaID != null)
                {
                    carritoSession.Clear();
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    ImagenNegocio imagenNego = new ImagenNegocio();

                    foreach (var item in listaID)
                    {
                        articulos.Add(negocio.obtenerArticulo(item.IdArticulo));
                    }

                    foreach (var item2 in articulos)
                    {
                        CarritoSession carrito = new CarritoSession();
                        carrito.Id = item2.Id;
                        carrito.Nombre = item2.Nombre;
                        carrito.Precio = item2.Precio;
                        carrito.Descripcion = item2.Descripcion;
                        carrito.Codigo = item2.Codigo;
                        carrito.Cantidad = ObtenerCantidadArticulo(item2.Id);
                        carrito.PrimeraImagen = (imagenNego.listar(item2.Id))[0].ImagenUrl;
                        carritoSession.Add(carrito);
                    }

                    gvCarrito.DataSource = carritoSession;
                    gvCarrito.DataBind();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "No hay productos en el carrito";
                }

            }

        }

        public int ObtenerCantidadArticulo(int idArticulo)
        {
            if (listaID != null)
            {
                CarritoCantidad cantidadItem = listaID.Find(c => c.IdArticulo == idArticulo);
                if (cantidadItem != null)
                {
                    return cantidadItem.Cantidad;
                }
            }

            return 1; // Valor predeterminado de 1 si no se encuentra la cantidad
        }

        protected void btnPasarPagar_Click(object sender, EventArgs e)
        {
            string mensaje = "Esta funcionalidad estará disponible en una futura actualización.";
            ScriptManager.RegisterStartupScript(this, GetType(), "MostrarMensaje", $"alert('{mensaje}');", true);
        }
        protected void gvCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                if (rowIndex >= 0 && rowIndex < listaID.Count)
                {
                    listaID.RemoveAt(rowIndex);
                }

                // Realiza las acciones adicionales que necesites después de eliminar el elemento

                // Vuelve a cargar los datos en el GridView o realizar cualquier actualización necesaria
                Response.Redirect(Request.RawUrl);
            }
        }

    }
}

