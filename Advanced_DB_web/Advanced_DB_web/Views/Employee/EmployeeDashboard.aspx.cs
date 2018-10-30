using System;
using System.Web.UI;

namespace Advanced_DB_web.Views.Employee
{
    public partial class EmployeeDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}