using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace JayBhavaniLocho
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the token is present in the query string
            if (!IsPostBack && Request.QueryString["token"] == null)
            {
                Response.Redirect("~/ForgotPassword.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Here you can implement the logic to reset the password using the token
            string token = Request.QueryString["token"];
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword == confirmPassword)
            {
                // Update user's password in the database using the token
                if (UpdatePassword(token, newPassword))
                {
                    lblMessage.Text = "Password reset successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;

                    // Show an alert message and redirect to the login page using JavaScript
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('Password reset successfully.'); window.location.href = '/Login.aspx';", true);
                }
                else
                {
                    lblMessage.Text = "Failed to reset password. Please try again later.";
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.Visible = true;
            }
        }

        private bool UpdatePassword(string token, string newPassword)
        {
            // Update user's password in the database using the token
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Reg SET Password = @Password WHERE Token = @Token";

                using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                    cmd.Parameters.AddWithValue("@Token", token);

                    try
                    {
                        connection.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        // Log the exception or handle it appropriately
                        return false;
                    }
                }
            }
        }



    }
}