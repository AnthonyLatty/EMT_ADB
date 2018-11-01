using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Advanced_DB_web.Views.Customer
{
    public partial class CustomerDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divSend.Visible = false;
            divReceive.Visible = false;
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            divSend.Visible = true;
        }

        protected void btnReceive_OnClick(object sender, EventArgs e)
        {
            divReceive.Visible = true;
        }

        private void clear()
        {

            txtAmount.Text = "";
            txtQuestion.Text = "";
            
        }

        protected void btnSendSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string stringconnection = WebConfigurationManager.ConnectionStrings["Express_Money_Transfer"].ConnectionString;
                SqlConnection connection = new SqlConnection(stringconnection);
                string sendsyntax = @"INSERT INTO Transactions(Transaction_third_party_company,Transaction_amount,Transaction_security_question) )  
                                    values (@thirdparty,@amount,@securityques)";

                using (SqlCommand sqlcommand = new SqlCommand(sendsyntax, connection))
                {

                    string send_selected_party;
                    if (rbtnRSag.Checked)
                    {
                        send_selected_party = "Sagicor";
                        sqlcommand.Parameters.AddWithValue("@receive_thirdparty", send_selected_party);
                    }
                    else if (rbtnRNcb.Checked)
                    {
                        send_selected_party = "NCB";
                        sqlcommand.Parameters.AddWithValue("@receive_thirdparty", send_selected_party);
                    }
                    else if (rbtnRFgb.Checked)
                    {
                        send_selected_party = "FGB";
                        sqlcommand.Parameters.AddWithValue("@receive_thirdparty", send_selected_party);
                    }
                    else if (rbtnRGk.Checked)
                    {
                        send_selected_party = "Grace Kennedy";
                        sqlcommand.Parameters.AddWithValue("@receive_thirdparty", send_selected_party);
                    }

                  // <-------------------------
                    sqlcommand.Parameters.AddWithValue("@amount", txtAmount);
                    sqlcommand.Parameters.AddWithValue("@securityques", txtQuestion);




                    connection.Open();
                    sqlcommand.CommandType = CommandType.Text;
                    sqlcommand.ExecuteNonQuery();
                }

                lblSubmit.Text = "You information was submitted";
                clear();
            }
        }


        protected void btnReceiveSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string connection = WebConfigurationManager.ConnectionStrings["Express_Money_Transfer"].ConnectionString;
                SqlConnection sqlconnect = new SqlConnection(connection);
                string receivesyntax = @"INSERT INTO Transactions(Transaction_third_party_company,Transaction_amount,Transaction_security_answer) )  
                                    values (@receive_thirdparty,@receive_amount,@securityans)";

                using (SqlCommand command = new SqlCommand(receivesyntax, sqlconnect))
                {
                    string selected_party;
                    if (rbtnRSag.Checked)
                    {
                        selected_party = "Sagicor";
                        command.Parameters.AddWithValue("@receive_thirdparty", selected_party);
                    }
                    else if (rbtnRNcb.Checked)
                    {
                        selected_party = "NCB";
                        command.Parameters.AddWithValue("@receive_thirdparty", selected_party);
                    }
                    else if (rbtnRFgb.Checked)
                    {
                        selected_party = "FGB";
                        command.Parameters.AddWithValue("@receive_thirdparty", selected_party);
                    }
                    else if (rbtnRGk.Checked)
                    {
                        selected_party = "Grace Kennedy";
                        command.Parameters.AddWithValue("@receive_thirdparty", selected_party);
                    }

                    
                    command.Parameters.AddWithValue("@receive_amount", txtRecvAmount);
                    command.Parameters.AddWithValue("@securityques", txtAnswer);




                    sqlconnect.Open();
                    command.CommandType = CommandType.Text;
                    command.ExecuteNonQuery();
                }

                lblSubmit.Text = "You information was submitted";
                clear();
            }
        }

    }
}











           