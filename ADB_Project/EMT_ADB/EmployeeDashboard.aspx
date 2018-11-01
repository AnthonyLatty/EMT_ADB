<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="Advanced_DB_web.Views.Employee.EmployeeDashboard" %>

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
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger btn-lg btn-block" OnClick="btnLogout_OnClick"/>
                </div>
                <div>
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="text-align:center;">
            </div>
        <div class=" col-md-12" style="text-align:center;" id="tableDiv" runat="server">

            <asp:Table ID="transactionTable" runat="server" BorderStyle="Double" Width="100%" CssClass="table-bordered" autopostback="true">  
                <asp:TableRow>
                    <asp:TableHeaderCell>Transaction ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>TRN</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Employee ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Third Party Company</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Security Question</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Security Answer</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date Sent</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date Received</asp:TableHeaderCell>
                    
                   
                </asp:TableRow>
            </asp:Table>
        </div>        
        </div>
        <br />
        <div class="row" >
            <div class="col-md-6" style="text-align:right;">
                <asp:Button ID="PreviousButton" runat="server" Text="<<" CssClass="btn btn-light" OnClick="PreviousButton_Click" />
            </div>
            <div class="col-md-6" style="text-align:left;">
                <asp:Button ID="NextButton" runat="server" Text=">>" CssClass="btn btn-light" OnClick="NextButton_Click"  />
            </div>
        </div>
        <br />
        <div class="row col-md-4">
            <asp:Label ID="TransLabel" runat="server" Text="Enter Transaction ID to approve: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        </div>
        <br />
        <div class="row" style="text-align:center;">
            <div class="col-md-6">
                <asp:Button ID="ApproveButton" runat="server" Text="Approve" CssClass="btn btn-success" OnClick="ApproveButton_Click" />
            </div>
            <div class="col-md-6">
                <asp:Button ID="DeclineButton" runat="server" Text="Decline" CssClass="btn btn-danger" OnClick="DeclineButton_Click" />
            </div>
        </div>
        
       
        
        <div class="row">

            <asp:Label ID="UpdateStatusTextbox" runat="server" Text=""></asp:Label>

        </div>
       
    </form>
</body>
</html>
