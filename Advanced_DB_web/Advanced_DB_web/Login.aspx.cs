using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.Helpers;

namespace Advanced_DB_web
{
    public partial class Login : Page
    {
        private string _sqlSyntax, _userName, _password;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _sqlDataAdapter;
        private DataTable _dataTable;
        private int _rowCount;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }

        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var roleType = RoleDropDownList.SelectedItem.Text;

                if (roleType == "Customer")
                {
                    SqlConnection sqlConnection = new SqlConnection(GetConnectionString());

                    sqlConnection.Open();

                    _sqlSyntax = "Select * from Client";

                    _sqlCommand = new SqlCommand(_sqlSyntax);

                    _sqlDataAdapter = new SqlDataAdapter(_sqlCommand.CommandText, sqlConnection);

                    _dataTable = new DataTable();

                    _sqlDataAdapter.Fill(_dataTable);

                    _rowCount = _dataTable.Rows.Count;

                    for (int i = 0; i < _rowCount; i++)
                    {
                        _userName = _dataTable.Rows[i]["Client_first_name"].ToString();

                        _password = _dataTable.Rows[i]["Client_password"].ToString();

                        if (_userName == txtUserName.Text && _password ==  Crypto.SHA256(txtPassword.Text))
                        {
                            Session["Client_first_name"] = _userName;
                            Response.Redirect("Views/Customer/CustomerDashboard.aspx");
                            ClearControls();
                        }
                        else
                        {
                            lblFailure.Text = "Invalid User Name or Password! Please try again!";
                        }
                    }
                } 
                else if (roleType == "Employee")
                {
                    SqlConnection sqlConnection = new SqlConnection(GetConnectionString());

                    sqlConnection.Open();

                    _sqlSyntax = "Select * from Employee";

                    _sqlCommand = new SqlCommand(_sqlSyntax);

                    _sqlDataAdapter = new SqlDataAdapter(_sqlCommand.CommandText, sqlConnection);

                    _dataTable = new DataTable();

                    _sqlDataAdapter.Fill(_dataTable);

                    _rowCount = _dataTable.Rows.Count;

                    for (int i = 0; i < _rowCount; i++)
                    {
                        _userName = _dataTable.Rows[i]["Emp_first_name"].ToString();

                        _password = _dataTable.Rows[i]["Password"].ToString();

                        if (_userName == txtUserName.Text && _password == Crypto.SHA256(txtPassword.Text))
                        {
                            Session["Emp_first_name"] = _userName;
                            Response.Redirect("Views/Employee/EmployeeDashboard.aspx");
                            ClearControls();
                        }
                        else
                        {
                            lblFailure.Text = "Invalid User Name or Password! Please try again!";
                        }
                    }
                }
                else if (roleType == "Admin")
                {
                    SqlConnection sqlConnection = new SqlConnection(GetConnectionString());

                    sqlConnection.Open();

                    _sqlSyntax = "Select * from Admin";

                    _sqlCommand = new SqlCommand(_sqlSyntax);

                    _sqlDataAdapter = new SqlDataAdapter(_sqlCommand.CommandText, sqlConnection);

                    _dataTable = new DataTable();

                    _sqlDataAdapter.Fill(_dataTable);

                    _rowCount = _dataTable.Rows.Count;

                    for (int i = 0; i < _rowCount; i++)
                    {
                        _userName = _dataTable.Rows[i]["UserName"].ToString();

                        _password = _dataTable.Rows[i]["Password"].ToString();

                        if (_userName == txtUserName.Text && _password == txtPassword.Text)
                        {
                            Session["UserName"] = _userName;
                            Response.Redirect("Views/Admin/AdminDashboard.aspx");
                            ClearControls();
                        }
                        else
                        {
                            lblFailure.Text = "Invalid User Name or Password! Please try again!";
                        }
                    }
                }
                else
                {
                    lblFailure.Text = "Invalid User Name or Password! Please try again!";
                    ClearControls();
                }
            }
        }


        private void ClearControls()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }
    }
}