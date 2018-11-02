using System;
using System.Web.UI;

namespace Advanced_DB_web.Views.Customer
{
    public partial class CustomerDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sendingTransaction.Visible = false;
            receiveTransaction.Visible = false;
        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            sendingTransaction.Visible = true;
            receiveTransaction.Visible = false;
        }

        protected void btnReceive_OnClick(object sender, EventArgs e)
        {
            receiveTransaction.Visible = true;
            sendingTransaction.Visible = false;
        }


    }
}











           