using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class addCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the GridView with existing data
                BindCategoryData();
            }

           
        }

        protected void AddCategory_Click(object sender, EventArgs e)
        {
            // Get values from the form
            string categoryName = categoryNameTextBox.Text;
            string status = statusDropDown.SelectedValue;

            // Server-side validation for unique category name
            if (!IsCategoryNameUnique(categoryName))
            {
                // Display an error message or handle as needed
                // For example, you can show a validation error label
                // or redirect the user back to the form with an error message.
                // In this example, I'll show a simple alert and clear the category name textbox.
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CategoryNotUniqueAlert",
                    "alert('Category Name is not unique. Please choose a different name.');", true);

                categoryNameTextBox.Text = ""; // Clear the category name textbox
                return;
            }

            // Insert data into the database
            InsertCategory(categoryName, status);

            // Bind the GridView with updated data
            BindCategoryData();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CategoryAddedAlert",
        "alert('Category added successfully.');", true);
        }

        private bool IsCategoryNameUnique(string categoryName)
        {
            // Check if the category name already exists in the database
            // Implement your logic to check uniqueness, e.g., using a SELECT query

            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Category WHERE categoryName = @CategoryName";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryName", categoryName);

                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count == 0; // If count is 0, the name is unique; otherwise, it's not.
                }
            }
        }

        protected void categoryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            categoryGridView.EditIndex = e.NewEditIndex;
            BindCategoryData();
        }

        protected void categoryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get updated values from the GridView
            int categoryId = Convert.ToInt32(categoryGridView.DataKeys[e.RowIndex].Value);
            string categoryName = ((TextBox)categoryGridView.Rows[e.RowIndex].FindControl("txtCategoryName")).Text;
            string status = ((DropDownList)categoryGridView.Rows[e.RowIndex].FindControl("ddlStatus")).SelectedValue;

            // Update the data in the database
            UpdateCategory(categoryId, categoryName, status);

            // Exit edit mode
            categoryGridView.EditIndex = -1;
            BindCategoryData();
        }

        protected void categoryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            categoryGridView.EditIndex = -1;
            BindCategoryData();
        }

        protected void categoryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the categoryId for the item to be deleted
            int categoryId = Convert.ToInt32(categoryGridView.DataKeys[e.RowIndex].Value);

            // Delete the data from the database
            DeleteCategory(categoryId);

            BindCategoryData();
        }

        private void InsertCategory(string categoryName, string status)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Category (categoryName, status) VALUES (@CategoryName, @Status)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryName", categoryName);
                    command.Parameters.AddWithValue("@Status", status);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void UpdateCategory(int categoryId, string categoryName, string status)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Category SET categoryName = @CategoryName, status = @Status WHERE categoryId = @CategoryId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryName", categoryName);
                    command.Parameters.AddWithValue("@Status", status);
                    command.Parameters.AddWithValue("@CategoryId", categoryId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void DeleteCategory(int categoryId)
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Category WHERE categoryId = @CategoryId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryId", categoryId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void BindCategoryData()
        {
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT categoryId, categoryName, status FROM Category";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    categoryGridView.DataSource = reader;
                    categoryGridView.DataBind();
                }
            }
        }
    }
}
