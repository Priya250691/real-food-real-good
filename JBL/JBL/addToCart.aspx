<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addToCart.aspx.cs" Inherits="JayBhavaniLocho.addToCart" %>

   
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add to Cart Page</title>
    <style>
        /* Center align the heading */
        h1 {
            text-align: center;
        }

        /* Style for the cart grid */
        #cartGridView {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        /* Style for table headers */
        #cartGridView th {
            background-color: #f2f2f2;
            padding: 10px;
            text-align: left;
        }

        /* Style for table cells */
        #cartGridView td {
            padding: 10px;
        }

        /* Style for images in the cart */
        #cartGridView img {
            max-width: 100px;
            height: auto;
        }

        /* Style for quantity input */
        .quantity {
            width: 40px;
            text-align: center;
        }

        /* Style for checkout section */
        #lblCheckoutAmount,
        #lblTotalAmount {
            font-weight: bold;
        }

        /* Style for the checkout button */
        #btnCheckout {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        #btnCheckout:hover {
            background-color: #0056b3;
        }


        /* Style for the container of the "Back" button */
.back-button-container {
    position: absolute;
    top: 20px; /* Adjust as needed */
    right: 20px; /* Adjust as needed */
}

/* Style for the "Back" button */
.back-button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

/* Hover effect for the "Back" button */
.back-button:hover {
    background-color: #0056b3;
}


/* Flexbox container for positioning */
.checkout-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Style for the checkout label */
.checkout-label {
    text-align: center;
}

/* Style for the checkout button */
.checkout-button {
    margin-left: auto; /* Pushes the button to the right */
}

/* Styling for the button (similar to the "Back" button) */
#btnCheckout {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

/* Hover effect for the button */
#btnCheckout:hover {
    background-color: #0056b3;
}

/* Style for the "Remove" button */
.remove-button {
    padding: 8px 12px;
    background-color: #dc3545; /* Red color for delete action */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

/* Hover effect for the "Remove" button */
.remove-button:hover {
    background-color: #c82333; /* Darker shade of red */
}

/* Active effect for the "Remove" button when clicked */
.remove-button:active {
    background-color: #bd2130; /* Even darker shade of red */
}

    </style>
</head>
<body>
    <center><h1>Welcome to the cart</h1></center>

    <form id="form1" runat="server">
        <div>
            <center><h2 style="color: purple;">Your Cart</h2></center>

    <div class="back-button-container">
        <button type="button" onclick="goBack()" class="back-button">Back</button>
    </div>
            <asp:GridView ID="cartGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="SnackId">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgSnack" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SnackName" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="price" />
                    <asp:TemplateField HeaderText="Total Price">
                        <ItemTemplate>
                            <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Button ID="btnDecreaseQuantity" runat="server" Text="-" CommandName="DecreaseQuantity" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="decreaseQuantity(this); return false;" />
                            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' Width="30" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" CssClass="quantity" />
                            <asp:Button ID="btnIncreaseQuantity" runat="server" Text="+" CommandName="IncreaseQuantity" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="increaseQuantity(this); return false;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <%--<asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveItem" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnRemove_Click" />--%>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveItem" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnRemove_Click" CssClass="remove-button" />

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="checkout-container">
    <div class="checkout-label">
        <asp:Label ID="lblCheckoutAmount" runat="server" Text="Total Checkout Amount: "></asp:Label>
        <asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label>
    </div>
    <div class="checkout-button">
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
    </div>
</div>

        </div>
    </form>
    <script>
        // Function to handle increase quantity button click
        function increaseQuantity(btn) {
            var textBox = btn.parentElement.querySelector('[id*=txtQuantity]');
            var quantity = parseInt(textBox.value);
            textBox.value = quantity + 1;
            textBox.onchange(); // Trigger the change event to update the total price
        }

        // Function to handle decrease quantity button click
        function decreaseQuantity(btn) {
            var textBox = btn.parentElement.querySelector('[id*=txtQuantity]');
            var quantity = parseInt(textBox.value);
            if (quantity > 1) {
                textBox.value = quantity - 1;
                textBox.onchange(); // Trigger the change event to update the total price
            }
        }


        // Function to navigate back to the menu.aspx page
        function goBack() {
            window.location.href = "menu.aspx";
        }
    </script>
</body>
</html>


