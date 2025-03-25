using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class DeliveryBoyDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["DeliveryBoyID"] == null)
                {
                    Response.Redirect("Dellogin.aspx");
                }


                string fullName = GetDeliveryBoyFullName(Convert.ToInt32(Session["DeliveryBoyID"]));
                if (!string.IsNullOrEmpty(fullName))
                {
                    lblWelcomeMessage.Text =  fullName + "!";
                }


                int deliveryBoyId = GetLoggedInDeliveryBoyId(); // Implement this method to get the logged-in delivery boy's ID

                string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "SELECT * FROM Orders WHERE DeliveryBoyId = @DeliveryBoyId";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@DeliveryBoyId", deliveryBoyId);
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        gvOrders.DataSource = dataTable;    
                        gvOrders.DataBind();
                    }
                }
            }


        }



            private int GetLoggedInDeliveryBoyId()
        {
            int deliveryBoyId = -1;

            if (Session["DeliveryBoyId"] != null)
            {
                int.TryParse(Session["DeliveryBoyId"].ToString(), out deliveryBoyId);
            }

            return deliveryBoyId;
        }

        private string GetDeliveryBoyFullName(int deliveryBoyID)
        {
            string fullName = "";
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT FullName FROM DeliveryBoys WHERE ID = @DeliveryBoyID";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@DeliveryBoyID", deliveryBoyID);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        fullName = result.ToString();
                    }
                }
            }

            return fullName;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Dellogin.aspx");
        }

    }
}