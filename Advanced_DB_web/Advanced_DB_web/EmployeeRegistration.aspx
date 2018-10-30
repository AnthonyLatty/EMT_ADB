<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="Advanced_DB_web.EmployeeRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration</title>
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
</head>
<body>
    <div class="jumbotron">
        <h1 id="banner">Employee Registration</h1>
    </div>
    <form id="form1" runat="server">
        <div class="form-group">
            <label>First Name</label>
        </div>
        <div class="form-group">
            <label>Middle Name</label>
        </div>
        <div class="form-group">
            <label>Last Name</label>
        </div>
        <div class="form-group">
            <label>Date of Birth</label>
        </div>
        <div class="form-group">
            <label>Home Address</label>
        </div>
        <div class="form-group">
            <label>Mobile Number</label>
        </div>
        <div class="form-group">
            <label>Gender</label>
        </div>
    </form>
</body>
</html>
