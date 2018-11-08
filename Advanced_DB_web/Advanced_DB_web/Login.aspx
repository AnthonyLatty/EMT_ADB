<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Advanced_DB_web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
</head>
<body>
    <div class="jumbotron">
        <h1 id="banner">Login</h1>
        <p class="lead">Please use your First Name as User Name to login.</p>
        <p class="lead">
            <asp:Label ID="lblFailure" CssClass="text-danger" Font-Bold="True" runat="server" Text=""/>
        </p>
    </div>
    <form id="form1" runat="server">
         <div class="container">
            <div class="row">
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Tell us who you are</label>
                        <asp:DropDownList ID="RoleDropDownList" runat="server" 
                                          CssClass="form-control"
                                          AppendDataBoundItems="true">  
                            <asp:ListItem Value="-1">Who are you?</asp:ListItem>  
                            <asp:ListItem Value="1">Customer</asp:ListItem>  
                            <asp:ListItem Value="2">Employee</asp:ListItem>  
                            <asp:ListItem Value="3">Admin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>User Name</label>
                        <asp:TextBox CssClass="form-control" ID="txtUserName" placeholder="Use first name" runat="server"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox CssClass="form-control" ID="txtPassword" TextMode="Password" runat="server"/>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-success" OnClick="btnLogin_OnClick"  />
                </div>
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnHome" runat="server" Text="Return to Home Page" class="btn btn-primary" OnClick="btnHome_OnClick"  />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
