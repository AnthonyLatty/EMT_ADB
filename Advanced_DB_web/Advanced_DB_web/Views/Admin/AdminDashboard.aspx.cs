using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advanced_DB_web.Views.Admin
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTransactionDataSet();
            GetCustomerDataSet();
            GetEmployeeDataSet();
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }


        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }

        //Get all transactions in DB
        protected void GetTransactionDataSet()
        {
            string selectSQL = "SELECT * FROM Transactions";
            SqlConnection transactionConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand(selectSQL, transactionConnection);
            SqlDataAdapter transactionAdapter = new SqlDataAdapter(cmd);
            DataSet dsTransaction = new DataSet();
            try
            {
                transactionConnection.Open();
                transactionAdapter.Fill(dsTransaction, "Transactions");
                PopulateTransactionTable(dsTransaction);
            }
            catch (Exception err)
            {
                lblErrorMessage.Text = err.Message;
            }
            finally
            {
                transactionConnection.Close();
            }

        }

        protected void PopulateTransactionTable(DataSet dsTransaction)
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

                TableCell transactionTableCells7 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_security_answer"])
                };
                transactionTableRow.Controls.Add(transactionTableCells7);


                TableCell transactionTableCells6 = new TableCell
                {
                    Text = Convert.ToString(row["Transaction_amount"])
                };
                transactionTableRow.Controls.Add(transactionTableCells6);


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

                //Used to add rows to table
                transactionTable.Controls.Add(transactionTableRow);
            }
        }

        //Get all customers in DB
        protected void GetCustomerDataSet()
        {
            string selectCustomerSQL = "SELECT * FROM Client";
            SqlConnection sqlConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand(selectCustomerSQL, sqlConnection);
            SqlDataAdapter customerSqlDataAdapter = new SqlDataAdapter(cmd);
            DataSet customerDataSet = new DataSet();
            try
            {
                sqlConnection.Open();
               customerSqlDataAdapter.Fill(customerDataSet, "Client");
                PopulateCustomerTable(customerDataSet);
            }
            catch (Exception err)
            {
                lblErrorMessage.Text = err.Message;
            }
            finally
            {
                sqlConnection.Close();
            }

        }

        
        protected void PopulateCustomerTable(DataSet dsClient)
        {
            foreach (DataRow row in dsClient.Tables["Client"].Rows)
            {
                TableRow customerTableRow = new TableRow();
                TableCell customerTableCell = new TableCell
                {
                    Text = Convert.ToString(row["Client_trn"])
                };
                customerTableRow.Controls.Add(customerTableCell);


                TableCell customerTableCell2 = new TableCell
                {
                    Text = Convert.ToString(row["Client_first_name"])
                };
                customerTableRow.Controls.Add(customerTableCell2);


                TableCell customerTableCell3 = new TableCell
                {
                    Text = Convert.ToString(row["Client_middle_name"])
                };
                customerTableRow.Controls.Add(customerTableCell3);


                TableCell customerTableCell4 = new TableCell
                {
                    Text = Convert.ToString(row["Client_last_name"])
                };
                customerTableRow.Controls.Add(customerTableCell4);

                TableCell customerTableCell5 = new TableCell
                {
                    Text = Convert.ToString(row["Client_dob"])
                };
                customerTableRow.Controls.Add(customerTableCell5);


                TableCell customerTableCell6 = new TableCell
                {
                    Text = Convert.ToString(row["Client_home_address"])
                };
                customerTableRow.Controls.Add(customerTableCell6);


                TableCell customerTableCell7 = new TableCell
                {
                    Text = Convert.ToString(row["Client_mobile_number"])
                };
                customerTableRow.Controls.Add(customerTableCell7);

                //Used to add rows to table
                customerTable.Controls.Add(customerTableRow);


            }
        }

        protected void GetEmployeeDataSet()
        {
            string selectSQL = "SELECT * FROM Employee";
            SqlConnection employeeConnection = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand(selectSQL, employeeConnection);
            SqlDataAdapter employeeAdapter = new SqlDataAdapter(cmd);
            DataSet dsEmployee = new DataSet();
            try
            {
                employeeConnection.Open();
                employeeAdapter.Fill(dsEmployee, "Employee");
                PopulateEmployeeTable(dsEmployee);
            }
            catch (Exception err)
            {
                lblErrorMessage.Text = err.Message;
            }
            finally
            {
                employeeConnection.Close();
            }

        }

        protected void PopulateEmployeeTable(DataSet dsEmployee)
        {
            foreach (DataRow row in dsEmployee.Tables["Employee"].Rows)
            {
                TableRow employeeTableRow = new TableRow();
                TableCell employeeTableCell = new TableCell
                {
                    Text = Convert.ToString(row["Emp_ID"])
                };
                employeeTableRow.Controls.Add(employeeTableCell);


                TableCell employeeTableCell2 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_first_name"])
                };
                employeeTableRow.Controls.Add(employeeTableCell2);


                TableCell employeeTableCell3 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_middle_name"])
                };
                employeeTableRow.Controls.Add(employeeTableCell3);


                TableCell employeeTableCell4 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_last_name"])
                };
                employeeTableRow.Controls.Add(employeeTableCell4);

                TableCell employeeTableCell5 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_position"])
                };
                employeeTableRow.Controls.Add(employeeTableCell5);


                TableCell employeeTableCell6 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_date_hired"])
                };
                employeeTableRow.Controls.Add(employeeTableCell6);


                TableCell employeeTableCell7 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_home_address"])
                };
                employeeTableRow.Controls.Add(employeeTableCell7);

                TableCell employeeTableCell8 = new TableCell
                {
                    Text = Convert.ToString(row["Emp_email"])
                };
                employeeTableRow.Controls.Add(employeeTableCell8);

                //Used to add rows to table
                employeeTable.Controls.Add(employeeTableRow);
            }
        }
    }
}