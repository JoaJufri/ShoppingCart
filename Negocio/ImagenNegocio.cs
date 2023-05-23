using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ImagenNegocio
    {
        public List<Imagen> listar(int idArticulo)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, IdArticulo, ImagenUrl from Imagenes where idArticulo = " + idArticulo);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    int v = (int)datos.Lector["Id"];
                    aux.Id = v;
                    aux.IdArticulo = (int)datos.Lector["IdArticulo"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void Agregar(Imagen nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string valores = "values(" + nuevo.IdArticulo + ", '" + nuevo.ImagenUrl + "')";
                datos.setearConsulta("insert into Imagenes (IdArticulo, ImagenUrl)" + valores);
                datos.ejecutarLectura();
                
            }
            catch (Exception ex)
            {   
                throw ex;
            }
            finally { 
                datos.cerrarConexion();
            }
        }


        public void Agregar(List<string> lista, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                foreach (var item in lista)
                {
                    string valores = "values (" + idArticulo + " ,'" + item + "')";
                    datos.setearConsulta("INSERT INTO IMAGENES (IdArticulo, ImagenUrl)" + valores);
                    datos.ejecutarAccion();
                    datos.cerrarConexion();
                }
            }
            catch (Exception ex)
            {

               throw ex;
            }
            finally { 
                datos.cerrarConexion(); 
            }
        }


        public void Vaciar(int idArticulo) {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM IMAGENES WHERE IdArticulo=" + idArticulo);
                datos.ejecutarLectura();
            }
            catch (Exception ex) 
            {

                throw ex;
            }
            finally { 
                datos.cerrarConexion(); 
            }
        }


        public void modificar(Imagen nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update Imagenes set IdArticulo = @IdArticulo, ImagenUrl = @UrlImagen where Id = @Id");
                datos.setearParametro("@IdArticulo", nuevo.IdArticulo);
                datos.setearParametro("@Id", nuevo.Id);
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { 
                datos.cerrarConexion(); 
            }
        }


        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from Imagenes where Id = " + id);
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { 
                datos.cerrarConexion(); 
            }
        }

    }
}
