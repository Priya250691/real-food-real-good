using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class deliView : System.Web.UI.Page
    {
        string connectionString = "Data Source=DEVXX\\SQLEXPRESS;Initial Catalog=JBLDB;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDeliveryBoyDetails();
            }
            
        }

        protected void gvDeliveryBoys_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDeliveryBoys.EditIndex = e.NewEditIndex;
            BindDeliveryBoyDetails();
        }

        protected void gvDeliveryBoys_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDeliveryBoys.EditIndex = -1;
            BindDeliveryBoyDetails();
        }

        protected void gvDeliveryBoys_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gvDeliveryBoys.Rows.Count)
            {
                GridViewRow row = gvDeliveryBoys.Rows[rowIndex];

                TextBox txtFullName = (TextBox)row.FindControl("txtFullName");
                TextBox txtEmail = (TextBox)row.FindControl("txtEmail");
                TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
                TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
                DropDownList ddlVehicleType = (DropDownList)row.FindControl("ddlVehicleType"); // Changed to DropDownList
                TextBox txtAge = (TextBox)row.FindControl("txtAge");
                TextBox txtVehicleNumber = (TextBox)row.FindControl("txtVehicleNumber");
                TextBox txtDrivingLicense = (TextBox)row.FindControl("txtDrivingLicense");

                if (gvDeliveryBoys.DataKeys != null && rowIndex < gvDeliveryBoys.DataKeys.Count)
                {
                    int rowID = Convert.ToInt32(gvDeliveryBoys.DataKeys[rowIndex].Value);

                    string sqlUpdate = "UPDATE DeliveryBoys SET FullName = @FullName, Email = @Email, Phone = @Phone, Address = @Address, VehicleType = @VehicleType, Age = @Age, VehicleNumber = @VehicleNumber, DrivingLicense = @DrivingLicense WHERE ID = @ID";

                    try
                    {
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            using (SqlCommand command = new SqlCommand(sqlUpdate, connection))
                            {

                                command.Parameters.AddWithValue("@FullName", txtFullName.Text);
                                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                                command.Parameters.AddWithValue("@Phone", txtPhone.Text);
                                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                                command.Parameters.AddWithValue("@VehicleType", ddlVehicleType.SelectedValue);
                                command.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                                command.Parameters.AddWithValue("@VehicleNumber", txtVehicleNumber.Text);
                                command.Parameters.AddWithValue("@DrivingLicense", txtDrivingLicense.Text);
                                command.Parameters.AddWithValue("@ID", rowID);

                                connection.Open();
                                command.ExecuteNonQuery();
                            }
                        }

                        // Reset the EditIndex to -1 to close the edit mode
                        gvDeliveryBoys.EditIndex = -1;
                        BindDeliveryBoyDetails();
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception
                        // You can log the error or display an error message to the user
                    }
                }
            }
        }

        protected void gvDeliveryBoys_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex >= 0 && rowIndex < gvDeliveryBoys.Rows.Count)
            {
                if (gvDeliveryBoys.DataKeys != null && rowIndex < gvDeliveryBoys.DataKeys.Count)
                {
                    int rowID = Convert.ToInt32(gvDeliveryBoys.DataKeys[rowIndex].Value);

                    string sqlDelete = "DELETE FROM DeliveryBoys WHERE ID = @ID";

                    try
                    {
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            using (SqlCommand command = new SqlCommand(sqlDelete, connection))
                            {
                                command.Parameters.AddWithValue("@ID", rowID);

                                connection.Open();
                                command.ExecuteNonQuery();
                            }
                        }

                        BindDeliveryBoyDetails();
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception
                        // You can log the error or display an error message to the user
                    }
                }
            }
        }

        private void BindDeliveryBoyDetails()
        {
            string sqlQuery = "SELECT ID, FullName, Email, Phone, Address, VehicleType, Age, VehicleNumber, DrivingLicense FROM DeliveryBoys";
            DataTable dtDeliveryBoys = new DataTable();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection))
                    {
                        adapter.Fill(dtDeliveryBoys);
                    }
                }

                gvDeliveryBoys.DataSource = dtDeliveryBoys;
                gvDeliveryBoys.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the exception
                // You can log the error or display an error message to the user
            }
        }
    }
}
