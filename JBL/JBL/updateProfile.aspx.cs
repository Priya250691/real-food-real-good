using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class updateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // User is not logged in, redirect to the login page
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                // Call a method to bind user data to the DetailsView
                BindUserData();


            }
        }

        private void BindUserData()
        {
            if (Session["Username"] != null)
            {
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                string username = Session["Username"].ToString();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT Username, FullName, MobileNumber, DateOfBirth, Address FROM Reg WHERE Username = @Username";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader(CommandBehavior.SingleRow);

                        if (reader.Read())
                        {
                            userDetailsView.DataSource = new[]
                            {
                                new
                                {
                                    Username = reader["Username"].ToString(),
                                    FullName = reader["FullName"].ToString(),
                                    MobileNumber = reader["MobileNumber"].ToString(),
                                    DateOfBirth = (DateTime)reader["DateOfBirth"],
                                    Address = reader["Address"].ToString()
                                }
                            };
                            userDetailsView.DataBind();
                        }

                        reader.Close();
                    }
                }
            }
            else
            {
                // Handle the case where Username is not found in the session.
                // You may redirect the user to the login page or take appropriate action.
            }
        }

        protected void userDetailsView_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            userDetailsView.ChangeMode(e.NewMode);
            BindUserData(); // Rebind data when changing modes
        }

        protected void userDetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            try
            {
                // Update user data in the database or any other update logic
                // Replace the following with your actual data update logic
                string username = Session["Username"].ToString();
                string fullName = ((TextBox)userDetailsView.FindControl("txtFullName")).Text;
                string mobileNumber = ((TextBox)userDetailsView.FindControl("txtMobileNumber")).Text;
                DateTime dateOfBirth = DateTime.Parse(((TextBox)userDetailsView.FindControl("txtDateOfBirth")).Text);
                string address = ((TextBox)userDetailsView.FindControl("txtAddress")).Text;

                // Execute your update query here using the retrieved data
                // Replace the following with your actual update query
                // Example: Update Reg Set FullName = @FullName, MobileNumber = @MobileNumber, DateOfBirth = @DateOfBirth, Address = @Address WHERE Username = @Username

                // Simulated Update Query
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open(); // Open the connection here

                    string updateQuery = "UPDATE Reg SET FullName = @FullName, MobileNumber = @MobileNumber, DateOfBirth = @DateOfBirth, Address = @Address WHERE Username = @Username";
                    using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@FullName", fullName);
                        updateCommand.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                        updateCommand.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                        updateCommand.Parameters.AddWithValue("@Address", address);
                        updateCommand.Parameters.AddWithValue("@Username", username);
                        updateCommand.ExecuteNonQuery();
                    }
                }

                // After successful update
                ScriptManager.RegisterStartupScript(this, GetType(), "updateSuccess", "alert('Profile updated successfully.');", true);
                // Rebind data after updating
                BindUserData();
                userDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
                e.Cancel = true; // Cancel the default update operation
            }
            catch (Exception ex)
            {
                // Log or display the exception details
                Response.Write($"Error: {ex.Message}");
            }
        }


        protected void userDetailsView_ItemCanceling(object sender, EventArgs e)
        {
            userDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
            BindUserData(); // Rebind data when cancelling the edit mode
        }
    }
}
