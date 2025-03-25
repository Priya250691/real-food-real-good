using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class testOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetOrders()
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "SELECT OrderId, ReceiptId, Amount, Status, OrderDate FROM Orders";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        List<OrderDetails> orderDetails = new List<OrderDetails>();
                        while (reader.Read())
                        {
                            OrderDetails order = new OrderDetails
                            {
                                OrderId = reader.GetInt32(0),
                                ReceiptId = reader.GetString(1),
                                Amount = reader.GetDecimal(2),
                                Status = reader.GetString(3),
                                OrderDate = reader.GetDateTime(4)
                            };
                            orderDetails.Add(order);
                        }
                        // Serialize the list of OrderDetails to a JSON string
                        string ordersJson = Newtonsoft.Json.JsonConvert.SerializeObject(orderDetails);
                        return ordersJson;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error or display a message to the user
                Console.WriteLine("Error in GetOrders method: " + ex.Message);
                return "[]";
            }
        }



        public class OrderDetails
        {
            public int OrderId { get; set; }
            public string ReceiptId { get; set; }
            public decimal Amount { get; set; }
            public string Status { get; set; }
            public DateTime OrderDate { get; set; }
        }
    }
}