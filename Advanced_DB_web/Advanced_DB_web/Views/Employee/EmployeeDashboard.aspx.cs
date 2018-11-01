using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advanced_DB_web.Views.Employee
{
    public partial class EmployeeDashboard : Page
    {
        public static int flag = 1;
        public static int rowCount;
        ManualResetEvent mre = new ManualResetEvent(false);
        protected void Page_Load(object sender, EventArgs e)
        {
            RunDataSet();
            if (flag <= rowCount && flag >= 1)
            {
                transactionTable.Rows[flag].BackColor = System.Drawing.Color.Chartreuse;
            }
            else if (flag > rowCount)
            {
                flag--;
            }
            else if (flag < 1)
            {
                flag++;
            }
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

        protected void ApproveButton_Click(object sender, EventArgs e)
        {
            Approve();
        }

        protected void DeclineButton_Click(object sender, EventArgs e)
        {
            Decline();
        }

       
        protected void RunDataSet()
        {
            for (int p = 1 ; p < transactionTable.Rows.Count; p++)
            {
                transactionTable.Rows[p].Controls.Clear();
            }

            string selectSQL = "SELECT * FROM Transactions WHERE Status = 0";
            SqlConnection transactionConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand(selectSQL, transactionConnection);
            SqlDataAdapter transactionAdapter = new SqlDataAdapter(cmd);
            DataSet dsTransaction = new DataSet();
            try
            {

                transactionConnection.Open();
                transactionAdapter.Fill(dsTransaction, "Transactions");

            }
            catch (Exception err)
            {
                //output sexy error message here
            }

            finally
            {
                transactionConnection.Close();
            }

            rowCount = dsTransaction.Tables["Transactions"].Rows.Count;
            foreach (DataRow row in dsTransaction.Tables["Transactions"].Rows)
            {

                TableRow transactionTableRow = new TableRow();
                TableCell transactionTableCells = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_ID"])
                };
              
                transactionTableRow.Controls.Add(transactionTableCells);
                //transactionTable.Controls.Add(transactionTableRow);
                


                //TableRow transactionTableRow2 = new TableRow();

                TableCell transactionTableCells2 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_trn"])
                };
                transactionTableRow.Controls.Add(transactionTableCells2);
                //transactionTable.Controls.Add(transactionTableRow2);



               // TableRow transactionTableRow3 = new TableRow();

                TableCell transactionTableCells3 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_ID"])
                };
                transactionTableRow.Controls.Add(transactionTableCells3);
               // transactionTable.Controls.Add(transactionTableRow3);



                //TableRow transactionTableRow4 = new TableRow();

                TableCell transactionTableCells4 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_third_party_company"])
                };
                transactionTableRow.Controls.Add(transactionTableCells4);
                //transactionTable.Controls.Add(transactionTableRow4);



                //TableRow transactionTableRow5 = new TableRow();

                TableCell transactionTableCells5 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_security_question"])
                };
                transactionTableRow.Controls.Add(transactionTableCells5);
                //transactionTable.Controls.Add(transactionTableRow5);



                //TableRow transactionTableRow6 = new TableRow();

                TableCell transactionTableCells6 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_amount"])
                };
                transactionTableRow.Controls.Add(transactionTableCells6);
                //transactionTable.Controls.Add(transactionTableRow6);



                //TableRow transactionTableRow7 = new TableRow();

                TableCell transactionTableCells7 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_security_answer"])
                };
                transactionTableRow.Controls.Add(transactionTableCells7);
                //transactionTable.Controls.Add(transactionTableRow7);



                //TableRow transactionTableRow8 = new TableRow();

                TableCell transactionTableCells8 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_date_sent"])
                };
                transactionTableRow.Controls.Add(transactionTableCells8);
                //transactionTable.Controls.Add(transactionTableRow8);



                //TableRow transactionTableRow9 = new TableRow();

                TableCell transactionTableCells9 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_date_received"])
                };
                transactionTableRow.Controls.Add(transactionTableCells9);
                transactionTable.Controls.Add(transactionTableRow);
                
            }
        }
        protected void Approve()
        {
            string updateSQL = "UPDATE Transactions SET Status=@status WHERE Transaction_ID=@TransID";
            string connectionString = WebConfigurationManager.ConnectionStrings["Express_Money_Transfer"].ConnectionString;
            SqlConnection transactionConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(updateSQL, transactionConnection);

            cmd.Parameters.AddWithValue("@status",1);
            cmd.Parameters.AddWithValue("@TransID", TextBox1.Text); //transactionTable.Rows[flag].Cells[0]
            int updated = 0;
            
            try
            {
                transactionConnection.Open();
                updated = cmd.ExecuteNonQuery();
               
                UpdateStatusTextbox.Text = updated + " Approved!";
                
                
            }
            catch (Exception err)
            {

            }
            finally
            {
                transactionConnection.Close();
                RunDataSet();
                if (flag > rowCount)
                {
                    flag--;
                }
                else if (flag < 1)
                {
                    flag++;
                }
            }
        }
        protected void Decline()
        {
            string updateSQL = "UPDATE Transactions SET Status=@status WHERE Transaction_ID=@TransID";
        string connectionString = WebConfigurationManager.ConnectionStrings["Express_Money_Transfer"].ConnectionString;
        SqlConnection transactionConnection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(updateSQL, transactionConnection);

        cmd.Parameters.AddWithValue("@status",2);
            cmd.Parameters.AddWithValue("@TransID", TextBox1.Text); //transactionTable.Rows[flag].Cells[0]
            int updated = 0;
            
            try
            {
                transactionConnection.Open();
                updated = cmd.ExecuteNonQuery();
               
                UpdateStatusTextbox.Text = updated + " Declined!";
                
                
            }
            catch (Exception err)
            {

            }
            finally
            {
                transactionConnection.Close();
                RunDataSet();
                if (flag > rowCount)
                {
                    flag--;
                }
                else if (flag< 1)
                {
                    flag++;
                }
            }
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            flag++;

            if (flag <= rowCount && flag >= 1)
            {
                transactionTable.Rows[flag-1].BackColor = System.Drawing.Color.White;
                transactionTable.Rows[flag].BackColor = System.Drawing.Color.Chartreuse;
                UpdateStatusTextbox.Text = Convert.ToString(flag);
            }
            else if (flag > rowCount)
            {
                flag--;
            }
        }

        protected void PreviousButton_Click(object sender, EventArgs e)
        {
            flag--;

            if (flag <= rowCount && flag >= 1)
            {
                transactionTable.Rows[flag+1].BackColor = System.Drawing.Color.White;
                transactionTable.Rows[flag].BackColor = System.Drawing.Color.Chartreuse;
                UpdateStatusTextbox.Text = Convert.ToString(flag);
            }
            else if (flag < 1)
            {
                flag++;
            }
        }
    }
}