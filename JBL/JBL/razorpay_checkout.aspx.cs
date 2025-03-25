//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.Services;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace JBL
//{
//    public partial class razorpay_checkout : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//        //[WebMethod]
//        //public static bool SavePaymentDetails(string paymentId, string userId, string amount)
//        //{
//        //    try
//        //    {
//        //        // Here, you'll establish a connection to your database and insert the payment details
//        //        string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

//        //        using (SqlConnection connection = new SqlConnection(connectionString))
//        //        {
//        //            connection.Open();
//        //            SqlCommand cmd = new SqlCommand("INSERT INTO PaymentDetails (PaymentId, UserId, Amount) VALUES (@PaymentId, @UserId, @Amount)", connection);
//        //            cmd.Parameters.AddWithValue("@PaymentId", paymentId);
//        //            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(userId));
//        //            cmd.Parameters.AddWithValue("@Amount", Convert.ToDecimal(amount));
//        //            cmd.ExecuteNonQuery();
//        //        }

//        //        // Example logging statements
//        //        System.Diagnostics.Debug.WriteLine("Payment ID: " + paymentId);
//        //        System.Diagnostics.Debug.WriteLine("User ID: " + userId);
//        //        System.Diagnostics.Debug.WriteLine("Amount: " + amount);

//        //        return true; // Return true if the payment details are successfully saved
//        //    }
//        //    catch (Exception ex)
//        //    {
//        //        System.Diagnostics.Debug.WriteLine("Exception occurred: " + ex.Message);
//        //        // Log the error or handle it as needed
//        //        return false; // Return false if there's an error while saving payment details
//        //    }
//        //}





//        [WebMethod]
//        public static bool SavePaymentDetails(string paymentId, string userId, string amount)
//        {
//            // Connection string for your SQL Server database
//            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

//            try
//            {
//                // Create a connection to the database
//                using (SqlConnection connection = new SqlConnection(connectionString))
//                {
//                    // Open the database connection
//                    connection.Open();

//                    // Create a SQL command to insert payment details
//                    string insertQuery = "INSERT INTO PaymentDetails (PaymentId, UserId, Amount) VALUES (@PaymentId, @UserId, @Amount)";
//                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
//                    {
//                        // Add parameters to the command
//                        command.Parameters.AddWithValue("@PaymentId", paymentId);
//                        command.Parameters.AddWithValue("@UserId", userId);
//                        // Convert amount from paisa to rupees
//                        decimal amountInRupees = Convert.ToDecimal(amount) / 100;
//                        command.Parameters.AddWithValue("@Amount", amountInRupees);

//                        // Execute the SQL command
//                        int rowsAffected = command.ExecuteNonQuery();

//                        // Check if any rows were affected (i.e., if the insertion was successful)
//                        if (rowsAffected > 0)
//                        {
//                            return true;
//                        }
//                        else
//                        {
//                            // Insertion failed
//                            return false;
//                        }
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                // Log the exception or handle it appropriately
//                Console.WriteLine("An error occurred: " + ex.Message);
//                return false;
//            }
//        }
//    }
//}




using System;
using System.Linq;
using System.Web.Services;
using JayBhavaniLocho.Models; // Assuming your model namespace is JayBhavaniLocho.Models

namespace JayBhavaniLocho
{
    public partial class razorpay_checkout : System.Web.UI.Page
    {
        protected string RazorpayApiKey { get; } = "rzp_test_oGd6RdTp3mczFm"; // Replace with your Razorpay API key

        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is intentionally left blank as we are handling everything on the client-side.
        }

        [WebMethod]
        public static bool SavePaymentDetails(string paymentId, string userId, string amount)
        {
            try
            {
                // Convert amount from paisa to rupees
                decimal amountInRupees = Convert.ToDecimal(amount) / 100;

                // Save payment details to the database
                using (var db = new DatabaseContext()) // Replace DatabaseContext with your actual database context class
                {
                    if (db.Reg.Any(r => r.UserId == int.Parse(userId)))
                    {
                        // Create a new Payment object
                        var paymentDetails = new PaymentDetails
                        {
                            PaymentId = paymentId, // Assuming PaymentId is an integer
                            UserId = userId,
                            Amount = amountInRupees,
                            PaymentDate = DateTime.Now // Assuming you want to use the current date and time for PaymentDate
                        };

                        // Add the payment details to the database
                        db.PaymentDetails.Add(paymentDetails);

                        // Save changes to the database
                        db.SaveChanges();


                        // Return true indicating that payment details were saved successfully
                        return true;
                    }
                    else
                    {
                        // User does not exist in the Reg table, handle this scenario as needed
                        throw new Exception("User does not exist in the Reg table.");
                    }
                }
            }

            catch (Exception ex)
            {
                // Log the exception or handle it appropriately
                // For simplicity, just throwing the exception again
                throw new Exception($"An error occurred while saving payment details: {ex.Message}");
            }
        }
    }
}
