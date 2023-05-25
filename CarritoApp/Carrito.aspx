<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoApp.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Carrito de Compras</h1>

    <div id="carrito">
        <div id="ContentCarrito">
            <asp:Label Visible="false" runat="server" ID="lblMessage"></asp:Label>
            <ul>
                <% foreach (var articulo in articulos)
                { %>
                    <li>
                        <div class="item">
                            <div class="item-details">
                                <span class="item-name"><%= articulo.Nombre %></span>
                                <span class="item-price">$<%= articulo.Precio %></span>
                                <div class="item-quantity">
                                    <input type="number" min="1" value="1" /> <!-- Espacio para la cantidad modificable -->
                                </div>
                                <span class="item-total">Total: $<%= articulo.Precio %></span> <!-- Precio unitario por la cantidad -->
                            </div>
                        </div>
                    </li>
                <% } %>
            </ul>

            <div id="total">
                <span>Total:</span>
                <span>$30.00</span>
            </div>

            <button id="finalizar-compra">Finalizar Compra</button>
        </div>
    </div>
</asp:Content>

