using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JBL
{
    public partial class order : System.Web.UI.Page
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
                    lblWelcomeMessage.Text = "Welcome, " + fullName + "!";
                }

                LoadOrderDetails();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Dellogin.aspx");
        }

        private string GetDeliveryBoyFullName(int deliveryBoyID)
        {
            string fullName = "";
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
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

        private void LoadOrderDetails()
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sqlQuery = "SELECT OrderId, ReceiptId, Amount, Status FROM Orders";
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
    }
}
