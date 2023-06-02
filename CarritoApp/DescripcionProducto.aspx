<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DescripcionProducto.aspx.cs" Inherits="CarritoApp.DescripcionProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/DescripcionProducto.css" rel="stylesheet" type="text/css" />   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="title">
            <h1 class="text-center">Detalle del artículo</h1>
    </div>
    <div class="container text-center">      
      <div class="row principal">

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
                   if (listaImg.Count() > 0)
                   {
                       foreach (var urlImg in listaImg)
                       {
                           if (j == 0)
                           { %>      
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>

                            <%}
                                else
                                { %>      
                                 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%= j %>" aria-label="Slide <%= (j + 1) %>"></button>

                            <% } %>
                            <% j += 1; %>                            
                     <%}
                   }
                 %>   
                  </div>
                 <%
                if (listaImg.Count() > 0)
                {
                   foreach (var urlImg in listaImg)
                   {
                        if (i == 0)
                        { %>      
                            <div class="carousel-item active">
                                <img src="<%=urlImg %>" alt="<%=listaArt[indiceArt].Nombre %>" onerror="this.src='https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d'">
                            </div>
                      <%}
                        else { %>      
                            <div class="carousel-item">
                                <img src="<%=urlImg %>"  alt="<%=listaArt[indiceArt].Nombre %>" onerror="this.src='https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d'">
                            </div>
                     <% } %>
                     <% i += 1; %>                            
                <% }

                }
                else
                {
                            %>
                    <div class="carousel-item active">
                        <img src="https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d" alt="<%=listaArt[indiceArt].Nombre %>">
                    </div>
                <%
                }
               %> 

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
                    <h2><%=listaArt[indiceArt].Nombre %></h2>
                    <asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label>    
                </div>
                <div class="row">
                     <hr />
                    <p>
                        <asp:Label ID="lblMarca" runat="server" Text="Marca:"></asp:Label>
                        <asp:Label ID="txtMarca" runat="server" Text="Nombre de la marca" ></asp:Label>
                    </p>
                    
                </div>
                 <div class="row">
                     
                     
                </div>
                <div  class="row">
                    <hr />
                    <p>
                        <asp:Label ID="lblcantidad" runat="server" Text="Cantidad:"></asp:Label>
                        <asp:TextBox ID="txtCantidad" type="number" min="1" runat="server"></asp:TextBox>                        
                     </p>
                    <p>
                        <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                    </p>

                    <asp:Button ID="btnComprar" runat="server" Text="IR A COMPRAR" OnClick="btnComprar_Click" CssClass="btn btn-primary" />
                    
                    <asp:Button ID="btnAgregarYSeguir" runat="server" Text="AGREGAR Y SEGUIR COMPRANDO" OnClick="btnAgregarYSeguir_Click" CssClass="btn btn-primary" />
                                      
                </div>
           </div>    

           <div class="col-1">            
           </div>    

      </div>
    </div>

</asp:Content>
