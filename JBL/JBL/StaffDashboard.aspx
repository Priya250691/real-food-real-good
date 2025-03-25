<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDashboard.aspx.cs" Inherits="JBL.StaffDashboard" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Dashboard</title>
    <style>
       /* Responsive CSS */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
}

.container {
    max-width: 100%;
    margin: auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h2 {
    margin-bottom: 20px;
   
}

.username {
    font-size: 18px;
    margin-bottom: 20px;
}

.logout-btn {
    padding: 10px 20px;
    background-color: #e444cf;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.logout-btn:hover {
    background-color: #e4aedd;
}



    </style>
</head>
<body>
    <form id="orderForm" runat="server">
        <div class="container">
            <h1>Jay Bhavani Locho</h1>
            <h2>Staff Dashboard</h2>
            <div class="username">
                Logged in as:
                <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="btnLogout" runat="server" CssClass="logout-btn" Text="Logout" OnClick="btnLogout_Click" />
        </div>

        






        <div class="row">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Today's Orders</h4>
                        <div class="table-responsive">
                            <table class="table">







                                <asp:Label ID="lblWelcomeMessage" runat="server" CssClass="welcome-message" />
                                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />

                                <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="OrderId"
                                    OnRowEditing="gvOrderDetails_RowEditing" OnRowUpdating="gvOrderDetails_RowUpdating"
                                    OnRowCancelingEdit="gvOrderDetails_RowCancelingEdit" OnRowCommand="gvOrderDetails_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="true" />
                                        <asp:BoundField DataField="ReceiptId" HeaderText="Receipt ID" ReadOnly="true" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" />
                                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" ReadOnly="true" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown">
                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                    <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
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

                                        <asp:TemplateField HeaderText="Assign Delivery Boy">
                                            <ItemTemplate>
                                                <asp:Button ID="btnAssign" runat="server" Text="Assign" CommandName="Assign" CommandArgument='<%# Eval("OrderId") %>' OnClientClick="return confirm('Are you sure you want to assign a delivery boy?');" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>











                            </table>



                        </div>
                    </div>
                </div>
            </div>
        </div>



        <style>
            #orderForm {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

                #orderForm .welcome-message {
                    font-size: 24px;
                    font-weight: bold;
                    margin-bottom: 20px;
                }

                #orderForm .error-message {
                    color: red;
                    font-size: 18px;
                    margin-bottom: 20px;
                }

                #orderForm table {
                    border-collapse: collapse;
                    width: 100%;
                }

                #orderForm th,
                #orderForm td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }

                #orderForm th {
                    background-color: #f2f2f2;
                    font-size: 18px;
                    font-weight: bold;
                }

                #orderForm tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

                #orderForm tr:hover {
                    background-color: #ddd;
                }

                #orderForm .status-dropdown {
                    width: 100%;
                }

                #orderForm button {
                    background-color: #4CAF50;
                    border: none;
                    color: white;
                    cursor: pointer;
                    font-size: 16px;
                    padding: 8px 16px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    margin: 4px 2px;
                    transition-duration: 0.4s;
                }

                    #orderForm button:hover {
                        background-color: #3e8e41;
                    }
        </style>
    </form>
</body>
</html>
