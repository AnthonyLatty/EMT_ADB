<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EMT_ADB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 id="banner">Express Money Transfer System</h1>
        <p class="lead">The only online banking you will ever need!</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h3 id="banner">Fast Transactions</h3>
            <i class="fa-5x fa fa-credit-card-alt" aria-hidden="true"></i>
            <p id="banner-font">Send or receive money instantly.</p>
        </div>
        <div class="col-md-4">
            <h3 id="banner">Secured Always</h3>
            <i class="fa-5x fa fa-lock" aria-hidden="true"></i>
            <p id="banner-font">24/7 security anywhere.</p>
        </div>
        <div class="col-md-4">
            <h3 id="banner">User Friendly</h3>
            <i class="fa-5x fa fa-desktop" aria-hidden="true"></i>
            <p id="banner-font">Our system handles your stress.</p>
        </div>
    </div>

</asp:Content>
