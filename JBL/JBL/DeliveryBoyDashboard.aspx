<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryBoyDashboard.aspx.cs" Inherits="JBL.DeliveryBoyDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Boy Dashboard</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1L_dstPt3HV5HzF6Gvk/e3s4Wz6iJgD/+ub2oU" crossorigin="anonymous">
    <!-- Add custom CSS link or styles -->
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style>
        body {
    font-family: Arial, sans-serif;
}

.welcome-message {
    color: #4caf50;
    font-weight: bold;
    font-size: 1.2rem;
}
 body {
        font-family: Arial, sans-serif;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    .welcome-message {
        color: #4caf50;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th,
    .table td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .table th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    .table tr:hover {
        background-color: #f5f5f5;
    }

    .btn-logout {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: #fff;
    background-color: #e74c3c;
    border: none;
    border-radius: 3px;
    text-decoration: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-logout:hover {
    background-color: #c0392b;
}

/* Navbar */
.navbar {
    position: relative; /* Ensure relative positioning for absolute positioning of logout button */
    background-color: #f8f9fa; /* Background color */
    padding: 10px 0; /* Padding for top and bottom */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Optional: Adding shadow */
}

.navbar-brand {
    margin-left: 50px;
    color: blueviolet; /* Brand color */
    font-size: 24px; /* Optional: Adjust font size */
}

.navbar-nav {
    margin-right: 20px; /* Optional: Adjust margin */
}

/* Logout Button */
.logout-btn {
    position: absolute;
    top: 15px;
    right: 20px;
    padding: 8px 15px; /* Adjust padding as needed */
    background-color: transparent; /* Transparent background */
    border: 2px solid blueviolet; /* Border color */
    color: blueviolet; /* Text color */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Cursor style */
    transition: all 0.3s ease; /* Smooth transition */
}

.logout-btn:hover {
    background-color: blueviolet; /* Background color on hover */
    color: white; /* Text color on hover */
}

.logout-btn:focus {
    outline: none; /* Remove focus outline */
}

/* Media Query for Small Devices (Mobile) */
@media (max-width: 768px) {
    .logout-btn {
        top: 10px; /* Adjust top position for small screens */
    }
}


/* Media Query for Small Devices (Mobile) */
@media (max-width: 768px) {
    .navbar-brand {
        margin-left: 10px; /* Adjust margin for small screens */
    }
}



/* Responsive styles for smaller screens */
@media (max-width: 767.98px) {
    .welcome-message {
        font-size: 1rem;
    }
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <p class="navbar-brand">JBL Delivery</p>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">

                        <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="logout-btn nav-link btn btn-outline-danger" OnClick="btnLogout_Click" />

                    </ul>

                    <a href="DelChangePass.aspx">Change Password</a>

                </div>

                
            </div>

        </nav>



        <div class="container mt-4">
            <center><h1 class="text-center mb-4">Delivery Boy Dashboard</h1></center>
            <center><asp:Label ID="lblWelcomeMessage" runat="server" CssClass="welcome-message mb-3" /></center>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />

            <div class="row">
                <div class="col-12">
                    <h2>Orders Assigned to Delivery Boy</h2>
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                        <Columns>
                            <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                            <%--<asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd/MM/yyyy}" />--%>
                            <asp:BoundField DataField="Amount" HeaderText="Total Amount" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <%--<div class="row mt-3">
                <div class="col-12 text-end">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger btn-logout" OnClick="btnLogout_Click" />
                </div>
            </div>--%>
        </div>
    </form>
    <!-- Add Bootstrap JS link -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBud7TlRbs/ic4AwGcFZOxg5DpPt8EgeUIgIwzjWfXQKWA3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>
  

