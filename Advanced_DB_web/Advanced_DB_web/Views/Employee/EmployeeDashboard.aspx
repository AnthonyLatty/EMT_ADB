﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="Advanced_DB_web.Views.Employee.EmployeeDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link href="../../Content/Main.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.0.0.min.js"></script>
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-8">
                    <h1 id="banner">Welcome to your Employee Dashboard</h1>
                    <p class="lead">Review existing transactions from customers.</p>
                    <p class="lead">
                        <asp:Label ID="lblErrorMessage" CssClass="text-danger" Font-Bold="True" runat="server" Text=""/>
                    </p>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger btn-lg btn-block" OnClick="btnLogout_OnClick"/>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Table ID="transactionTable" runat="server" BorderStyle="Double" Width="100%" CssClass="table table-bordered table-hover" autopostback="true">  
                <asp:TableRow >
                    <asp:TableHeaderCell>Transaction ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>TRN</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Third Party Company</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Security Question</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Security Answer</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date Sent</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date Received</asp:TableHeaderCell>
                </asp:TableRow>
            </asp:Table>
        </div>
       
    </form>
</body>
</html>