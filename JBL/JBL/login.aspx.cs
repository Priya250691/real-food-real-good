using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    string username = txtUsername.Text;
        //    string password = txtPassword.Text;

        //    if (ValidateUser(username, password))
        //    {
        //        Session["Username"] = username;
        //        if (username == "adniraj07" && password == "Niraj@123")
        //        {
        //            Response.Redirect("https://localhost:44338/PurpleAdmin-Free-Admin-Template-master/index.aspx");
        //        }
        //        else
        //        {
        //            Response.Redirect("home.aspx");
        //        }

        //        string script = "alert('Login successful!');";
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        //    }
        //    else
        //    {
        //        string errorMessage = "Invalid username or password. Please try again.";

        //        // Dynamically update error messages in the client-side using JavaScript
        //        string script = $@"
        //            document.getElementById('{txtUsername.ClientID}').classList.add('is-invalid');
        //            document.getElementById('{txtPassword.ClientID}').classList.add('is-invalid');
        //            document.getElementById('{usernameError.ClientID}').innerHTML = '{errorMessage}';
        //        ";

        //        ClientScript.RegisterStartupScript(this.GetType(), "errorScript", script, true);
        //    }
        //}

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    string username = txtUsername.Text;
        //    string password = txtPassword.Text;

        //    if (ValidateUser(username, password))
        //    {
        //        Session["Username"] = username;

        //        // Register alert script before redirection
        //        string script = "alert('Login successful!');";
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

        //        if (username == "adniraj07" && password == "Niraj@1234")
        //        {
        //            Response.Redirect("https://localhost:44338/PurpleAdmin-Free-Admin-Template-master/index.aspx");
        //        }
        //        else
        //        {
        //            Response.Redirect("home.aspx");
        //        }
        //    }
        //    else
        //    {
        //        string errorMessage = "Invalid username or password. Please try again.";

        //        // Dynamically update error messages in the client-side using JavaScript
        //        string script = $@"
        //    document.getElementById('{txtUsername.ClientID}').classList.add('is-invalid');
        //    document.getElementById('{txtPassword.ClientID}').classList.add('is-invalid');
        //    document.getElementById('{usernameError.ClientID}').innerHTML = '{errorMessage}';
        //";

        //        ClientScript.RegisterStartupScript(this.GetType(), "errorScript", script, true);
        //    }
        //}





        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Retrieve the password for the given username from the database
            string storedPassword = GetPassword(username);

            if (storedPassword != null && storedPassword == password)
            {
                Session["Username"] = username;

                // Register alert script before redirection
                string script = "alert('Login successful!');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                if (username == "adniraj07")
                {
                    Response.Redirect("https://localhost:44338/PurpleAdmin-Free-Admin-Template-master/index.aspx");
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                string errorMessage = "Invalid username or password. Please try again.";

                // Dynamically update error messages in the client-side using JavaScript
                string script = $@"
            document.getElementById('{txtUsername.ClientID}').classList.add('is-invalid');
            document.getElementById('{txtPassword.ClientID}').classList.add('is-invalid');
            document.getElementById('{usernameError.ClientID}').innerHTML = '{errorMessage}';
        ";

                ClientScript.RegisterStartupScript(this.GetType(), "errorScript", script, true);
            }
        }

        private string GetPassword(string username)
        {
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            string query = "SELECT Password FROM Reg WHERE Username = @Username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);

                connection.Open();
                string storedPassword = (string)command.ExecuteScalar();
                return storedPassword;
            }
        }




        private bool ValidateUser(string username, string password)
        {
            // You need to implement the logic to validate the user from the database.
            // This is just a placeholder method.
            // Replace this with actual database validation logic.
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Reg WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

    }
}