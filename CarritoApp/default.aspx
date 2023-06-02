<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CarritoApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Home.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="portada">
            <asp:Button ID="btnVermas" runat="server" Text="VER CATÁLOGO" OnClick="btnVermas_Click" CssClass="btn btn-primary btn-vermas" />
        </div>
    </section>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <div id="title">
            <h1 id="lista-articulos">Lista de Articulos</h1>
        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="filtros">
                    <asp:DropDownList ID="ddl_Criterio" runat="server" CssClass="ddl">
                        <asp:ListItem Text="Categoria" CssClass="ddl_item" />
                        <asp:ListItem Text="Marca" CssClass="ddl_item" />
                        <asp:ListItem Text="Precio Hasta $" CssClass="ddl_item" />
                    </asp:DropDownList>
                    <asp:TextBox ID="tbFiltro" runat="server" CssClass="tb_Filtro"></asp:TextBox>
                    <asp:Button ID="btFiltro" Text="Buscar" OnClick="btFiltro_Click" CssClass="btn_Buscar" runat="server" />
                </div>

                <asp:Label ID="lbListaNula" runat="server" Visible="false" Text="No se encontraron coincidencias." CssClass="lb_listaNulla"></asp:Label>

                <div class="row row-cols-1 row-cols-md-2 g-4">

                    <% 
                        var i = 0;
                        foreach (var item in listaArt)
                        {
                    %>
                    <div class="col">
                        <div class="card">
                            <img src="<%: listaImg[i].ImagenUrl %>" class="card-img-top" alt="img art. <%: item.Nombre %>" onerror="this.src='https://c.pxhere.com/images/47/83/d6e362ca869395f9db5b5a3d0659-1675158.png!d'">
                            <div class="card-body">
                                <h5 class="card-title"><%: item.Nombre %> </h5>
                                <p class="card-text">Marca: <%: item.Marca %> </p>
                                <p class="card-text">Categoria: <%: item.Categoria %> </p>
                                <p class="card-text"><%: item.Codigo %> </p>
                                <p class="card-text">$ <%: item.Precio %> </p>
                                <% string id_art = "DescripcionProducto.aspx?Id=" + item.Id.ToString();  %>
                                <div class="btn-block">
                                    <a id="vermasBTN" href="<%: id_art %>" class="btn btn-primary text-primary btn-lg btn-block active" role="button" aria-pressed="true">Ver Detalle</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% 
                            i++;
                        } %>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
</asp:Content>
