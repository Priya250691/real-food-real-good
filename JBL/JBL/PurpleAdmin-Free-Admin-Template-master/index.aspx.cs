using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderDetails();
                lblTotalAmount.Text = "₹ " + GetTotalAmount().ToString("N2");
                lblTotalOrders.Text = GetTotalOrders().ToString("N0");

            }
        }

        




        private void LoadOrderDetails()
        {
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT OrderId, ReceiptId, Amount, Status, OrderDate FROM Orders WHERE CONVERT(date, OrderDate) = CONVERT(date, GETDATE())";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    gvOrderDetails.DataSource = dataTable;
                    gvOrderDetails.DataBind();
                }
            }
        }

        private decimal GetTotalAmount()
        {
            decimal totalAmount = 0;
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT SUM(Amount) FROM Orders";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        totalAmount = Convert.ToDecimal(result);
                    }
                }
            }
            return totalAmount;
        }

        private int GetTotalOrders()
        {
            int totalOrders = 0;
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT COUNT(*) FROM Orders";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        totalOrders = Convert.ToInt32(result);
                    }
                }
            }
            return totalOrders;
        }



        protected void gvOrderDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string orderId = gvOrderDetails.DataKeys[rowIndex].Values["OrderId"].ToString();
            DropDownList ddlStatus = (DropDownList)gvOrderDetails.Rows[rowIndex].FindControl("ddlStatus");
            string status = ddlStatus.SelectedValue;
            UpdateOrderStatus(orderId, status);

            gvOrderDetails.EditIndex = -1; // Exit edit mode after updating
            LoadOrderDetails();
        }

        protected void gvOrderDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrderDetails.EditIndex = e.NewEditIndex;
            LoadOrderDetails();
        }

        protected void gvOrderDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrderDetails.EditIndex = -1; // Exit edit mode
            LoadOrderDetails(); // Reload the GridView
        }

        private void UpdateOrderStatus(string orderId, string status)
        {
            string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "UPDATE Orders SET Status = @Status WHERE OrderId = @OrderId";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    command.Parameters.AddWithValue("@Status", status);
                    command.Parameters.AddWithValue("@OrderId", orderId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void gvOrderDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Assign")
            {
                string orderId = e.CommandArgument.ToString();
                Response.Redirect("AssignDeliveryBoy.aspx?orderId=" + orderId);
            }

        }

    }
}
