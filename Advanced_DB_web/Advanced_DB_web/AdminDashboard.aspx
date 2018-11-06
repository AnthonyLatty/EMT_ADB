<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Advanced_DB_web.Views.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-8">
                    <h1 id="banner">Welcome Admin</h1>
                    <p class="lead">Manage and review all data in system.</p>
                    <p class="lead">
                        <asp:Label ID="lblErrorMessage" CssClass="text-danger" Font-Bold="True" runat="server" Text=""/>
                    </p>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger btn-lg btn-block" OnClick="btnLogout_OnClick" />
                </div>
            </div>
        </div>
        <h2 style="text-align: center">Transactions</h2>
        <div class="col-md-12">
            <asp:Table ID="transactionTable" runat="server" CssClass="table table-bordered" autopostback="true">  
                <asp:TableRow CssClass="table table-hover">
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
        <h2 style="text-align: center">Customers</h2>
        <div class="col-md-12">
            <asp:Table ID="customerTable" runat="server" CssClass="table table-bordered" autopostback="true">
                <asp:TableRow CssClass="table table-hover">
                    <asp:TableHeaderCell>Client TRN</asp:TableHeaderCell>
                    <asp:TableHeaderCell>First Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Middle Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Last Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date of Birth</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Address</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Mobile Number</asp:TableHeaderCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <h2 style="text-align: center">Employees</h2>
        <div class="col-md-12">
            <asp:Table ID="employeeTable" runat="server" CssClass="table table-bordered" autopostback="true">
                <asp:TableRow CssClass="table table-hover">
                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>First Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Middle Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Last Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Position</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date Hired</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Address</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
