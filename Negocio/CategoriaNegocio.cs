using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            List<Categoria> lista = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, Descripcion from Categorias");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

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
        public void Agregar(string descripcion)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO CATEGORIAS (Descripcion) values ('"+descripcion+"')");
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { datos.cerrarConexion(); }
        }

        public void Eliminar(string v)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from Categorias where Descripcion = '" + v + "'");
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { datos.cerrarConexion(); }
        }
        public bool anexadoArticulo(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select * from Articulos where IdCategoria = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.cerrarConexion(); }
        }
    }
}
