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
    public partial class StaffDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in (username stored in session)
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                lblUsername.Text = username;
            }
            else
            {
                // If user is not logged in, redirect to login page
                Response.Redirect("StaffLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadOrderDetails();
                

            }
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("StaffLogin.aspx");
        }

        private void LoadOrderDetails()
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
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
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
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
                Response.Redirect("AssignDeliveryBoyByStaff.aspx?orderId=" + orderId);
            }

        }

    }
}
