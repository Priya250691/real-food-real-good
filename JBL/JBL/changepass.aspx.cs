using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class changepass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // User is not logged in, redirect to the login page
                Response.Redirect("login.aspx");
            }
        }

        //protected void btnChangePassword_Click(object sender, EventArgs e)
        //{
        //    // Get the username from the session
        //    string username = Session["Username"]?.ToString();

        //    if (string.IsNullOrEmpty(username))
        //    {
        //        // Redirect or handle the case where the username is not available in the session
        //        Response.Redirect("login.aspx");
        //        return;
        //    }

        //    // Get the entered old, new, and confirm passwords
        //    string oldPassword = txtOldPassword.Text.Trim();
        //    string newPassword = txtNewPassword.Text.Trim();
        //    string confirmPassword = txtConfirmPassword.Text.Trim();

        //    try
        //    {
        //        string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();

        //            // Replace "YourUpdateQueryHere" with your actual SQL update query
        //            string updateQuery = "UPDATE Reg SET Password = @NewPassword WHERE Username = @Username AND Password = @OldPassword";
        //            using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
        //            {
        //                // Add parameters for old password, new password, and username
        //                cmd.Parameters.AddWithValue("@OldPassword", oldPassword);
        //                cmd.Parameters.AddWithValue("@NewPassword", newPassword);
        //                cmd.Parameters.AddWithValue("@Username", username);

        //                // Execute the query
        //                int rowsAffected = cmd.ExecuteNonQuery();

        //                // Check if the update was successful
        //                if (rowsAffected > 0)
        //                {
        //                    // Password updated successfully
        //                    Response.Write("<script>alert('Password changed successfully.');</script>");
        //                }
        //                else
        //                {
        //                    // Failed to update password, show appropriate message
        //                    Response.Write("<script>alert('Incorrect old password or failed to change password.');</script>");
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle the exception (log, display an error message, etc.)
        //        Response.Write($"<script>alert('Error: {ex.Message}');</script>");
        //    }
        //}


        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            // Handle the change password button click
            if (ValidateForm())
            {
                // Get the old and new passwords
                string oldPassword = txtOldPassword.Text.Trim();
                string newPassword = txtNewPassword.Text.Trim();

                // Check if the old password matches the one stored in the database
                if (IsValidOldPasswordFromDatabase(oldPassword))
                {
                    // Update the password in the database
                    if (UpdatePasswordInDatabase(newPassword))
                    {
                        // Password updated successfully
                        Response.Write("<script>alert('Password changed successfully.');</script>");
                    }
                    else
                    {
                        // Failed to update password
                        Response.Write("<script>alert('Failed to change password.');</script>");
                    }
                }
                else
                {
                    // Incorrect old password
                    lblOldPasswordError.Text = "Incorrect old password.";
                }
            }
        }

        private bool ValidateForm()
        {
            // Implement your form validation logic here
            // Return true if the form is valid, otherwise false

            // Example: Check if all required fields are filled
            if (string.IsNullOrEmpty(txtOldPassword.Text.Trim()) || string.IsNullOrEmpty(txtNewPassword.Text.Trim()) || string.IsNullOrEmpty(txtConfirmPassword.Text.Trim()))
            {
                lblOldPasswordError.Text = "All fields are required.";
                return false;
            }

            // You can add more validation logic as needed

            return true;
        }

        private bool IsValidOldPasswordFromDatabase(string oldPassword)
        {
            // Implement your logic to check if the old password matches the one stored in the database
            // Replace the following with your actual database query logic

            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            string username = Session["Username"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Reg WHERE Username = @Username AND Password = @OldPassword";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@OldPassword", oldPassword);

                    try
                    {
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());

                        // Add debug statements
                        Console.WriteLine($"Debug - Username: {username}, OldPassword: {oldPassword}, Count: {count}");

                        return count > 0;
                    }
                    catch (SqlException sqlEx)
                    {
                        // Log the details of the SQL exception
                        Console.WriteLine("SQL Exception Details:");
                        for (int i = 0; i < sqlEx.Errors.Count; i++)
                        {
                            Console.WriteLine($"Error {i + 1}:");
                            Console.WriteLine($"  Message: {sqlEx.Errors[i].Message}");
                            Console.WriteLine($"  LineNumber: {sqlEx.Errors[i].LineNumber}");
                            Console.WriteLine($"  Source: {sqlEx.Errors[i].Source}");
                            // Add more details as needed
                        }

                        // Handle the exception (log, display an error message, etc.)
                        return false;
                    }
                    catch (Exception ex)
                    {
                        // Handle other exceptions
                        Console.WriteLine("Error checking old password: " + ex.Message);
                        return false;
                    }
                }
            }
        }


        private bool UpdatePasswordInDatabase(string newPassword)
        {
            // Update the password in the database
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";


            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE Reg SET Password = @NewPassword WHERE Username = @Username";

                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        string username = Session["Username"]?.ToString();

                        if (string.IsNullOrEmpty(username))
                        {
                            // Add proper handling for the case where the username is not available
                            Response.Write("<script>alert('Username not found in session.');</script>");
                            return false;
                        }

                        command.Parameters.AddWithValue("@NewPassword", newPassword);
                        command.Parameters.AddWithValue("@Username", username);

                        try
                        {
                            connection.Open();
                            int rowsAffected = command.ExecuteNonQuery();

                            return rowsAffected > 0;
                        }
                        catch (Exception ex)
                        {
                            // Handle the exception (log, display an error message, etc.)
                            Response.Write($"<script>alert('Error updating password: {ex.Message}');</script>");
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log, display an error message, etc.)
                Response.Write($"<script>alert('Error connecting to the database: {ex.Message}');</script>");
                return false;
            }
        }



    }
}


