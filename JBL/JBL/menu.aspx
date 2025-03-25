<%-- SEM  6--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="JayBhavaniLocho.menu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Menu</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

   
</head>
<body>

    <form id="form1" runat="server">

    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Jay Bhavani Locho</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="home.aspx" class="nav-item nav-link ">Home</a>
                        <a href="about.aspx" class="nav-item nav-link">About</a>

                        <%--<a href="service.html" class="nav-item nav-link">Service</a>--%>
                        <a href="menu.aspx" class="nav-item nav-link active">Menu</a>
                        <a href="contact.aspx" class="nav-item nav-link">Contact</a>


                        <% if (Session["Username"] != null)
                            { %>
                        <div class="nav-item dropdown">
                            <a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <%= Session["Username"] %>
                            </a>
                            <div class="dropdown-menu m-0">
                                <a href="changepass.aspx" class="dropdown-item">Change Password</a>
                                <a href="updateProfile.aspx" class="dropdown-item">Update Profile</a>
                                <%--<a href="profileDetails.aspx" class="dropdown-item">Profile Details</a>--%>
                                <a href="logout.aspx" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                        <% }
                        else
                        { %>
                        <div class="nav-item dropdown">
                            <%--<a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        Profile
                                    </a>
                                    <div class="dropdown-menu m-0">
                                         <a href="login.aspx">Login</a>
                                    </div>--%>
                            <a href="login.aspx" class="nav-link">Login</a>
                        </div>



                        <% } %>
                        <a href="addToCart.aspx" class="nav-link" onclick="return checkLoggedIn()">
                            <i class="fas fa-shopping-cart"></i>Cart
                        </a>



                       
                    </div>

                </div>
            </nav>

            



            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Food Menu</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                           <li class="breadcrumb-item"><a href="home.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="menu.aspx">Menu</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


 <%--<asp:GridView ID="snacksGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="snacksGridView_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="imgSnack" runat="server" ImageUrl='<%# Eval("image") %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="snackName" HeaderText="Name" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("snackId") %>' />
                            <asp:Button ID="btnIncreaseQuantity" runat="server" Text="+" CommandName="IncreaseQuantity" CommandArgument='<%# Eval("snackId") %>' OnClientClick="increaseQuantity(this);" />
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" Width="30" />
                            <asp:Button ID="btnDecreaseQuantity" runat="server" Text="-" CommandName="DecreaseQuantity" CommandArgument='<%# Eval("snackId") %>' OnClientClick="decreaseQuantity(this);" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
        <div class="grid-item">
            <asp:GridView ID="snacksGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="snacksGridView_RowCommand">
                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:Image ID="imgSnack" runat="server" ImageUrl='<%# Eval("image") %>' Height="100" Width="100" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="snackName" HeaderText="Name" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("snackId") + ";" + Eval("price") + ";" + Eval("snackName") + ";" + Eval("image") %>' />

                            <asp:Button ID="btnIncreaseQuantity" runat="server" Text="+" CommandName="IncreaseQuantity" CommandArgument='<%# Eval("snackId") %>' OnClientClick="increaseQuantity(this);" />
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" Width="30" />
                            <asp:Button ID="btnDecreaseQuantity" runat="server" Text="-" CommandName="DecreaseQuantity" CommandArgument='<%# Eval("snackId") %>' OnClientClick="decreaseQuantity(this);" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>



        <style>

            /* Center the table within the grid-item */
.grid-item table {
    margin: 0 auto;
}

/* Style for table cells */
.grid-item td ,th{
    padding: 5px;
    border:groove;
    text-align: center;
    border-bottom: 1px solid #ddd; /* Add bottom border to each row */
}

/* Style for the last row of the table */
.grid-item tr:last-child td {
    border-bottom: none; /* Remove bottom border from the last row */
}

/* Style for the button */
.grid-item .btn {
    margin-top: 10px; /* Add some space between the table and the button */
    width: auto; /* Set width to auto to fit the content */
}

        </style>













        <script>
            // Function to handle increase quantity button click
            function increaseQuantity(btn) {
                var textBox = btn.parentElement.querySelector('[id*=txtQuantity]');
                var quantity = parseInt(textBox.value);
                textBox.value = quantity + 1;
            }

            // Function to handle decrease quantity button click
            function decreaseQuantity(btn) {
                var textBox = btn.parentElement.querySelector('[id*=txtQuantity]');
                var quantity = parseInt(textBox.value);
                if (quantity > 1) {
                    textBox.value = quantity - 1;
                }
            }
        </script>















        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-8">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Jay Bhavani Locho</h4>
                        <a class="btn btn-link" href="about.aspx">About Us</a>
                        <a class="btn btn-link" href="contact.aspx">Contact Us</a>
                        <%--<a class="btn btn-link" href="">Reservation</a>--%>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-8">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>4/1318 Rangoonwala street, Surat</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 9879041518</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>jaybhavanilocho@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-8">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>06AM - 02PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>06AM - 02PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Jay Bhavani Locho</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">Oza Tech</a><br><br>
                            <%--Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>--%>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        </form>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>
</html>