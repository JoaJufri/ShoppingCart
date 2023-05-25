<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DescripcionProducto.aspx.cs" Inherits="CarritoApp.DescripcionProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container text-center">      
      <div class="row">

        <div class="col-2">col-2</div>

        <div class="col-6">

           <div id="carouselExampleIndicators" class="carousel slide">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner" style="height: 450px;">
                <div class="carousel-item active">
                  <img src="https://c.pxhere.com/images/0a/f6/768da51235735cf64d0208ba8abf-1666380.jpg!d" style="height: 450px; overflow:hidden" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://c.pxhere.com/photos/09/16/smartphone_mobile_phone_touch_finger_touch_screen_continents_earth_globe-893132.jpg!d" style="height: 450px; overflow:hidden" alt="...">
                </div>
                <div class="carousel-item", "object-fit-cover border rounded">
                  <img src="https://c.pxhere.com/images/60/21/3da5e8a1a867aebefd10758c01f6-1601892.jpg!d" class="d-block w-100" style="height: 450px; overflow:hidden" alt="...">
                </div>
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
                <h2 style="float:left;">Nombre del artículo</h2>
                <asp:Label ID="lblDescripcion" runat="server" Text="Acá va a ir la descripción del artículo" style="float:left;"></asp:Label>
            

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
