<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DescripcionProducto.aspx.cs" Inherits="CarritoApp.DescripcionProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container text-center">      
      <div class="row">

        <div class="col-2">col-2</div>

        <div class="col-6">

           <div id="carouselExampleIndicators" class="carousel slide">
              
              <div class="carousel-inner" style="height: 450px; background-color:black">                     
                
               <%
                   int tamLista = listaImg.Count();
                   int ultimoItem = tamLista - 1;

                   foreach (var urlImg in listaImg)
                   {
               %>                    
                        <div class="carousel-item active">
                            <img src="<%=urlImg %>" style="height: 400px; overflow:hidden" alt="<%=listaArt[0].Nombre %>">
                        </div>
                <% }%> 

              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>

        </div>

        <div class="col-4">
            <div class="row">
                <h2 style="float:left;"><%=listaArt[0].Nombre %></h2>
                <asp:Label ID="lblDescripcion" runat="server" Text="" style="float:left;"></asp:Label>
            

            </div>
            <div class="row">
                <asp:Label ID="lblMarca" runat="server" Text="Marca:"></asp:Label><asp:Label ID="txtMarca" runat="server" Text="Nombre de la marca" ></asp:Label>
            </div>
            <div  class="row">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar al carrito" CssClass="btn btn-primary" />
            </div>
            </div>        

      </div>
    </div>

</asp:Content>
