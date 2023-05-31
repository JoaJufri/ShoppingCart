<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoApp.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            min-height: 100vh;
        }

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
            margin-right: 10px;
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

        #carrito {
            position: relative;
        }

        .content-wrapper {
            position: absolute;
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
    <script type="text/javascript">
        window.addEventListener('resize', function () {
            document.body.style.minHeight = window.innerHeight + 'px';
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Carrito de Compras</h1>

    <div id="carrito">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanelCarrito" runat="server">
            <ContentTemplate>
                <asp:Label Visible="false" runat="server" ID="lblMessage"></asp:Label>
                <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="item-grid"
                    OnRowCommand="gvCarrito_RowCommand" DataSource='<%# carritoSession %>'>
                    <Columns>
                        <asp:TemplateField HeaderText="Imagen">
                            <ItemTemplate>
                                <img src='<%# Eval("PrimeraImagen") %>' class="item-image"
                                    onerror="this.src='https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d'" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <span class="item-name"><%# Eval("Nombre") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                <span class="item-price">$<%# Eval("Precio") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCantidad" runat="server" Text='<%# Eval("Cantidad") %>'
                                    CssClass="item-quantity" type="number" style="max-width: 3rem"
                                    data-cantidad-id='<%# Container.DataItemIndex %>' OnTextChanged="txtCantidad_TextChanged"
                                    AutoPostBack="true"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <span class="item-total">Total: $<%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("0.00") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:Button ID="btnEliminar" CssClass="fa fa-trash btn-eliminar" runat="server"
                                    CommandName="Eliminar" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="total-section">
                    <span id="lblTotal"></span>
                </div>
                
                <div class="total-section">
                    <span>Total General: <asp:Label ID="lblTotalGeneral" runat="server" CssClass="item-total" Text="$0.00"></asp:Label></span>
                </div>

                <div class="content-wrapper">
                    <button class="btn-pasar-pagar" onclick="btnPasarPagar_Click()">Pasar a pagar</button>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript">
        function btnPasarPagar_Click() {
            var mensaje = "Esta funcionalidad estará disponible en una futura actualización.";
            alert(mensaje);
        }
    </script>
</asp:Content>
