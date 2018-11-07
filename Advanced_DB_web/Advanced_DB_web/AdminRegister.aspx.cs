using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.Helpers;

namespace Advanced_DB_web.Views.Admin
{
    public partial class AdminRegister : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }


        private void ExecuteInsert(Models.Admin admin)
        {
            using (SqlConnection sqlConnection = new SqlConnection(GetConnectionString()))
            {
                string sqlSyntax = @"INSERT INTO Admin   
                             (UserName, Password, Role)   
                              VALUES  
                             (@UserName, @Password, @Role)";

                using (SqlCommand sqlCmd = new SqlCommand(sqlSyntax, sqlConnection))
                {
                    sqlCmd.Parameters.AddWithValue("@UserName", admin.UserName);
                    sqlCmd.Parameters.AddWithValue("@Password", admin.Password);
                    sqlCmd.Parameters.AddWithValue("@Role", admin.Role);
                   

                    sqlConnection.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                    sqlConnection.Close();
                }
            }
        }

        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSaveAdmin_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Models.Admin admin = new Models.Admin
                {
                    UserName = txtUserName.Text,
                    Password = Crypto.SHA256(txtPassword.Text),
                    Role = RoleDropDownList.SelectedItem.Text
                };

                //call the method to execute insert to the database  
                ExecuteInsert(admin);
                lblResult.Text = "Admin successfully added!";
                ClearControls();
            }
        }

        private void ClearControls()
        {
            txtPassword.Text = "";
            txtUserName.Text = "";
        }
    }
}