using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace EMT_ADB.Account
{
    public partial class Login : Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        private string _sqlSyntax, _userName, _password;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _sqlDataAdapter;
        private DataTable _dataTable;
        private int _rowCount;


        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlConnection sqlConnection = new SqlConnection(_connectionString);

                sqlConnection.Open();

                _sqlSyntax = "Select * from Users";

                _sqlCommand = new SqlCommand(_sqlSyntax);

                _sqlDataAdapter = new SqlDataAdapter(_sqlCommand.CommandText, sqlConnection);

                _dataTable = new DataTable();

                _sqlDataAdapter.Fill(_dataTable);

                _rowCount = _dataTable.Rows.Count;

                for (int i = 0; i < _rowCount; i++)
                {
                    _userName = _dataTable.Rows[i]["UserName"].ToString();

                    _password = _dataTable.Rows[i]["Password"].ToString();

                    if (_userName == txt_UserName.Text && _password == txt_Password.Text)
                    {
                        Session["UserName"] = _userName;

                        if (_dataTable.Rows[i]["Role"].ToString() == "Admin")

                            Response.Redirect("~/Admin.aspx");

                        else if (_dataTable.Rows[i]["Role"].ToString() == "User")

                            Response.Redirect("~/Customer.aspx");
                    }
                    else
                    {
                        FailureText.Text = "Invalid User Name or Password! Please try again!";
                    }
                }
            }
        }
    }
}