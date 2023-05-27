<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CarritoApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="portada">
        <!--Acá podemos poner una pantalla de inicio con un botón que haga scroll al listado-->

    </div>
    <div class="title">
        <h1 id="lista-articulos">Lista de Articulos</h1>
    </div>


    <div class="row row-cols-1 row-cols-md-2 g-4">

        <% 
                var i = 0;
            foreach (var item in listaArt)
            {
%>
        <div class="col">
            <div class="card">
                <img src="<%: listaImg[i].ImagenUrl %>" class="card-img-top" alt="img art. <%: item.Nombre %>">
                <div class="card-body">
                    <h5 class="card-title"><%: item.Nombre %> </h5>
                    <p class="card-text">Marca: <%: item.Marca %> </p>
                    <p class="card-text">Categoria: <%: item.Categoria %> </p>
                    <p class="card-text"><%: item.Codigo %> </p>
                    <p class="card-text">$ <%: item.Precio %> </p>
                    <% string id_art = "DescripcionProducto.aspx?Id="+ item.Id.ToString();  %>
                <button><a id="btn_detalle" href="<%: id_art %>" >Ver Detalle</a></button>
                </div>
            </div>
        </div>

        <% 
                i++;
            } %>
    </div>

</asp:Content>
