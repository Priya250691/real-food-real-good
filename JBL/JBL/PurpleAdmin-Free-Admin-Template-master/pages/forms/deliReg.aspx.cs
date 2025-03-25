using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class deliReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve form data
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string address = txtAddress.Text;
            string vehicleType = ddlVehicleType.SelectedValue;
            int age;
            int.TryParse(txtAge.Text, out age); // Try to parse age, handle if not a valid integer
            string vehicleNumber = txtVehicleNumber.Text;
            string drivingLicense = txtLicense.Text;
            string password = txtPassword.Text; // Retrieve password

            // Perform required field validation
            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(address) ||
                string.IsNullOrWhiteSpace(vehicleType) ||
                age <= 0 ||
                string.IsNullOrWhiteSpace(vehicleNumber) ||
                string.IsNullOrWhiteSpace(drivingLicense) ||
                string.IsNullOrWhiteSpace(password)) // Check if password is empty
            {
                // Display alert message for missing fields or invalid age
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields and ensure age is 18 or greater.');", true);
                return;
            }

            // Perform validation for full name
            if (!Regex.IsMatch(fullName, @"^[a-zA-Z ]+$"))
            {
                // Display error message for invalid full name format
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Full name should only contain alphabetical characters and spaces.');", true);
                return;
            }

            // Perform validation for email
            if (!Regex.IsMatch(email, @"^\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b$"))
            {
                // Display error message for invalid email format
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email address format.');", true);
                return;
            }

            // Perform validation for phone number
            if (!Regex.IsMatch(phone, @"^[6-9]\d{9}$"))
            {
                // Display error message for invalid phone number format
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid phone number format. Please enter a 10-digit number starting with 6, 7, 8, or 9.');", true);
                return;
            }

            // Perform age validation
            if (age < 18)
            {
                // Display alert message for invalid age
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Age must be 18 or greater.');", true);
                return;
            }

            // Perform validation for vehicle number
            if (!Regex.IsMatch(vehicleNumber, @"^[A-Z]{2}-[0-9]{2}-[A-Z]{2}-[0-9]{4}$"))
            {
                // Display error message for invalid vehicle number format
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid vehicle number format. Example: GJ-05-FY-6062.');", true);
                return;
            }

            // Perform validation for driving license
            if (!Regex.IsMatch(drivingLicense, @"^[a-zA-Z0-9]+$"))
            {
                // Display error message for invalid driving license format
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid driving license format. Only alphanumeric characters are allowed.');", true);
                return;
            }

            // Connection string to your SQL Server database
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=database;Integrated Security=True;";

            // SQL insert command
            string sqlInsert = @"INSERT INTO DeliveryBoys (FullName, Email, Phone, Address, VehicleType, Age, VehicleNumber, DrivingLicense, Password) 
                                 VALUES (@FullName, @Email, @Phone, @Address, @VehicleType, @Age, @VehicleNumber, @DrivingLicense, @Password)";

            // Create and open SQL connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create SQL command with parameters
                using (SqlCommand command = new SqlCommand(sqlInsert, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@VehicleType", vehicleType);
                    command.Parameters.AddWithValue("@Age", age);
                    command.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                    command.Parameters.AddWithValue("@DrivingLicense", drivingLicense);
                    command.Parameters.AddWithValue("@Password", password); // Add password parameter

                    // Open connection and execute command
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Display success message in an alert box
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration successful!');", true);
        }
    }
}