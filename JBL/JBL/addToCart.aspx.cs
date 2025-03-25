//// WORKINGH CODE

//using System;
//using System.Collections.Generic;
//using System.Web.UI.WebControls;

//namespace JayBhavaniLocho
//{
//    public partial class addToCart : System.Web.UI.Page
//    {
//        // Define a class to represent a snack item
//        public class SnackItem
//        {
//            public string Image { get; set; }
//            public string SnackName { get; set; }
//            public string Description { get; set; }
//            public string Price { get; set; }
//            public int Quantity { get; set; }
//        }

//        // Create a list to store the items in the cart
//        private List<SnackItem> cartItems;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["Username"] == null)
//            {
//                Response.Redirect("~/login.aspx");
//            }

//            // Initialize the cartItems list
//            if (Session["CartItems"] == null)
//            {
//                cartItems = new List<SnackItem>();
//                Session["CartItems"] = cartItems;
//            }
//            else
//            {
//                cartItems = (List<SnackItem>)Session["Username"];
//            }

//            if (!IsPostBack)
//            {
//                PopulateCartDetails();

//            }
//        }

//        protected void btnCheckout_Click(object sender, EventArgs e)
//        {
//            // Perform checkout logic here
//            // This could include processing the items in the cart and redirecting to a checkout page
//            // For the sake of this example, we'll simply redirect to a checkout page
//            Response.Redirect("checkout.aspx");
//        }

//        private void PopulateCartDetails()
//        {
//            // Retrieve snack details from the query string
//            string image = Request.QueryString["image"];
//            string snackName = Request.QueryString["snackName"];
//            string description = Request.QueryString["description"];
//            string price = Request.QueryString["price"];

//            // Add the new item to the cart
//            cartItems.Add(new SnackItem
//            {
//                Image = image,
//                SnackName = snackName,
//                Description = description,
//                Price = price,
//                Quantity = 1 // Default quantity is set to 1
//            });

//            //// Bind the cart items to the repeater control
//            //cartRepeater.DataSource = cartItems;
//            //cartRepeater.DataBind();


//            if (cartItems.Count > 0)
//            {
//                // Bind the cart items to the repeater control
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//            else
//            {
//                // If cart is empty, display "No items in the cart"
//                lblEmptyCartMessage.Visible = true;
//                lblEmptyCartMessage.Text = "No items in the cart.";

//                cartRepeater.Visible = false;
//            }
//        }

//        protected void cartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
//        {
//            if (e.CommandName == "RemoveItem")
//            {
//                int index = int.Parse(e.CommandArgument.ToString());
//                // Remove the item at the specified index from the cartItems list
//                cartItems.RemoveAt(index);
//                // Rebind the cartRepeater to reflect the changes
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//        }



//    }
//}


// WORKINGH CODE

//using System;
//using System.Collections.Generic;
//using System.Web.UI.WebControls;

//namespace JayBhavaniLocho
//{
//    public partial class addToCart : System.Web.UI.Page
//    {
//        // Define a class to represent a snack item
//        public class SnackItem
//        {
//            public string Image { get; set; }
//            public string SnackName { get; set; }
//            public string Description { get; set; }
//            public string Price { get; set; }
//            public int Quantity { get; set; }
//        }

//        // Create a list to store the items in the cart
//        private List<SnackItem> cartItems;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["Username"] == null)
//            {
//                Response.Redirect("~/login.aspx");
//                return;
//            }

//            // Initialize the cartItems list
//            if (Session["CartItems"] == null)
//            {
//                cartItems = new List<SnackItem>();
//                Session["CartItems"] = cartItems;
//            }
//            else
//            {
//                cartItems = (List<SnackItem>)Session["CartItems"];
//            }


//            if (!IsPostBack)
//            {
//                PopulateCartDetails();

//            }
//        }

//        protected void btnCheckout_Click(object sender, EventArgs e)
//        {
//            // Perform checkout logic here
//            // This could include processing the items in the cart and redirecting to a checkout page
//            // For the sake of this example, we'll simply redirect to a checkout page
//            Response.Redirect("checkout.aspx");
//        }

//        private void PopulateCartDetails()
//        {
//            // Retrieve snack details from the query string
//            string image = Request.QueryString["image"];
//            string snackName = Request.QueryString["snackName"];
//            string description = Request.QueryString["description"];
//            string price = Request.QueryString["price"];

//            // Add the new item to the cart
//            cartItems.Add(new SnackItem
//            {
//                Image = image,
//                SnackName = snackName,
//                Description = description,
//                Price = price,
//                Quantity = 1 // Default quantity is set to 1
//            });

//            //// Bind the cart items to the repeater control
//            //cartRepeater.DataSource = cartItems;
//            //cartRepeater.DataBind();


