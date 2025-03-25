using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class addSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load categories on the initial page load
                BindCategories();
                // Display the initially loaded data
                DisplayData();
            }

           
        }

        protected void BindCategories()
        {
            // Use your connection string
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT categoryId, categoryName FROM Category", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    categoryDropDown.DataSource = reader;
                    categoryDropDown.DataTextField = "categoryName";
                    categoryDropDown.DataValueField = "categoryId";
                    categoryDropDown.DataBind();
                    con.Close();
                }
            }
            categoryDropDown.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        protected void AddSubCategory_Click(object sender, EventArgs e)
        {

            // Validate that a category is selected
            if (categoryDropDown.SelectedValue == "0")
            {
                // Display an error message or handle as needed
                // For example, show a validation error label or alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "CategoryNotSelectedAlert",
                    "alert('Please select a category.');", true);
                return;
            }

            // Validate that the subcategory name is unique
            if (!IsSubCategoryNameUnique(subcategoryNameTextBox.Text.Trim()))
            {
                // Display an error message or handle as needed
                // For example, show a validation error label or alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SubCategoryNotUniqueAlert",
                    "alert('Subcategory Name is not unique. Please choose a different name.');", true);
                return;
            }

            // Insert subcategory into the database
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Subcategory (subcategoryName, status, categoryId) VALUES (@subcategoryName, @status, @category)", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@subcategoryName", subcategoryNameTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", statusDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@category", categoryDropDown.SelectedValue);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            // Display success message
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SubCategoryAddedAlert",
                "alert('Subcategory successfully added.');", true);

            // Display the updated data
            DisplayData();
        }

        private bool IsSubCategoryNameUnique(string subcategoryName)
        {
            // Check if the subcategory name already exists in the database
            // Implement your logic to check uniqueness, e.g., using a SELECT query

            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Subcategory WHERE subcategoryName = @SubcategoryName";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SubcategoryName", subcategoryName);

                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count == 0; // If count is 0, the name is unique; otherwise, it's not.
                }
            }
        }

        protected void DisplayData()
        {
            // Display the inserted subcategories in the GridView
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT Subcategory.subcategoryId, Subcategory.subcategoryName, Subcategory.status, Category.categoryName FROM Subcategory INNER JOIN Category ON Subcategory.categoryId = Category.categoryId", con))
                {
                    System.Data.DataTable dt = new System.Data.DataTable();
                    sda.Fill(dt);
                    subcategoryGridView.DataSource = dt;
                    subcategoryGridView.DataBind();
                }
            }
        }

        protected void subcategoryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            subcategoryGridView.EditIndex = e.NewEditIndex;
            DisplayData();
        }

        protected void subcategoryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = subcategoryGridView.Rows[e.RowIndex];
            int subcategoryId = Convert.ToInt32(subcategoryGridView.DataKeys[e.RowIndex].Values[0]);
            string subcategoryName = (row.FindControl("txtSubCategoryName") as TextBox).Text;
            string status = (row.FindControl("ddlStatus") as DropDownList).SelectedValue;

            // Update the subcategory in the database
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Subcategory SET subcategoryName = @subcategoryName, status = @status WHERE subcategoryId = @subcategoryId", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@subcategoryName", subcategoryName);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@subcategoryId", subcategoryId);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            subcategoryGridView.EditIndex = -1;
            DisplayData();
        }

        protected void subcategoryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            subcategoryGridView.EditIndex = -1;
            DisplayData();
        }

        protected void subcategoryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int subcategoryId = Convert.ToInt32(subcategoryGridView.DataKeys[e.RowIndex].Values[0]);

            //// Delete the subcategory from the database
            //string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("DELETE FROM Subcategory WHERE subcategoryId = @subcategoryId", con))
            //    {
            //        con.Open();
            //        cmd.Parameters.AddWithValue("@subcategoryId", subcategoryId);
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //    }
            //}

            //DisplayData();



            // Check for dependencies in other tables
            if (HasDependenciesInOtherTables(subcategoryId))
            {
                // Display an alert or handle as needed
                ScriptManager.RegisterStartupScript(this, this.GetType(), "DependentRecordsAlert",
                    "alert('Cannot delete the subcategory because it has associated records in other tables.');", true);
            }
            else
            {
                // Delete the subcategory from the database
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Subcategory WHERE subcategoryId = @subcategoryId", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@subcategoryId", subcategoryId);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Display success message
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "SubCategoryDeletedAlert",
                //    "alert('Subcategory successfully deleted.');", true);

                DisplayData();
            }

        }


        private bool HasDependenciesInOtherTables(int subcategoryId)
        {
            // Check if there are dependencies in other tables
            // Implement your logic to check dependencies, e.g., using additional SELECT queries

            // Example: Check if there are records in the Snacks table referencing the subcategory
            string snacksQuery = "SELECT COUNT(*) FROM Snacks WHERE subcategoryId = @SubcategoryId";

            // Add more queries for other tables as needed

            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(snacksQuery, connection))
                {
                    command.Parameters.AddWithValue("@SubcategoryId", subcategoryId);

                    connection.Open();
                    int snacksCount = Convert.ToInt32(command.ExecuteScalar());

                    return snacksCount > 0; // Return true if there are dependencies in Snacks table, false otherwise
                }
            }
        }
    }
}
