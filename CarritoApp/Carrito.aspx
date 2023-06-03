<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoApp.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="CSS/carrito.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Scripts/scriptCarrito.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="title">
        <h1 class="text-center">Carrito de Compras</h1>
    </div>

    <div id="carrito">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanelCarrito" runat="server">
            <ContentTemplate>
                <asp:Label Visible="false" runat="server" style="color:red;" CssClass="custom-margin" ID="lblMessage"></asp:Label>
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col">
                            <div class="item-list">
                                <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
                                    OnRowCommand="gvCarrito_RowCommand" DataSource='<%# carritoSession %>'>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Imagen">
                                            <ItemTemplate>
                                                <img src='<%# Eval("PrimeraImagen") %>' class="item-image img-fluid"
                                                    onerror="this.src='https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d'" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre">
                                            <ItemTemplate>
                                                <div class="item-details d-flex align-items-center">
                                                    <h5 class="item-name text-center"><%# Eval("Nombre") %></h5>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Precio">
                                            <ItemTemplate>
                                                <div class="item-details d-flex align-items-center">
                                                    <span class="item-price">$<%# Convert.ToDecimal(Eval("Precio")).ToString("0.00") %></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad">
                                            <ItemTemplate>
                                                <div class="item-details d-flex align-items-center">
                                                    <asp:TextBox ID="txtCantidad" runat="server" Text='<%# Eval("Cantidad") %>' OnTextChanged="txtCantidad_TextChanged"
                                                        CssClass="item-quantity" min="1" type="number" Style="max-width: 3rem" AutoPostBack="true"
                                                        data-cantidad-id='<%# Container.DataItemIndex %>'
                                                        onkeydown="return restrictArrowKeys(event);"></asp:TextBox>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <div class="item-details d-flex align-items-center">
                                                    <span class="item-total">Total: $<%# CalcularTotalArticulo((int)Eval("Id")) %></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Eliminar">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEliminar" ImageUrl="https://cdn.pixabay.com/photo/2021/07/24/17/57/trash-can-6490091_1280.png" runat="server"
                                                    CommandName="Eliminar" CommandArgument='<%# Container.DataItemIndex %>'
                                                    ToolTip="Eliminar" Height="24" Width="24" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <!-- Columna vacía -->
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <% if (listaID != null)
                    { %>
                <div class="total-section d-flex justify-content-end">
                    <span>Total General:
                        <asp:Label ID="lblTotalGeneral" runat="server" CssClass="item-total" Text="$0.00"></asp:Label></span>
                </div>
                <div class="text-end mt-3">
                    <button class="btn-pasar-pagar" onclick="btnPasarPagar_Click()">Pasar a pagar</button>
                </div>
                <% } %>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

