using Org.BouncyCastle.Crypto.Tls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master
{
    public partial class adminChangepass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Password FROM Reg WHERE Username = @Username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", "adniraj07");

                connection.Open();
                string storedPassword = (string)command.ExecuteScalar();

                if (txtOldPassword.Text == storedPassword)
                {
                    if (txtNewPassword.Text == txtConfirmPassword.Text)
                    {
                        query = "UPDATE Reg SET Password = @NewPassword WHERE Username = @Username";
                        command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                        command.Parameters.AddWithValue("@Username", "adniraj07");

                        command.ExecuteNonQuery();
                        lblMessage.Text = "Password changed successfully.";
                    }
                    else
                    {
                        lblMessage.Text = "New password and confirm password do not match.";
                    }
                }
                else
                {
                    lblMessage.Text = "Incorrect old password.";
                }
            }
        }
    }
}