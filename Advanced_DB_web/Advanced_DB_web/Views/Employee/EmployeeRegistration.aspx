﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="Advanced_DB_web.EmployeeRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration</title>
    <link href="../../Content/Main.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.0.0.min.js"></script>
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="jumbotron">
        <h1 id="banner">Employee Registration</h1>
        <p class="lead">
            <asp:Label ID="lblResult" CssClass="text-success" Font-Bold="True" runat="server" Text=""/>
        </p>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="txtLastName" CssClass="text-danger" Display="Dynamic"/>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <label>Position</label>
                            <asp:TextBox CssClass="form-control" ID="txtPosition" runat="server"/>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <label>Date Hired (D/MM/YYYY)</label>
                            <asp:TextBox CssClass="form-control" ID="txtDateHired" runat="server"/>
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
                            <label>Mobile Number (7-digits only)</label>
                            <asp:TextBox CssClass="form-control" ID="txtNumber" TextMode="Number" runat="server"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile number must be 7 digits" ControlToValidate="txtNumber" CssClass="text-danger" Display="Dynamic"/>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox CssClass="form-control" ID="txtEmail" TextMode="Email" runat="server"/>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <label>Password (Use strong characters 7 digits or more)</label>
                            <asp:TextBox CssClass="form-control" ID="txtPassword" TextMode="Password" runat="server"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Use strong characters 7 digits or more" ControlToValidate="txtPassword" CssClass="text-danger" Display="Dynamic"/>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <asp:DropDownList ID="RoleDropDownList" runat="server" 
                                              CssClass="form-control"
                                              Visible="False"
                                              AppendDataBoundItems="true">  
                                <asp:ListItem Selected="True" Value="1">Employee</asp:ListItem>  
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtEmpID" runat="server" Visible="False"/>
                        </div>
                    </div>
                    <br />
                    <br />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-6" style="text-align:right;">
                <asp:Button ID="btnSaveEmployee" runat="server" Text="Register" class="btn btn-success" OnClick="btnSaveEmployee_OnClick"/>
            </div>
            <div class="col-xs-6 col-md-6" style="text-align:left;">
                <asp:Button ID="btnHome" CausesValidation="False" runat="server" Text="Return to Home Page" class="btn btn-primary" OnClick="btnHome_OnClick" />
            </div>
        </div>
    </form>
</body>
</html>
