using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advanced_DB_web.Views.Employee
{
    public partial class EmployeeDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RunDataSet();
        }


        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
            
        }

        protected void RunDataSet()
        {

            string selectSQL = "SELECT * FROM Transactions";
            string connectionString = WebConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection transactionConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(selectSQL, transactionConnection);
            SqlDataAdapter transactionAdapter = new SqlDataAdapter(cmd);
            DataSet dsTransaction = new DataSet();
            try
            {

                transactionConnection.Open();
                transactionAdapter.Fill(dsTransaction, "Transactions");
                PopulateTable(dsTransaction);

            }
            catch (Exception err)
            {
                //ConnectionErrorLabel.Text = err.ToString();
            }

            finally
            {
                transactionConnection.Close();
            }

        }

        protected void PopulateTable(DataSet dsTransaction)
        {
           foreach (DataRow row in dsTransaction.Tables["Transactions"].Rows)
            {

                TableRow transactionTableRow = new TableRow();
                TableCell transactionTableCells = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_ID"])
                    };

                 transactionTableRow.Controls.Add(transactionTableCells);


                TableCell transactionTableCells2 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_trn"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells2);


                TableCell transactionTableCells4 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_third_party_company"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells4);


                TableCell transactionTableCells5 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_security_question"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells5);


                TableCell transactionTableCells6 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_amount"])
                    };
                 transactionTableRow.Controls.Add(transactionTableCells6);


                TableCell transactionTableCells7 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_security_answer"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells7);


                TableCell transactionTableCells8 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_date_sent"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells8);


                TableCell transactionTableCells9 = new TableCell
                    {
                        Text = Convert.ToString(row["Transaction_date_received"])
                    };
                transactionTableRow.Controls.Add(transactionTableCells9);

                transactionTable.Controls.Add(transactionTableRow);

            }
}


    }
}