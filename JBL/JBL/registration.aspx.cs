using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Username"] != null)
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            

            if (Page.IsValid)
            {
                string fullName = txtFullName.Text;
                string username = txtUsername.Text;
                string mobileNumber = txtMobileNumber.Text;
                string dateOfBirth = txtDateOfBirth.Text;
                string gender = ddlGender.SelectedValue;
                string address = txtAddress.Text;
                string city = ddlCity.SelectedValue;
                string pincode = txtPincode.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;

                
                try
                {
                    string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        
                        string checkUserQuery = "SELECT COUNT(*) FROM Reg WHERE Username = @Username OR Email = @Email";
                        SqlCommand checkUserCommand = new SqlCommand(checkUserQuery, connection);
                        checkUserCommand.Parameters.AddWithValue("@Username", username);
                        checkUserCommand.Parameters.AddWithValue("@Email", email);

                        int existingUsersCount = (int)checkUserCommand.ExecuteScalar();

                        if (existingUsersCount > 0)
                        {
                           
                            string checkUsernameQuery = "SELECT COUNT(*) FROM Reg WHERE Username = @Username";
                            SqlCommand checkUsernameCommand = new SqlCommand(checkUsernameQuery, connection);
                            checkUsernameCommand.Parameters.AddWithValue("@Username", username);

                            int existingUsernameCount = (int)checkUsernameCommand.ExecuteScalar();

                            if (existingUsernameCount > 0)
                            {
                                
                                lblUsernameError.Text = "Username already exists. Please choose a different one.";
                            }
                            else
                            {
                                
                                lblEmailError.Text = "Email already exists. Please choose a different one.";
                            }
                        }
                        else
                        {
                            try
                            {
                                

                                string insertQuery = "INSERT INTO Reg (FullName, Username, MobileNumber, DateOfBirth, Gender, Address, City, Pincode, Email, Password) VALUES " +
                                                     "(@FullName, @Username, @MobileNumber, @DateOfBirth, @Gender, @Address, @City, @Pincode, @Email, @Password)";

                                using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                                {
                                    
                                    insertCommand.Parameters.AddWithValue("@FullName", fullName);
                                    insertCommand.Parameters.AddWithValue("@Username", username);
                                    insertCommand.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                                    insertCommand.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                                    insertCommand.Parameters.AddWithValue("@Gender", gender);
                                    insertCommand.Parameters.AddWithValue("@Address", address);
                                    insertCommand.Parameters.AddWithValue("@City", city);
                                    insertCommand.Parameters.AddWithValue("@Pincode", pincode);
                                    insertCommand.Parameters.AddWithValue("@Email", email);
                                    insertCommand.Parameters.AddWithValue("@Password", password);

                                    
                                    insertCommand.ExecuteNonQuery();
                                }


                                string script = "alert('Registration successful!');";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                                // Redirect to the login page after the alert is displayed
                                Response.Redirect("login.aspx");

                            }
                            catch (Exception ex)
                            {
                                
                                lblError.Text = ex.ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    
                    lblError.Text = "An error occurred during registration. Please try again later last.";
                }
            }
        }


    }
}