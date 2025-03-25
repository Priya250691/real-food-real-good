using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class staffRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Username"] == null)
            {
                Response.Redirect("~/login.aspx"); // Redirect to the login page if the user is not logged in
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Staff (FullName, Email, Phone, Address, DOB, Username, Password) " +
                                   "VALUES (@FullName, @Email, @Phone, @Address, @DOB, @Username, @Password)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(txtDOB.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowsAffected > 0)
                        {
                            // Registration successful
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Staff registered successfully');", true);
                            ClearForm();
                        }
                        else
                        {
                            // Registration failed
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to register staff');", true);
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL exception
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    }
                    catch (Exception ex)
                    {
                        // Handle general exception
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    }
                }
            }
        }

        private void ClearForm()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtDOB.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
        }
    }
}
