
using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class menu : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSnacksGrid();
            }
        }

        protected void BindSnacksGrid()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT snackId, snackName, description, image, price FROM Snacks", connection);

                SqlDataReader reader = cmd.ExecuteReader();
                snacksGridView.DataSource = reader;
                snacksGridView.DataBind();
            }
        }

        protected void snacksGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                if (Session["Username"] != null)
                {
                    string[] args = e.CommandArgument.ToString().Split(';');
                    if (args.Length >= 4) // Ensure there are enough arguments
                    {
                        int snackId = Convert.ToInt32(args[0]);
                        decimal price = Convert.ToDecimal(args[1]);
                        string snackName = args[2];
                        string image = args[3];
                        int quantity = 1; // Default quantity is 1

                        // If you have quantity as the 5th argument, parse it
                        if (args.Length >= 5)
                        {
                            quantity = Convert.ToInt32(args[4]);
                        }

                        string username = Session["Username"].ToString();

                        // Get user ID from session or database
                        int userId = GetUserId(username);

                        // Add item to cart and database
                        AddToCart(snackId, price, userId, quantity, username, snackName, image);

                        // Rebind the GridView
                        BindSnacksGrid();
                    }
                    else
                    {
                        // Handle insufficient arguments
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private int GetUserId(string username)
        {
            // Query the database to get user ID based on username
            int userId = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT UserId FROM Reg WHERE Username = @Username", connection);
                cmd.Parameters.AddWithValue("@Username", username);
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    userId = Convert.ToInt32(result);
                }
            }
            return userId;
        }

        private void AddToCart(int snackId, decimal price, int userId, int quantity, string username, string snackName, string image)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO CartItems (UserId, SnackId, SnackName, Price, Quantity, TotalPrice, Username, Image) VALUES (@UserId, @SnackId, @SnackName, @Price, @Quantity, @TotalPrice, @Username, @Image)", connection);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@SnackId", snackId);
                cmd.Parameters.AddWithValue("@SnackName", snackName);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@TotalPrice", price * quantity); // Calculate total price
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.ExecuteNonQuery();
            }
        }
    }
}