<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="Advanced_DB_web.Views.Admin.AdminRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Register</title>
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
<div class="jumbotron">
    <h1 id="banner">Admin Registration</h1>
    <p class="lead">
        <asp:Label ID="lblResult" CssClass="text-success" Font-Bold="True" runat="server" Text=""/>
    </p>
</div>
    <form id="form1" runat="server">
       <div class="container">
            <div class="row">
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>User Name</label>
                        <asp:TextBox CssClass="form-control" ID="txtUserName" runat="server"/>
                        <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server" ErrorMessage="Required Field" CssClass="text-danger" ControlToValidate="txtUserName" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox CssClass="form-control" TextMode="Password" ID="txtPassword" runat="server"/>
                        <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="Required Field" CssClass="text-danger" ControlToValidate="txtPassword" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <asp:DropDownList ID="RoleDropDownList" runat="server" 
                                          CssClass="form-control"
                                          Visible="False"
                                          AppendDataBoundItems="true">  
                            <asp:ListItem Selected="True" Value="1">Admin</asp:ListItem>  
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnSaveAdmin" runat="server" Text="Register" class="btn btn-success" OnClick="btnSaveAdmin_OnClick"/>
                </div>
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnHome" CausesValidation="False" runat="server" Text="Return to Home Page" class="btn btn-primary" OnClick="btnHome_OnClick"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
