using System;
using System.Web.UI;

namespace Advanced_DB_web
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomer_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("CustomerRegistration.aspx");
        }

        protected void btnEmployee_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeRegistration.aspx");
        }
    }
}