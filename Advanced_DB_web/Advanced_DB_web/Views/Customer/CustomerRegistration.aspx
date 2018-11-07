<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="Advanced_DB_web.CustomerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Registration</title>
    <link href="../../Content/Main.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.0.0.min.js"></script>
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="jumbotron">
        <h1 id="banner">Customer Registration</h1>
        <p class="lead">
            <asp:Label ID="lblResult" CssClass="text-success" Font-Bold="True" runat="server" Text=""/>
        </p>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>TRN #</label>
                        <asp:TextBox CssClass="form-control" ID="txtTrn" runat="server"/>
                        <asp:RequiredFieldValidator ID="TrnRequiredFieldValidator" runat="server" ErrorMessage="Required Field" CssClass="text-danger" ControlToValidate="txtTrn" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>First Name</label>
                        <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server"/>
                        <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ErrorMessage="Required Field" ControlToValidate="txtFirstName" CssClass="text-danger" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Middle Name</label>
                        <asp:TextBox CssClass="form-control" ID="txtMiddleName" runat="server"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Last Name</label>
                        <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server"/>
                        <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ErrorMessage="Required Field" CssClass="text-danger" ControlToValidate="txtLastName" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Date of Birth (D/MM/YYYY)</label>
                        <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server"/>
                        <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator" runat="server" ErrorMessage="Required Field" CssClass="text-danger" ControlToValidate="txtDateOfBirth" Display="Dynamic"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Home Address</label>
                        <asp:TextBox CssClass="form-control" ID="txtHomeAddress" runat="server"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Mobile Number</label>
                        <asp:TextBox CssClass="form-control" ID="txtMobileNumber" runat="server"/>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="form-group">
                        <label>Gender</label>
                        <asp:DropDownList ID="GenderDropDownList" runat="server" 
                                          CssClass="form-control"
                                          AppendDataBoundItems="true">  
                            <asp:ListItem Value="-1">Select your gender</asp:ListItem>  
                            <asp:ListItem>M</asp:ListItem>  
                            <asp:ListItem>F</asp:ListItem>  
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator" runat="server" ErrorMessage="Required Field" ControlToValidate="GenderDropDownList" CssClass="text-danger" Display="Dynamic"/>
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
                            <asp:ListItem Selected="True" Value="1">Customer</asp:ListItem>  
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnSaveCustomer" runat="server" Text="Register" class="btn btn-success" OnClick="btnSaveCustomer_OnClick" />
                </div>
                <div class="col-xs-6 col-md-4">
                    <asp:Button ID="btnHome" CausesValidation="False" runat="server" Text="Return to Home Page" class="btn btn-primary" OnClick="btnHome_OnClick" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
