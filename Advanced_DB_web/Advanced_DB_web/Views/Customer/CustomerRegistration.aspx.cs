using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Advanced_DB_web.Models;
using System.Web.Helpers;

namespace Advanced_DB_web
{
    public partial class CustomerRegistration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        }


        private void ExecuteInsert(Customer customer)
        {
            using (SqlConnection sqlConnection = new SqlConnection(GetConnectionString()))
            {
                string sqlSyntax = @"INSERT INTO Client   
                             (Client_trn, Client_first_name, Client_middle_name, Client_last_name, Client_dob, Client_home_address, Client_mobile_number, Client_gender, Client_password, Role)   
                              VALUES  
                             (@Trn, @FirstName, @MiddleName, @LastName, @DateOfBirth, @HomeAddress, @MobileNumber, @Gender, @Password, @Role)";

                using (SqlCommand sqlCmd = new SqlCommand(sqlSyntax, sqlConnection))
                {
                    sqlCmd.Parameters.AddWithValue("@Trn", customer.Trn);
                    sqlCmd.Parameters.AddWithValue("@FirstName", customer.FirstName);
                    sqlCmd.Parameters.AddWithValue("@MiddleName", customer.MiddleName);
                    sqlCmd.Parameters.AddWithValue("@LastName", customer.LastName);
                    sqlCmd.Parameters.AddWithValue("@DateOfBirth", customer.DateOfBirth);
                    sqlCmd.Parameters.AddWithValue("@HomeAddress", customer.HomeAddress);
                    sqlCmd.Parameters.AddWithValue("@MobileNumber", customer.MobileNumber);
                    sqlCmd.Parameters.AddWithValue("@Gender", customer.Gender);
                    sqlCmd.Parameters.AddWithValue("@Password", customer.Password);
                    sqlCmd.Parameters.AddWithValue("@Role", customer.Role);



                    sqlConnection.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                }
            }
        }


        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSaveCustomer_OnClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //fill the class properties with form values  
                Customer customer = new Customer
                {
                    Trn = txtTrn.Text,
                    FirstName = txtFirstName.Text,
                    MiddleName = txtMiddleName.Text,
                    LastName = txtLastName.Text,
                    DateOfBirth = txtDateOfBirth.Text,
                    HomeAddress = txtHomeAddress.Text,
                    MobileNumber = txtMobileNumber.Text,
                    Gender = GenderDropDownList.SelectedItem.Text,
                    Password = Crypto.SHA256(txtPassword.Text),
                    Role = RoleDropDownList.SelectedItem.Text
                };

                //call the method to execute insert to the database  
                ExecuteInsert(customer);
                lblResult.Text = "Record was successfully added!";
                ClearControls();
            }
        }


        private void ClearControls()
        {
            txtTrn.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtDateOfBirth.Text = "";
            txtHomeAddress.Text = "";
            txtMobileNumber.Text = "";
            GenderDropDownList.SelectedItem.Text = "";
            txtPassword.Text = "";
        }
    }
}