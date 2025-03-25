using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Value.Trim();
            string password = txtPassword.Value.Trim();

            if (AuthenticateStaff(username, password))
            {
                // Successful login, set session variables and redirect to dashboard
                Session["Username"] = username;
                Response.Redirect("StaffDashboard.aspx");
            }
            else
            {
                // Invalid credentials, display error message or handle appropriately
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

        private bool AuthenticateStaff(string username, string password)
        {
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            string query = "SELECT COUNT(*) FROM Staff WHERE Username = @Username AND Password = @Password";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    con.Close();
                    return (count > 0);
                }
            }
        }

    }
}