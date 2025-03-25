

using System;

namespace JayBhavaniLocho
{
    public partial class snackDisplay : System.Web.UI.UserControl
    {
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Redirect to addToCart.aspx and pass required data as query parameters
            Response.Redirect($"addToCart.aspx?image={hfImage.Value}&snackName={hfSnackName.Value}&description={hfDescription.Value}&price={hfPrice.Value}");
        }
    }
}


//using System;
//using System.Collections.Generic;

//namespace JayBhavaniLocho
//{
//    public partial class snackDisplay : System.Web.UI.UserControl
//    {
//        protected void btnAddToCart_Click(object sender, EventArgs e)
//        {
//            // Check if the user is logged in
//            if (Session["Username"] != null)
//            {
//                // Retrieve the logged-in user's ID or username from session
//                string userId = Session["Username"].ToString(); // Assuming you store the username in the session

//                // Create a cart item object
//                CartItem cartItem = new CartItem
//                {
//                    Image = hfImage.Value,
//                    SnackName = hfSnackName.Value,
//                    Description = hfDescription.Value,
//                    Price = hfPrice.Value,
//                    Quantity = 1 // Assuming default quantity is 1
//                };

//                // Check if the user already has a cart stored in session
//                if (Session["UserCart"] == null)
//                {
//                    // If not, create a new cart and add the item to it
//                    Dictionary<string, CartItem> userCart = new Dictionary<string, CartItem>();
//                    userCart.Add(userId, cartItem);
//                    Session["UserCart"] = userCart;
//                }
//                else
//                {
//                    // If the user already has a cart, retrieve it from session and add/update the item
//                    Dictionary<string, CartItem> userCart = (Dictionary<string, CartItem>)Session["UserCart"];

//                    if (userCart.ContainsKey(userId))
//                    {
//                        // If the user already has items in the cart, update the quantity if the item is already in the cart
//                        userCart[userId].Quantity++;
//                    }
//                    else
//                    {
//                        // If the user doesn't have items in the cart, add the item
//                        userCart.Add(userId, cartItem);
//                    }

//                    // Update the session variable with the modified cart
//                    Session["UserCart"] = userCart;
//                }

//                // Redirect to the cart page
//                Response.Redirect("addToCart.aspx");
//            }
//            else
//            {
//                // If the user is not logged in, redirect to the login page
//                Response.Redirect("login.aspx");
//            }
//        }
//    }

//    //define the cartitem class to represent items in the cart
//    public class CartItem
//    {
//        public string Image { get; set; }
//        public string SnackName { get; set; }
//        public string Description { get; set; }
//        public string Price { get; set; }
//        public int Quantity { get; set; }
//    }
//}

