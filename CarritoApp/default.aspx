<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CarritoApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <h1>Lista de Articulos</h1>
   

    <div class="row row-cols-1 row-cols-md-2 g-4">

        <% 
            foreach (var item in listaArt)
            { 
        %>
            <div class="col">
                <div class="card">
                    <img src="Content/placeholder-22.png" class="card-img-top" alt="placeholder">
                    <div class="card-body">
                        <h5 class="card-title"><%: item.Nombre %> </h5>
                        <p class="card-text"><%: item.Descripcion %> </p>
                    </div>
                </div>
            </div>

         <% } %>
    </div>

</asp:Content>
