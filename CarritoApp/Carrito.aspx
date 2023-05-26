<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoApp.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .item-list {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .item-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 80%;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .item-image {
            max-width: 100px;
            margin-right: 10px; /* Agregar margen derecho */
        }
        .item-details {
            display: flex;
            align-items: center;
            flex-grow: 1;
            margin-right: 20px;
        }
        .item-name {
            margin-right: 10px;
        }
        .item-quantity input{
            max-width:4rem;
        }
        .item-price,
        .item-quantity,
        .item-total {
            margin-left: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".item-quantity input").on("input", function () {
                var quantity = $(this).val();
                var price = parseFloat($(this).closest(".item-row").find(".item-price").text().replace("$", ""));
                var total = quantity * price;
                $(this).closest(".item-row").find(".item-total").text("Total: $" + total.toFixed(2));
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Carrito de Compras</h1>

    <div id="carrito">
        <div id="ContentCarrito">
            <asp:Label Visible="false" runat="server" ID="lblMessage"></asp:Label>
            <div class="item-list">
                <% foreach (var articulo in articulos)
                {
                    var imagenes = imagen.listar(articulo.Id);
                    string imageUrl = "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
                    if (imagenes.Count > 0 && !string.IsNullOrEmpty(imagenes[0].ImagenUrl))
                    {
                        imageUrl = imagenes[0].ImagenUrl;
                    }
                %>
                    <div class="item-row">
                        <img src="<%= imageUrl %>" class="item-image" />
                        <div class="item-details">
                            <span class="item-name"><%= articulo.Nombre %></span>
                            <span class="item-price">$<%= articulo.Precio %></span>
                        </div>
                        <div class="item-quantity">
                            <input type="number" min="1" value="1" />
                        </div>
                        <span class="item-total">Total: $<%= articulo.Precio %></span>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
