<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDashboard.aspx.cs" Inherits="Advanced_DB_web.Views.Customer.CustomerDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Dashboard</title>
    <link href="../../Content/Main.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.0.0.min.js"></script>
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="infoform" runat="server"  method="post">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-8">
                    <h1 id="banner">Welcome to your Customer Dashboard</h1>
                    <p class="lead">Send and receive Transaction from your account.</p>
                    <p class="lead">
                        <asp:Label ID="lblSubmit" CssClass="text-success" Font-Bold="True" runat="server" Text=""/>
                     </p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                  <asp:Button ID="btnSend" runat="server" Text="Send" class="btn btn-primary btn-md btn-block" OnClick="btnSend_OnClick" />
                 </div>
                    <div class="col-md-6">
                    <asp:Button ID="btnReceive" runat="server" Text="Receive" class="btn btn-primary btn-md btn-block" OnClick="btnReceive_OnClick" />
                </div>
            </div>
                <div id= "divSend" runat="server">
                    <p class="lead"> Sending a Transaction...</p>
       
                    <p3rd party</p>
                    <p><asp:RadioButton GroupName="Sthirdparty" ID="rbtnSagicor" runat="server" />Sagicor
                    &nbsp;
                    <asp:RadioButton GroupName="Sthirdparty" ID="rbtnNcb" runat="server" />NCB
                    &nbsp;
                    <asp:RadioButton GroupName="Sthirdparty" ID="rbtnFGB" runat="server" />FGB
                    &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton GroupName="Sthirdparty" ID="rbtnGK" runat="server" />Grace Kennedy

                    </p>
                    Amount   
                    <br />
                    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSAmount" runat="server" Forecolor="Red" ErrorMessage="Please Enter an Amount to proceed" ControlToValidate="txtAmount"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    security Question
                    <br />
                    <asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSecQuestion" runat="server" Forecolor="Red" ErrorMessage="Secuirty Question required to proceed" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    <asp:button id= "btnSendSubmit" runat="server" text="Submit" OnClick="btnSendSubmit_Click" />
                    
                </div>
     
                <div id="divReceive" runat="server">     
        
            
                    <p class="lead"> Receiving a Transaction...</p><br />
        
                    3rd party<br />
                    <asp:RadioButton GroupName="Rthirdparty" ID="rbtnRSag" runat="server" />Sagicor
                    &nbsp;
                    <asp:RadioButton GroupName="Rthirdparty" ID="rbtnRNcb" runat="server" />NCB
                    &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton GroupName="Rthirdparty" ID="rbtnRFgb" runat="server" />FGB
                    &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton GroupName="Rthirdparty" ID="rbtnRGk" runat="server" />Grace Kennedy
                    <br /><br />

                    Amount
                   <br />
                    <asp:TextBox ID="txtRecvAmount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ForeColor="Red" ErrorMessage="Please enter an amount to proceed " ControlToValidate ="txtRecvAmount"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    Security Answer
                    <br />
                    <asp:TextBox ID="txtAnswer" runat="server" ></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvSecAnswer" runat="server" ForeColor="Red" ErrorMessage="Security Answer required to proceed" ControlToValidate="txtAnswer"></asp:RequiredFieldValidator>
                    <br />
                    <asp:button id= "btnReceiveSubmit" runat="server" text="Submit" OnClick="btnReceiveSubmit_Click" />
                </div>



        <br />
             <div class="col-md-2">
                    <br />
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger btn-lg btn-block" OnClick="btnLogout_OnClick" />
                </div>
        </div>
    </form>
</body>
</html>
