using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            // Abandon the session (optional, depending on your requirements)
            Session.Abandon();

            // Redirect to the login page or any other desired page
            Response.Redirect("login.aspx");
        }
    }
}