//            if (cartItems.Count > 0)
//            {
//                // Bind the cart items to the repeater control
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//            else
//            {
//                // If cart is empty, display "No items in the cart"
//                lblEmptyCartMessage.Visible = true;
//                lblEmptyCartMessage.Text = "No items in the cart.";

//                cartRepeater.Visible = false;
//            }
//        }

//        protected void cartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
//        {
//            if (e.CommandName == "RemoveItem")
//            {
//                int index = int.Parse(e.CommandArgument.ToString());
//                // Remove the item at the specified index from the cartItems list
//                cartItems.RemoveAt(index);
//                // Rebind the cartRepeater to reflect the changes
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//        }



//    }
//}



//using System;
//using System.Collections.Generic;
//using System.Web.UI.WebControls;

//namespace JayBhavaniLocho
//{
//    public partial class addToCart : System.Web.UI.Page
//    {
//        // Define a class to represent a snack item
//        public class SnackItem
//        {
//            public string Image { get; set; }
//            public string SnackName { get; set; }
//            public string Description { get; set; }
//            public string Price { get; set; }
//            public int Quantity { get; set; }
//        }

//        // Create a list to store the items in the cart
//        private List<SnackItem> cartItems;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // Ensure that the user is authenticated
//            if (Session["Username"] == null)
//            {
//                Response.Redirect("~/login.aspx");
//                return;
//            }

//            // Retrieve the user's cart items from the session
//            cartItems = Session["CartItems"] as List<SnackItem>;

//            if (cartItems == null)
//            {
//                cartItems = new List<SnackItem>();
//            }

//            if (!IsPostBack)
//            {
//                // Retrieve snack details from the query string
//                string image = Request.QueryString["image"];
//                string snackName = Request.QueryString["snackName"];
//                string description = Request.QueryString["description"];
//                string price = Request.QueryString["price"];

//                // Create a new SnackItem object with the retrieved details
//                SnackItem newItem = new SnackItem
//                {
//                    Image = image,
//                    SnackName = snackName,
//                    Description = description,
//                    Price = price,
//                    Quantity = 1 // You can set default quantity here
//                };

//                // Add the item to the user's cart
//                AddToCart(newItem);

//                // Redirect to a different page or display a message as needed
//                //Response.Redirect("~/addToCart.aspx");
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//        }

//        // Method to add an item to the user's cart
//        private void AddToCart(SnackItem item)
//        {
//            // Add the item to the cart
//            cartItems.Add(item);

//            // Store the updated cart items back into the session
//            Session["CartItems"] = cartItems;
//        }

//        protected void btnCheckout_Click(object sender, EventArgs e)
//        {
//            // Perform checkout logic here
//            // This could include processing the items in the cart and redirecting to a checkout page
//            // For the sake of this example, we'll simply redirect to a checkout page
//            //Response.Redirect("checkout.aspx");
//        }

//        protected void cartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
//        {
//            if (e.CommandName == "RemoveItem")
//            {
//                int index = int.Parse(e.CommandArgument.ToString());
//                // Remove the item at the specified index from the cartItems list
//                cartItems.RemoveAt(index);
//                // Rebind the cartRepeater to reflect the changes
//                cartRepeater.DataSource = cartItems;
//                cartRepeater.DataBind();
//            }
//        }
//    }
//}




using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Razorpay.Api;

