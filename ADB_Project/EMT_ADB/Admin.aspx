<%@ Page Title="Admin Dashboard" Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"  MasterPageFile="~/Site.Master" Inherits="EMT_ADB.Admin" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Welcome to <%: Title %>.</h2>

    <a runat="server" href="~/" class="btn btn-danger btn-lg" role="button">Log out</a>
</asp:Content>
