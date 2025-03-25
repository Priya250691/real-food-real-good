using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master
{
    public partial class AssignDeliveryBoy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=database;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = "SELECT ID, FullName, Action FROM DeliveryBoys WHERE Action = 'not assign'";
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        gvDeliveryBoys.DataSource = dataTable;
                        gvDeliveryBoys.DataBind();
                    }
                }
            }
        }


        //protected void gvDeliveryBoys_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Assign")
        //    {
        //        int deliveryBoyId = Convert.ToInt32(e.CommandArgument);
        //        string orderIdString = Request.QueryString["orderId"];

        //        UpdateOrderWithDeliveryBoy(orderIdString, deliveryBoyId);

        //        // Show an alert using JavaScript
        //        string script = "alert('Delivery boy assigned successfully!');";
        //        ScriptManager.RegisterStartupScript(this, GetType(), "AssignDeliveryBoyAlert", script, true);

        //        // Update the label
        //        lblMessage.Text = "Delivery boy assigned successfully!";
        //        lblMessage.CssClass = "text-success";
        //    }
        //}

        protected void gvDeliveryBoys_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Assign")
            {
                int deliveryBoyId = Convert.ToInt32(e.CommandArgument);
                string orderIdString = Request.QueryString["orderId"];

                UpdateOrderWithDeliveryBoy(orderIdString, deliveryBoyId);

                // Update the Action field for the delivery boy
                UpdateDeliveryBoyAction(deliveryBoyId, "assign");

                // Show an alert using JavaScript
                string script = "alert('Delivery boy assigned successfully!');";
                ScriptManager.RegisterStartupScript(this, GetType(), "AssignDeliveryBoyAlert", script, true);

                // Update the label
                lblMessage.Text = "Delivery boy assigned successfully!";
                lblMessage.CssClass = "text-success";
            }
        }

        private void UpdateDeliveryBoyAction(int deliveryBoyId, string action)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "UPDATE DeliveryBoys SET Action = @Action WHERE ID = @DeliveryBoyId";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@Action", action);
                    command.Parameters.AddWithValue("@DeliveryBoyId", deliveryBoyId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }


        private void UpdateOrderWithDeliveryBoy(string orderId, int deliveryBoyId)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "UPDATE Orders SET DeliveryBoyId = @DeliveryBoyId WHERE OrderId = @OrderId";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@DeliveryBoyId", deliveryBoyId);
                    command.Parameters.AddWithValue("@OrderId", orderId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}