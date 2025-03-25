using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            // Check if the email exists in the database
            if (IsEmailExists(email))
            {
                // Generate a unique token for resetting password (you can use GUID or any other method)
                string resetToken = Guid.NewGuid().ToString();

                // Update the database with the reset token and expiry date
                UpdateResetToken(email, resetToken);

                // Send an email with the reset password link
                SendResetPasswordEmail(email, resetToken);

                // Display a success message
                lblMessage.Text = "An email with instructions to reset your password has been sent to your email address.";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Email address not found.";
                lblMessage.Visible = true;
            }
        }

        private bool IsEmailExists(string email)
        {
            // Implement your database logic to check if the email exists
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Reg WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void UpdateResetToken(string email, string resetToken)
        {
            // Implement your database logic to update the reset token and expiry date
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Reg SET Token = @Token, ExpiryDate = DATEADD(HOUR, 1, GETDATE()) WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Token", resetToken);
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void SendResetPasswordEmail(string email, string resetToken)
        {
            // Construct the reset password link
            string resetLink = $"{Request.Url.GetLeftPart(UriPartial.Authority)}/ResetPassword.aspx?token={resetToken}";

            // Create and configure the email message
            MailMessage message = new MailMessage();
            message.From = new MailAddress("21bmiit039@gmail.com");
            message.To.Add(new MailAddress(email));
            message.Subject = "Reset Your Password";
            message.Body = $"Please click the following link to reset your password: <a href='{resetLink}'>{resetLink}</a>";
            message.IsBodyHtml = true;

            // Send the email
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.Credentials = new NetworkCredential("21bmiit039@gmail.com", "lmrn sals vbcw xagr");
            client.EnableSsl = true;
            client.Send(message);
        }

    }
}