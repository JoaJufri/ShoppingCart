﻿using System;
using System.Collections.Generic;
using Negocio;
using Dominio;
using System.Web.Services.Description;
using System.Linq;

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


            switch (criterio)
            {
                case "Marca":
                    foreach (var item in listaArt)
                    {
                        if (item.Marca.ToString().ToUpper().Contains(tbFiltro.Text.ToUpper()))
                        {
                            listaFiltrados.Add(item);
                        }
                    }

                    break;
                case "Categoria":
                    foreach (var item in listaArt)
                    {
                        if (item.Categoria.ToString().ToUpper().Contains(tbFiltro.Text.ToUpper()))
                        {
                            listaFiltrados.Add(item);
                        }
                    }

                    break;
                case "Precio Hasta $":
                    decimal filtro;
                    if (!decimal.TryParse(tbFiltro.Text, out filtro))
                    {
                        lblError.Visible = true;
                        lblError.Text = "Ingrese un valor decimal válido.";
                        return;
                    }
                    
                    lblError.Visible=false;

                    foreach (var item in listaArt)
                    {
                        if (item.Precio <= decimal.Parse(tbFiltro.Text))
                        {
                            listaFiltrados.Add(item);
                        }
                    }

                    listaFiltrados = listaFiltrados.OrderByDescending(listaFiltrados => listaFiltrados.Id).ToList();
                    break;

                default:


                    break;
            }
            listaArt = listaFiltrados;

            if (listaArt.Count <= 0)
            {
                lbListaNula.Visible = true;
            }
            else
            {
                lbListaNula.Visible = false;
            }

        }

        protected void BtEliminar_Click(object sender, EventArgs e)
        {
            
        }
    }
}
