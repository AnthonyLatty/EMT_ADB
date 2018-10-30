using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Helpers;
using Advanced_DB_web.Models;

namespace Advanced_DB_web
{
    public partial class EmployeeRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }


        private void ExecuteInsert(Employee employee)
        {
            using (SqlConnection sqlConnection = new SqlConnection(GetConnectionString()))
            {
                string sqlSyntax = @"INSERT INTO Employee   
                             (Emp_ID, Emp_first_name, Emp_middle_name, Emp_last_name, Emp_position, Emp_date_hired, Emp_home_address, Emp_email, Role, Password)   
                              VALUES  
                             (@Emp_ID, @FirstName, @MiddleName, @LastName, @Position, @DateHired, @HomeAddress, @Email, @Role, @Password)";

                using (SqlCommand sqlCmd = new SqlCommand(sqlSyntax, sqlConnection))
                {
                    sqlCmd.Parameters.AddWithValue("@Emp_ID", employee.Emp_ID);
                    sqlCmd.Parameters.AddWithValue("@FirstName", employee.FirstName);
                    sqlCmd.Parameters.AddWithValue("@MiddleName", employee.MiddleName);
                    sqlCmd.Parameters.AddWithValue("@LastName", employee.LastName);
                    sqlCmd.Parameters.AddWithValue("@Position", employee.Position);
                    sqlCmd.Parameters.AddWithValue("@DateHired", employee.DateHired);
                    sqlCmd.Parameters.AddWithValue("@HomeAddress", employee.HomeAddress);
                    sqlCmd.Parameters.AddWithValue("@Email", employee.Email);
                    sqlCmd.Parameters.AddWithValue("@Role", employee.Role);
                    sqlCmd.Parameters.AddWithValue("@Password", employee.Password);



                    sqlConnection.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnSaveEmployee_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Random random = new Random();

                //fill the class properties with form values  
                Employee employee = new Employee
                {
                    Emp_ID = random.Next(0,100).ToString("D"),
                    FirstName = txtFirstName.Text,
                    MiddleName = txtMiddleName.Text,
                    LastName = txtLastName.Text,
                    Position = txtPosition.Text,
                    DateHired = txtDateHired.Text,
                    HomeAddress = txtHomeAddress.Text,
                    Email = txtEmail.Text,
                    Role = RoleDropDownList.SelectedItem.Text,
//                    Password = Crypto.SHA256(txtPassword.Text)
                    Password = txtPassword.Text
                };

                //call the method to execute insert to the database  
                ExecuteInsert(employee);
                lblResult.Text = "Yay! record was successfully added!";
                ClearControls();
            }
        }

        private void ClearControls()
        {
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtPosition.Text = "";
            txtDateHired.Text = "";
            txtHomeAddress.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
        }

        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}