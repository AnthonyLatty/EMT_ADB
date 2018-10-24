<%@ Page Title="Customer Dashboard" MasterPageFile="Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="EMT_ADB.Customer" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Welcome to <%: Title %>.</h2>

    <a runat="server" href="~/" class="btn btn-danger btn-lg" role="button">Log out</a>
</asp:Content>

