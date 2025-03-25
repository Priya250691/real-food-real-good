using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class addSnack : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadSubcategories(); // Load subcategories on the initial page load
                BindSnacksGrid();
            }

            

        }

        private void LoadCategories()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT CategoryId, CategoryName FROM Category";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dtCategories = new DataTable();
                    adapter.Fill(dtCategories);

                    categoryDropDown.DataSource = dtCategories;
                    categoryDropDown.DataTextField = "CategoryName";
                    categoryDropDown.DataValueField = "CategoryId";
                    categoryDropDown.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                Console.WriteLine(ex.Message);
            }
        }

        protected void categoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubcategories();
        }

        private void LoadSubcategories()
        {
            try
            {
                int categoryId = Convert.ToInt32(categoryDropDown.SelectedValue);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT SubcategoryId, SubcategoryName FROM Subcategory WHERE CategoryId = @CategoryId";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dtSubcategories = new DataTable();
                    adapter.Fill(dtSubcategories);

                    subcategoryDropDown.Items.Clear();
                    subcategoryDropDown.Items.Add(new ListItem("-- Select Sub-Category --", ""));
                    subcategoryDropDown.DataSource = dtSubcategories;
                    subcategoryDropDown.DataTextField = "SubcategoryName";
                    subcategoryDropDown.DataValueField = "SubcategoryId";
                    subcategoryDropDown.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                Console.WriteLine(ex.Message);
            }
        }

        private void BindSnacksGrid()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT s.snackId, c.categoryName, sc.subcategoryName, s.snackName, s.description, s.image, s.price, s.status " +
                    "FROM Snacks s " +
                    "JOIN Category c ON s.categoryId = c.categoryId " +
                    "JOIN Subcategory sc ON s.subcategoryId = sc.subcategoryId", connection);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                snacksGridView.DataSource = dt;
                snacksGridView.DataBind();
            }
        }


        protected void AddSnack_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO Snacks (categoryId, subcategoryId, snackName, description, image, price, status) VALUES (@CategoryId, @SubcategoryId, @SnackName, @Description, @ImageUrl, @Price, @Status)", connection);

                    // Assuming you have a FileUpload control named image
                    if (image.HasFile)
                    {
                        // Specify the folder where you want to save the images
                        string uploadFolderPath = Server.MapPath("/MyImages/");

                        // Create the folder if it doesn't exist
                        if (!Directory.Exists(uploadFolderPath))
                        {
                            Directory.CreateDirectory(uploadFolderPath);
                        }

                        // Get the file name
                        string fileName = Path.GetFileName(image.FileName);

                        // Combine the folder path and file name to get the full path
                        string imagePath = Path.Combine(uploadFolderPath, fileName);

                        // Save the file to the server
                        image.SaveAs(imagePath);

                        // Save imagePath to the database
                        cmd.Parameters.AddWithValue("@ImageUrl", "/MyImages/" + fileName);
                    }
                    else
                    {
                        // Handle case where no image is uploaded
                        cmd.Parameters.AddWithValue("@ImageUrl", DBNull.Value); // or set it to a default image path
                    }

                    cmd.Parameters.AddWithValue("@CategoryId", categoryDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@SubcategoryId", subcategoryDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@SnackName", snackname.Text);
                    cmd.Parameters.AddWithValue("@Description", description.Text);
                    cmd.Parameters.AddWithValue("@Price", price.Text);
                    cmd.Parameters.AddWithValue("@Status", status.SelectedValue);

                    cmd.ExecuteNonQuery();
                }
                // Display a success message using JavaScript
                string script = "alert('Snack added successfully!');";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                // Refresh the GridView or update data as needed
                BindSnacksGrid();

                // Clear the form fields
                ClearForm();
            }
            catch (Exception ex)
            {
                // Handle exceptions, log errors, or display a user-friendly message
                // You might want to improve error handling based on your specific needs
                Response.Write("Error: " + ex.Message);
            }
        }


        protected void snacksGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            snacksGridView.EditIndex = e.NewEditIndex;
            BindSnacksGrid();

            // Find the FileUpload control in the edited row
            FileUpload fuEditImage = (FileUpload)snacksGridView.Rows[e.NewEditIndex].FindControl("fuEditImage");
            // Find the HiddenField containing the existing image URL
            HiddenField hdnEditImage = (HiddenField)snacksGridView.Rows[e.NewEditIndex].FindControl("hdnEditImage");
            // Make the FileUpload control visible
            fuEditImage.Visible = true;
            // Set the value of the FileUpload control to the existing image URL
            fuEditImage.Attributes["value"] = hdnEditImage.Value;
        }




        

        protected void snacksGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int snackId = Convert.ToInt32(snacksGridView.DataKeys[e.RowIndex].Values["snackId"]);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Snacks SET snackName = @SnackName, description = @Description, image = @Image, price = @Price, status = @Status WHERE snackId = @SnackId", connection);

                    cmd.Parameters.AddWithValue("@SnackId", snackId);
                    cmd.Parameters.AddWithValue("@SnackName", (snacksGridView.Rows[e.RowIndex].FindControl("txtSnackName") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Description", (snacksGridView.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Price", (snacksGridView.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Status", (snacksGridView.Rows[e.RowIndex].FindControl("ddlStatus") as DropDownList).SelectedValue);

                    // Update the image only if a new image is uploaded
                    FileUpload fuEditImage = (FileUpload)snacksGridView.Rows[e.RowIndex].FindControl("fuEditImage");
                    if (fuEditImage.HasFile)
                    {
                        string uploadFolderPath = Server.MapPath("/MyImages/");
                        string fileName = Path.GetFileName(fuEditImage.FileName);
                        string imagePath = Path.Combine(uploadFolderPath, fileName);
                        fuEditImage.SaveAs(imagePath);
                        cmd.Parameters.AddWithValue("@Image", "/MyImages/" + fileName);
                    }
                    else
                    {
                        // Keep the existing image if no new image is uploaded
                        cmd.Parameters.AddWithValue("@Image", (snacksGridView.Rows[e.RowIndex].FindControl("imgSnack") as Image).ImageUrl);
                    }

                    cmd.ExecuteNonQuery();
                }

                snacksGridView.EditIndex = -1;
                BindSnacksGrid(); // Assuming you have a method to bind data to the GridView

                // Optionally, you can display a success message using JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", "alert('Update successful!');", true);
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                errorLabel.Text = "Error: " + ex.Message;
            }
        }





        protected void snacksGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            snacksGridView.EditIndex = -1;
            BindSnacksGrid();
        }

        protected void snacksGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int snackId = Convert.ToInt32(snacksGridView.DataKeys[e.RowIndex].Values["snackId"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Snacks WHERE snackId = @SnackId", connection);
                cmd.Parameters.AddWithValue("@SnackId", snackId);
                cmd.ExecuteNonQuery();
            }

            BindSnacksGrid();
        }

        protected void ClearForm()
        {
            categoryDropDown.ClearSelection();
            subcategoryDropDown.Items.Clear();
            subcategoryDropDown.Items.Add(new ListItem("-- Select Sub-Category --", ""));
            snackname.Text = string.Empty;
            description.Text = string.Empty;
            price.Text = string.Empty;
            status.SelectedIndex = 0;
            snacksGridView.EditIndex = -1;
            BindSnacksGrid();
        }
    }
}