namespace JayBhavaniLocho
{
    public partial class addToCart : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
        private string razorpayApiKey = "rzp_test_oGd6RdTp3mczFm";
        private string razorpaySecretKey = "gJGWQ3UlmcPIkyQLPWVhEe7r";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind cart items to the GridView
                BindCartItems();
                CalculateAndDisplayTotalAmount();
            }
        }

        // Function to bind cart items to the GridView
        protected void BindCartItems()
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                int userId = GetUserId(username);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT CI.SnackId, S.snackName, S.description, CI.Quantity, CI.Price, CI.Quantity * CI.Price AS TotalPrice, S.image " +
                        "FROM CartItems CI " +
                        "INNER JOIN Snacks S ON CI.SnackId = S.snackId " +
                        "WHERE CI.UserId = @UserId", connection);

                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    cartGridView.DataSource = reader;
                    cartGridView.DataBind();

                    // Calculate total price for each row
                    foreach (GridViewRow row in cartGridView.Rows)
                    {
                        CalculateTotalPrice(row);
                    }
                }
            }
            else
            {
                // User is not logged in, redirect to the login page
                Response.Redirect("login.aspx");
            }
        }

        // Function to get user ID from username
        private int GetUserId(string username)
        {
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

        // Event handler for quantity text change
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox txtQuantity = (TextBox)sender;
            GridViewRow row = (GridViewRow)txtQuantity.NamingContainer;
            int snackId = Convert.ToInt32(cartGridView.DataKeys[row.RowIndex].Value);
            int newQuantity = Convert.ToInt32(txtQuantity.Text);

            // Update total price in the database
            UpdateTotalPriceInDatabase(snackId, newQuantity);

            // Rebind the GridView to reflect the changes
            BindCartItems();

            // Recalculate and display the total amount
            CalculateAndDisplayTotalAmount();
        }

        // Method to update total price in the database
        private void UpdateTotalPriceInDatabase(int snackId, int newQuantity)
        {
            // Perform database update to set the new total price based on the quantity
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("UPDATE CartItems SET Quantity = @Quantity, TotalPrice = Price * @Quantity WHERE SnackId = @SnackId", connection);
                cmd.Parameters.AddWithValue("@Quantity", newQuantity);
                cmd.Parameters.AddWithValue("@SnackId", snackId);
                cmd.ExecuteNonQuery();
            }
        }

        // Function to calculate and display total price for a row
        private void CalculateTotalPrice(GridViewRow row)
        {
            TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
            Label lblPrice = (Label)row.FindControl("lblPrice");
            Label lblTotalPrice = (Label)row.FindControl("lblTotalPrice");

            // Check if txtQuantity, lblPrice, and lblTotalPrice are found
            if (txtQuantity != null && lblPrice != null && lblTotalPrice != null)
            {
                int quantity;
                decimal pricePerItem;

                // Try to parse quantity and price
                if (int.TryParse(txtQuantity.Text, out quantity) && decimal.TryParse(lblPrice.Text, out pricePerItem))
                {
                    decimal totalPrice = quantity * pricePerItem;
                    lblTotalPrice.Text = totalPrice.ToString();
                }
                else
                {
                    // Handle parsing failure
                    lblTotalPrice.Text = "Error";
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnRemove = (Button)sender;
            GridViewRow row = (GridViewRow)btnRemove.NamingContainer;
            int snackId = Convert.ToInt32(cartGridView.DataKeys[row.RowIndex].Value);

            // Remove the item from the database
            RemoveItemFromDatabase(snackId);

            // Rebind the GridView to reflect the changes
            BindCartItems();
        }

        private void RemoveItemFromDatabase(int snackId)
        {
            // Perform database operation to remove the item based on the snackId
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM CartItems WHERE SnackId = @SnackId", connection);
                cmd.Parameters.AddWithValue("@SnackId", snackId);
                cmd.ExecuteNonQuery();
            }
        }

        private void CalculateAndDisplayTotalAmount()
        {
            decimal totalAmount = CalculateTotalAmount();
            lblTotalAmount.Text = totalAmount.ToString();
        }

        private decimal CalculateTotalAmount()
        {
            decimal totalAmount = 0;

            foreach (GridViewRow row in cartGridView.Rows)
            {
                Label lblTotalPrice = (Label)row.FindControl("lblTotalPrice");
                if (lblTotalPrice != null)
                {
                    decimal totalPrice;
                    if (decimal.TryParse(lblTotalPrice.Text, out totalPrice))
                    {
                        totalAmount += totalPrice;
                    }
                }
            }

            return totalAmount;
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Generate a unique receipt identifier within 40 characters
            string receiptId = "order_" + Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20); // Example: "order_a1b2c3d4e5f6"

            // Initialize Razorpay client with your API key and secret key
            RazorpayClient razorpayClient = new RazorpayClient(razorpayApiKey, razorpaySecretKey);

            // Create Razorpay order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", Convert.ToInt32(CalculateTotalAmount() * 100)); // Amount in paisa
            options.Add("currency", "INR");
            options.Add("receipt", receiptId); // Unique receipt identifier within 40 characters

            Order order = razorpayClient.Order.Create(options);

            // Save order details to the database
            SaveOrderDetailsToDatabase(order["id"].ToString(), receiptId, CalculateTotalAmount());

            // Clear the cart
            ClearCart();

            // Rebind the GridView to reflect the changes
            BindCartItems();

            // Redirect user to Razorpay checkout page
            Response.Redirect("~/razorpay_checkout.aspx?orderId=" + order["id"]);
        }

        private void ClearCart()
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                int userId = GetUserId(username);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM CartItems WHERE UserId = @UserId", connection);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }


        private void SaveOrderDetailsToDatabase(string orderId, string receiptId, decimal amount)
        {
            // Perform database operation to save order details
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Orders (OrderId, ReceiptId, Amount, OrderDate) VALUES (@OrderId, @ReceiptId, @Amount, @OrderDate)", connection);
                cmd.Parameters.AddWithValue("@OrderId", orderId);
                cmd.Parameters.AddWithValue("@ReceiptId", receiptId);
                cmd.Parameters.AddWithValue("@Amount", amount);

                // If you want to set a specific date and time, uncomment the following line and replace 'DateTime.Now' with the desired value
                 cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                cmd.ExecuteNonQuery();
            }
        }


    }
}



















