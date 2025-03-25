using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class Dellogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


            protected void btnLogin_Click(object sender, EventArgs e)
            {
                string email = txtEmail.Value.Trim();
                string password = txtPassword.Value.Trim();

                // Authenticate the delivery boy
                if (AuthenticateDeliveryBoy(email, password))
                {
                    // If authentication is successful, store delivery boy's ID in session
                    Session["DeliveryBoyID"] = GetDeliveryBoyID(email);

                    // Redirect to the order page
                    Response.Redirect("DeliveryBoyDashboard.aspx"); // Change "order.aspx" to the actual order page
                }
                else
                {
                    // Display error message if authentication fails
                    Response.Write("<script>alert('Invalid email or password. Please try again.');</script>");
                }
            }

            private bool AuthenticateDeliveryBoy(string email, string password)
            {
            // Perform authentication logic here (e.g., check against database)
            // Replace this with your actual authentication mechanism

            // Example: Authenticate delivery boy against a database table
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "SELECT COUNT(*) FROM DeliveryBoys WHERE Email = @Email AND Password = @Password";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        return count > 0;
                    }
                }
            }

            private int GetDeliveryBoyID(string email)
            {
                // Retrieve the delivery boy's ID based on their email
                // Replace this with your actual database query to get the delivery boy's ID
                int deliveryBoyID = 0; // Default value
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "SELECT ID FROM DeliveryBoys WHERE Email = @Email";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        connection.Open();
                        object result = command.ExecuteScalar();
                        if (result != null)
                        {
                            deliveryBoyID = Convert.ToInt32(result);
                        }
                    }
                }
                return deliveryBoyID;
            }
        }
}