<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Advanced_DB_web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
</head>
<body>
    <div class="jumbotron">
        <h1 id="banner">Express Money Transfer System</h1>
        <p class="lead">The only online banking you will ever need!</p>
    </div>
    <div class="container">
        <form id="form1" runat="server">
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
            <br />
            <hr />
            <div class="row">
                <div class="col-sm">
                    <asp:Button ID="btnCustomer" runat="server" Text="Register a Customer" class="btn btn-primary" OnClick="btnCustomer_OnClick" />
                </div>
                <div class="col-sm">
                    <asp:Button ID="btnEmployee" runat="server" Text="Register a Employee" class="btn btn-dark" OnClick="btnEmployee_OnClick" />
                </div>
                <div class="col-sm">
                    <asp:Button ID="btnAdmin" runat="server" Text="Register an Admin" class="btn btn-secondary" OnClick="btnAdmin_OnClick"/>
                </div>
                <div class="col-sm">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-success" OnClick="btnLogin_OnClick" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
