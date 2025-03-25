using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class DelChangePass : System.Web.UI.Page
    {
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["DeliveryBoyID"] != null)
            {
                int deliveryBoyId = Convert.ToInt32(Session["DeliveryBoyID"]);
                string currentPassword = txtCurrentPassword.Text.Trim();
                string newPassword = txtNewPassword.Text.Trim();
                string confirmPassword = txtConfirmPassword.Text.Trim();

                if (newPassword != confirmPassword)
                {
                    lblMessage.Text = "New password and confirm password do not match.";
                    lblMessage.Visible = true;
                    return;
                }

                string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "UPDATE DeliveryBoys SET Password = @NewPassword WHERE ID = @DeliveryBoyId AND Password = @CurrentPassword";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@DeliveryBoyId", deliveryBoyId);
                        command.Parameters.AddWithValue("@CurrentPassword", currentPassword);
                        command.Parameters.AddWithValue("@NewPassword", newPassword);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        connection.Close();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Password changed successfully.";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Visible = true;
                        }
                        else
                        {
                            lblMessage.Text = "Invalid current password.";
                            lblMessage.Visible = true;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Dellogin.aspx"); // Redirect to login page if session is not valid
            }
        }
    }
}