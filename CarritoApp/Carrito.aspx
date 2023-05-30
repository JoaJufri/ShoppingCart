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

        .item-quantity input {
            max-width: 4rem;
        }

        .item-price,
        .item-quantity,
        .item-total {
            margin-left: 10px;
        }

        .content-wrapper {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}

.total-section {
    background-color: #f1f1f1;
    padding: 10px;
    text-align: right;
}

.btn-pasar-pagar {
    background-color: #87cefa;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn-pasar-pagar:hover {
    background-color: #5f9ea0;
}

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Calcular el monto total inicial
            calcularTotal();

            // Manejar el evento de cambio de cantidad
            $(".item-quantity input").on("input", function () {
                calcularTotal();
            });

            function calcularTotal() {
                var total = 0;

                // Recorrer cada fila de artículo
                $(".item-row").each(function () {
                    var quantity = parseInt($(this).find(".item-quantity input").val());
                    var price = parseFloat($(this).find(".item-price").text().replace("$", ""));
                    var itemTotal = quantity * price;
                    total += itemTotal;

                    // Actualizar el total de cada artículo
                    $(this).find(".item-total").text("Total: $" + itemTotal.toFixed(2));
                });

                // Actualizar el total general
                $("#lblTotal").text("Total: $" + total.toFixed(2));
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Carrito de Compras</h1>

    <div id="carrito">
        <updatepanel>
            <div id="ContentCarrito">
                <asp:Label Visible="false" runat="server" ID="lblMessage"></asp:Label>
                <div class="item-list">
                    <% 
                        decimal totalInicial = 0;
                        if (articulos != null)
                        {
                            foreach (var articulo in articulos)
                            {
                                var imagenes = imagen.listar(articulo.Id);
                                string imageUrl = "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
                                if (imagenes.Count > 0 && !string.IsNullOrEmpty(imagenes[0].ImagenUrl))
                                {
                                    imageUrl = imagenes[0].ImagenUrl;
                                }
                                else
                                {
                                    imageUrl = "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
                                }

                                int cantidadArticulo = ObtenerCantidadArticulo(articulo.Id);
                                decimal subTotal = articulo.Precio * cantidadArticulo;
                                totalInicial += subTotal;
                    %>
                    <div class="item-row" data-id="<%= articulo.Id %>">
                        <img src="<%= imageUrl %>" class="item-image" onerror="this.src='https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg'" />
                        <div class="item-details">
                            <span class="item-name"><%= articulo.Nombre %></span>
                            <span class="item-price">$<%= articulo.Precio %></span>
                        </div>
                        <div class="item-quantity">
                            <input type="number" min="1" value="<%= cantidadArticulo %>" placeholder="" />
                        </div>
                        <span class="item-total">Total: $<%= subTotal.ToString("0.00") %></span>
                       <asp:Button ID="btnEliminar" CssClass="fa fa-trash btn-eliminar" runat="server"/>
                    </div>
                    <% }
                        }%>
                </div>
            </div>
        </updatepanel>
    </div>

    <div class="content-wrapper">
        <div class="total-section">
            <label id="lblTotal">Total: $<%= totalInicial.ToString("0.00") %></label>
            <asp:Button ID="btnPasarPagar" runat="server" Text="Pasar a pagar" CssClass="btn-pasar-pagar" OnClick="btnPasarPagar_Click" />
        </div>
    </div>
</asp:Content>

