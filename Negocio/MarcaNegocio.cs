using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, Descripcion from Marcas");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Marca aux = new Marca();
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
                datos.setearConsulta("insert into Marcas (Descripcion) values (@descripcion)");
                datos.setearParametro("@descripcion", descripcion);
                datos.ejecutarAccion();
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

        public void Eliminar(string v)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from Marcas where Descripcion = @descripcion");
                datos.setearParametro("@descripcion", v);
                datos.ejecutarAccion();
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
                datos.setearConsulta("select * from Articulos where IdMarca = @id");
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
