<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testReg.aspx.cs" Inherits="JayBhavaniLocho.testReg" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Change Password</title>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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
    <div class="container-xxl bg-white p-0">
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-darkblue px-4 px-lg-5 py-3 py-lg-0">
        <a href="" class="navbar-brand p-0">
            <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Jay Bhavani Locho</h1>
            <!-- <img src="img/logo.png" alt="Logo"> -->
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0 pe-4">
                <a href="home.aspx" class="nav-item nav-link active">Home</a>
                <a href="about.aspx" class="nav-item nav-link">About</a>

                <%--<a href="service.html" class="nav-item nav-link">Service</a>--%>
                <a href="menu.aspx" class="nav-item nav-link">Menu</a>
                <a href="contact.aspx" class="nav-item nav-link">Contact</a>


                <% if (Session["Username"] != null)
                    { %>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <%= Session["Username"] %>
                    </a>
                    <div class="dropdown-menu m-0">
                        <a href="changepass.aspx" class="dropdown-item">Change Password</a>
                        <a href="updateProfile.aspx" class="dropdown-item">Update Profile</a>
                        <a href="profileDetails.aspx" class="dropdown-item">Profile Details</a>
                        <a href="logout.aspx" class="dropdown-item">Logout</a>
                    </div>
                </div>
                <% }
                else
                { %>
                <div class="nav-item dropdown">
                    <%--<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        Profile
                                    </a>
                                    <div class="dropdown-menu m-0">--%>
                    <a href="login.aspx">Login</a>
                    <%--</div>--%>
                </div>



                <% } %>


                <%--<a href="" class="btn btn-primary py-2 px-4">Register</a>--%>
                <a href="addToCart.aspx" class="nav-link" onclick="return checkLoggedIn()">
                    <i class="fas fa-shopping-cart"></i>Cart
                </a>
            </div>
        </div>
    </nav>


            <script>
                function checkLoggedIn() {
                    var isLoggedIn = <%= Session["Username"] != null ? "true" : "false" %>;

                    if (!isLoggedIn) {
                        alert('Please login to add items to your cart.');
                        window.location.href = 'login.aspx';
                        return false;
                    } else {
                        // Get the username from the Session and pass it as a query parameter
                        var username = '<%= Session["Username"] %>';
                        window.location.href = 'addToCart.aspx?user=' + encodeURIComponent(username);
                        return false;
                    }

                    return true; // Proceed to addToCart.aspx
                }
    </script>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Change Password</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="home.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="menu.aspx">Menu</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Change Password</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 100px;">
        <div class="row g-0">
        <div class="col-md-6">
            <div >
                <img src="https://winscollege.net/winsrecipients/adminpanel/studentloginpanel/images/login.png" height="450px" width="500px" style="margin-left:100px;"/>
            </div>
        </div>
        <div class="col-md-6 bg-dark d-flex align-items-center">
            <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                <h5 class="section-title ff-secondary text-start text-primary fw-normal">Change Password</h5>
                <h1 class="text-white mb-4">Update Your Password</h1>
               <form id="changePasswordForm" runat="server">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="form-control" onblur="validateOldPassword()"></asp:TextBox>
                                        <label for="txtOldPassword">Old Password</label>
                                    </div>
                                    <asp:Label ID="lblOldPasswordError" runat="server" CssClass="text-danger"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" onblur="validateNewPassword()"></asp:TextBox>
                                        <label for="txtNewPassword">New Password</label>
                                    </div>
                                    <asp:Label ID="lblNewPasswordError" runat="server" CssClass="text-danger"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" onblur="validateConfirmPassword()"></asp:TextBox>
                                        <label for="txtConfirmPassword">Confirm New Password</label>
                                    </div>
                                    <asp:Label ID="lblConfirmPasswordError" runat="server" CssClass="text-danger"></asp:Label>
                                </div>
                                <div class="col-12">
                                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" />
                                </div>
                            </div>
                        </form>
            </div>
        </div>

    </div>
</div>

        <script>
            function validateOldPassword() {
                var oldPassword = document.getElementById('<%= txtOldPassword.ClientID %>').value;
            var lblOldPasswordError = document.getElementById('<%= lblOldPasswordError.ClientID %>');

                if (oldPassword.trim() === "") {
                    lblOldPasswordError.innerHTML = "Old Password is required.";
                } else {
                    lblOldPasswordError.innerHTML = "";
                }
            }

            function validateNewPassword() {
                var newPassword = document.getElementById('<%= txtNewPassword.ClientID %>').value;
            var lblNewPasswordError = document.getElementById('<%= lblNewPasswordError.ClientID %>');

            if (newPassword.trim() === "") {
                lblNewPasswordError.innerHTML = "New Password is required.";
            } else {
                lblNewPasswordError.innerHTML = "";
            }
        }

        function validateConfirmPassword() {
            var confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;
            var newPassword = document.getElementById('<%= txtNewPassword.ClientID %>').value;
            var lblConfirmPasswordError = document.getElementById('<%= lblConfirmPasswordError.ClientID %>');

                if (confirmPassword.trim() === "") {
                    lblConfirmPasswordError.innerHTML = "Confirm Password is required.";
                } else if (confirmPassword !== newPassword) {
                    lblConfirmPasswordError.innerHTML = "Passwords do not match.";
                } else {
                    lblConfirmPasswordError.innerHTML = "";
                }
            }
    </script>



        <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 16:9 aspect ratio -->
                        <div class="ratio ratio-16x9">
                            <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                                allow="autoplay"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reservation Start -->
        

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-8">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Jay Bhavani Locho</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Reservation</a>
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
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
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
                            Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
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

