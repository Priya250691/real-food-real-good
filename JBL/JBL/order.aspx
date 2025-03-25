<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="JBL.order" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Delivery Boy Order Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom CSS for the order page */
body {
    background-color: #f8f9fa;
    padding-top: 50px;
    font-family: Arial, sans-serif; /* Change font family for better readability */
}

.container {
    max-width: 800px;
    margin: auto;
}

.card {
    margin-top: 20px;
    border-radius: 10px; /* Add rounded corners to the card */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08); /* Add subtle shadow to the card */
}

.status-dropdown {
    margin-bottom: 10px;
}

.welcome-message {
    font-size: 24px;
    font-weight: bold;
    color: #333; /* Change text color */
    margin-bottom: 20px;
}

.error-message {
    color: red; /* Change error message color */
    margin-top: 10px;
}

.btn-logout {
    width: 100%;
    height: 40px;
    font-size: 16px;
    margin-top: 20px;
    border-radius: 5px; /* Add rounded corners to the button */
    background-color: #dc3545; /* Change button background color */
    color: #fff; /* Change button text color */
    border: none; /* Remove button border */
}

.btn-logout:hover {
    background-color: #c82333; /* Change button background color on hover */
}

@media (max-width: 576px) {
    .container {
        padding: 0 15px; /* Adjust padding for small screens */
    }
}

    </style>
</head>
<body>
   <form id="orderForm" runat="server">
       <%--  <div class="container">
            <h2>Welcome to the Delivery Boy Order Page</h2>
            <asp:Label ID="lblWelcomeMessage" runat="server" CssClass="welcome-message" />
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />
            <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="OrderId" 
                OnRowEditing="gvOrderDetails_RowEditing" OnRowUpdating="gvOrderDetails_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="true" />
                    <asp:BoundField DataField="ReceiptId" HeaderText="Receipt ID" ReadOnly="true" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="On the way" Value="On the way"></asp:ListItem>
                                <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                </Columns>
            </asp:GridView>
            <div class="mt-3">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
            </div>
        </div>--%>



       <div class="container">
            <h2>Welcome to the Delivery Boy Order Page</h2>
            <asp:Label ID="lblWelcomeMessage" runat="server" CssClass="welcome-message" />
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />
        <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="OrderId" 
    OnRowEditing="gvOrderDetails_RowEditing" OnRowUpdating="gvOrderDetails_RowUpdating"
    OnRowCancelingEdit="gvOrderDetails_RowCancelingEdit">
    <Columns>
        <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="true" />
        <asp:BoundField DataField="ReceiptId" HeaderText="Receipt ID" ReadOnly="true" />
        <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown">
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="On the way" Value="On the way"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <%--<asp:CommandField ShowEditButton="true" />--%>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" OnClientClick="return confirm('Are you sure you want to edit?');" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" OnClientClick="return confirm('Are you sure you want to update?');" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" OnClientClick="return confirm('Are you sure you want to cancel?');" />
            </EditItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

           
           </div>
       <div class="mt-3">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger btn-logout" OnClick="btnLogout_Click" />
        </div>
        
    </form>



</body>
</html>