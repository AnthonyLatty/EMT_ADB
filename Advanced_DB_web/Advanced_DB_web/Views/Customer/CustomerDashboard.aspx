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
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-8">
                    <h1 id="banner">Welcome to your Customer Dashboard</h1>
                    <p class="lead">Send and receive Transaction from your account.</p>
                    <p class="lead">
                        <asp:Label ID="lblSendSubmitMessage" CssClass="text-success" Font-Bold="True" runat="server" Text=""/>
                     </p>
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger btn-lg btn-block" OnClick="btnLogout_OnClick" />
                </div>
            </div>
        </div>
        
        
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <asp:Button ID="btnSend" runat="server" Text="Send a transaction" class="btn btn-primary btn-block" OnClick="btnSend_OnClick" />
                    <br />
                    <%-- Send Transaction --%>
                    <div id="sendingTransaction" runat="server">
                        <div class="col-md-12">
                            <label>Select a provider</label>
                            <div class="form-group">
                                <asp:DropDownList ID="SendProviderDropDownList" runat="server" 
                                                  CssClass="form-control"
                                                  AppendDataBoundItems="true">  
                                    <asp:ListItem Value="-1">Select a provider</asp:ListItem>  
                                    <asp:ListItem Value="1">Sagicor</asp:ListItem>  
                                    <asp:ListItem Value="2">NCB</asp:ListItem>  
                                    <asp:ListItem Value="3">FGB</asp:ListItem>
                                    <asp:ListItem Value="4">Grace Kennedy</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Amount</label>   
                                <asp:TextBox ID="txtAmount" class="form-control" TextMode="Number" runat="server"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label>Select a security question</label>
                            <div class="form-group">
                                <asp:DropDownList ID="SendSecurityDropDownList" runat="server" 
                                                  CssClass="form-control"
                                                  AppendDataBoundItems="true">  
                                    <asp:ListItem Value="-1">Select a security question</asp:ListItem>  
                                    <asp:ListItem Value="1">What time of the day were you born?</asp:ListItem>  
                                    <asp:ListItem Value="2">What is your childhood name?</asp:ListItem>  
                                    <asp:ListItem Value="3">What is your mother's middle name?</asp:ListItem>
                                    <asp:ListItem Value="4">Who was your childhood hero?</asp:ListItem>
                                    <asp:ListItem Value="5">What was the first concert you attended?</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Security Answer</label> 
                                <asp:TextBox ID="txtSendSecurityAnswer" class="form-control" runat="server"/>
                            </div>
                        </div>
                        <asp:button ID="btnSendTransactionSubmit" runat="server" class="btn btn-primary" text="Submit this Transaction" OnClick="btnSendTransactionSubmit_OnClick" />
                    </div>
                </div>
                
                

                <div class="col-md-6">
                    <asp:Button ID="btnReceive" runat="server" Text="Receive a transaction" class="btn btn-info btn-block" OnClick="btnReceive_OnClick" />
                    <br />
                    <%-- Receive Transaction --%>
                    <div id="receiveTransaction" runat="server">     
                        <div class="col-md-12">
                            <label>Select a provider</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ReceiveProviderDropDownList" runat="server" 
                                                  CssClass="form-control"
                                                  AppendDataBoundItems="true">  
                                    <asp:ListItem Value="-1">Select a provider</asp:ListItem>  
                                    <asp:ListItem Value="1">Sagicor</asp:ListItem>  
                                    <asp:ListItem Value="2">NCB</asp:ListItem>  
                                    <asp:ListItem Value="3">FGB</asp:ListItem>
                                    <asp:ListItem Value="4">Grace Kennedy</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Receiving Amount</label>   
                                <asp:TextBox ID="txtReceiveAmount" class="form-control" TextMode="Number" runat="server"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label>Select a security question</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ReceiveSecurityDropDownList" runat="server" 
                                                  CssClass="form-control"
                                                  AppendDataBoundItems="true">  
                                    <asp:ListItem Value="-1">Select a security question</asp:ListItem>  
                                    <asp:ListItem Value="1">What time of the day were you born?</asp:ListItem>  
                                    <asp:ListItem Value="2">What is your childhood name?</asp:ListItem>  
                                    <asp:ListItem Value="3">What is your mother's middle name?</asp:ListItem>
                                    <asp:ListItem Value="4">Who was your childhood hero?</asp:ListItem>
                                    <asp:ListItem Value="5">What was the first concert you attended?</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Security Answer</label> 
                                <asp:TextBox ID="txtReceiveSecurityAnswer" class="form-control" runat="server"/>
                            </div>
                        </div>
                        <asp:button id="btnReceiveSubmit" runat="server" class="btn btn-info" text="Receive this Transaction" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br />
    <br />
</body>
</html>
