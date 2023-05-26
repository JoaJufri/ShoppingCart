<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DescripcionProducto.aspx.cs" Inherits="CarritoApp.DescripcionProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="CSS/DescripcionProducto.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container text-center">      
      <div class="row">

        <div class="col-1">

        </div>

        <div class="col-6">

           <div id="carouselExampleIndicators" class="carousel slide">
              
              <div class="carousel-inner">    
                
               <%
                   int i = 0;
                   int j = 0;
                   
               %>   
                  <div class="carousel-indicators">
               <%

                    foreach (var urlImg in listaImg)
                    {
                        if (j == 0)
                        { %>      
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>

                        <%}
                        else { %>      
                             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%= j %>" aria-label="Slide <%= (j+1) %>"></button>

                        <% } %>
                        <% j += 1; %>                            
                    <% }

                 %>   
                  </div>
                 <%

                   foreach (var urlImg in listaImg)
                   {
                        if (i == 0)
                        { %>      
                            <div class="carousel-item active">
                                <img src="<%=urlImg %>" style="height: 400px; overflow:hidden" alt="<%=listaArt[0].Nombre %>">
                            </div>
                      <%}
                        else { %>      
                            <div class="carousel-item">
                                <img src="<%=urlImg %>" style="height: 400px; overflow:hidden" alt="<%=listaArt[0].Nombre %>">
                            </div>
                     <% } %>
                     <% i += 1; %>                            
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
               <div class="col-1">            
           </div>    

      </div>
    </div>

</asp:Content>
