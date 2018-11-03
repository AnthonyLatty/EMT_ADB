using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Advanced_DB_web.Models;

namespace Advanced_DB_web.Views.Customer
{
    public partial class CustomerDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sendingTransaction.Visible = false;
            receiveTransaction.Visible = false;
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            sendingTransaction.Visible = true;
            receiveTransaction.Visible = false;
        }

        protected void btnReceive_OnClick(object sender, EventArgs e)
        {
            receiveTransaction.Visible = true;
            sendingTransaction.Visible = false;
        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }

        // Insert Transaction SQL 
        private void ExecuteInsert(Transaction transaction)
        {
            using (SqlConnection sqlConnection = new SqlConnection(GetConnectionString()))
            {
                string sqlSyntax = @"INSERT INTO Transactions   
                             (Transaction_third_party_company, Transaction_security_question, Transaction_amount, Transaction_security_answer, Transaction_date_sent, Transaction_date_received)   
                              VALUES  
                             (@TransactionThirdPartyCompany, @TransactionSecurityQuestion, @TransactionAmount, @TransactionSecurityAnswer, @TransactionDateSent, @TransactionDateReceived)";

                using (SqlCommand sqlCmd = new SqlCommand(sqlSyntax, sqlConnection))
                {
                    sqlCmd.Parameters.AddWithValue("@TransactionThirdPartyCompany", transaction.TransactionThirdPartyCompany);
                    sqlCmd.Parameters.AddWithValue("@TransactionSecurityQuestion", transaction.TransactionSecurityQuestion);
                    sqlCmd.Parameters.AddWithValue("@TransactionAmount", transaction.TransactionAmount);
                    sqlCmd.Parameters.AddWithValue("@TransactionSecurityAnswer", transaction.TransactionSecurityAnswer);
                    sqlCmd.Parameters.AddWithValue("@TransactionDateSent", transaction.TransactionDateSent);
                    sqlCmd.Parameters.AddWithValue("@TransactionDateReceived", transaction.TransactionDateReceived);

                    sqlConnection.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                }
            }
        }


        // Select Transaction SQL
        private void ExecuteSelect(Transaction transaction)
        {
            using (SqlConnection sqlConnection = new SqlConnection(GetConnectionString()))
            {
                string sqlSyntax = @"SELECT * FROM Transactions";

                using (SqlCommand sqlCmd = new SqlCommand(sqlSyntax, sqlConnection))
                {
                    sqlCmd.Parameters.AddWithValue("@TransactionThirdPartyCompany", transaction.TransactionThirdPartyCompany);
                    sqlCmd.Parameters.AddWithValue("@TransactionSecurityQuestion", transaction.TransactionSecurityQuestion);
                    sqlCmd.Parameters.AddWithValue("@TransactionAmount", transaction.TransactionAmount);
                    sqlCmd.Parameters.AddWithValue("@TransactionSecurityAnswer", transaction.TransactionSecurityAnswer);
                    sqlCmd.Parameters.AddWithValue("@TransactionDateSent", transaction.TransactionDateSent);
                    sqlCmd.Parameters.AddWithValue("@TransactionDateReceived", transaction.TransactionDateReceived);

                    sqlConnection.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                }
            }
        }


        protected void btnSendTransactionSubmit_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DateTime today = DateTime.Today;

                Transaction transaction = new Transaction
                {
                    TransactionThirdPartyCompany = SendProviderDropDownList.SelectedItem.Text,
                    TransactionAmount = txtAmount.Text,
                    TransactionSecurityQuestion = SendSecurityDropDownList.SelectedItem.Text,
                    TransactionSecurityAnswer = txtSendSecurityAnswer.Text,
                    TransactionDateSent = today.ToString("MM/dd/yyyy"),
                    TransactionDateReceived = today.ToString("MM/dd/yyyy")
                };

                ExecuteInsert(transaction);
                lblSendSubmitMessage.Text = "Transaction successfully sent! An employee will review shortly.";
                ClearControls();
            }
        }


        
        protected void btnReceiveSubmit_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DateTime today = DateTime.Today;

                Transaction transaction = new Transaction
                {

                    TransactionThirdPartyCompany = ReceiveProviderDropDownList.SelectedItem.Text,
                    TransactionAmount = txtReceiveAmount.Text,
                    TransactionSecurityQuestion = ReceiveSecurityDropDownList.SelectedItem.Text,
                    TransactionSecurityAnswer = txtReceiveSecurityAnswer.Text,
                    TransactionDateSent = today.ToString("MM/dd/yyyy"),
                    TransactionDateReceived = today.ToString("MM/dd/yyyy")
                };

                ExecuteSelect(transaction);
                lblReceiveSubmitMessage.Text = "You have received a transaction, Thanks for using EMT System.";
                ClearControls();
            }
        }


        private void ClearControls()
        {
            SendProviderDropDownList.SelectedItem.Text = "";
            ReceiveProviderDropDownList.SelectedItem.Text = "";
            txtAmount.Text = "";
            txtReceiveAmount.Text = "";
            SendSecurityDropDownList.SelectedItem.Text = "";
            ReceiveSecurityDropDownList.SelectedItem.Text = "";
            txtSendSecurityAnswer.Text = "";
            txtReceiveSecurityAnswer.Text = "";
        }
    }
}











           