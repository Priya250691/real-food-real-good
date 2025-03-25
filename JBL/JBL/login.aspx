<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="JayBhavaniLocho.login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
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
                        <a href="menu.aspx" class="nav-item nav-link">Menu</a>
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
                            <a href="login.aspx" class="nav-item nav-link active">Login</a>
                        </div>



                        <% } %>
                         



                       
                    </div>

                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Login</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                           <li class="breadcrumb-item"><a href="home.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="menu.aspx">Menu</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Login</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
        <div class="row g-0">
            <div class="col-md-6">
                <div>
                    <img src="https://winscollege.net/winsrecipients/adminpanel/studentloginpanel/images/login.png" height="450px" width="500px" style="margin-left: 100px;" />
                </div>
            </div>
            <div class="col-md-6 bg-dark d-flex align-items-center">
                <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                    <h5 class="section-title ff-secondary text-start text-primary fw-normal">Login</h5>
                    <h1 class="text-white mb-4">Login into the website</h1>
                    <form id="loginForm" runat="server" onclick="return validateLoginForm()">
                        <div class="row g-3">
                            <%--<div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtUsername">Username</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <label for="txtPassword">Password</label>
                            </div>
                        </div>--%>

                            <%--<input type="hidden" id="Hidden1" runat="server" />--%>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="txtUsername">Username</label>
                                </div>
                                <div id="usernameError" class="text-danger" runat="server"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <label for="txtPassword">Password</label>
                                </div>
                                <div id="passwordError" class="text-danger" runat="server"></div>
                            </div>


                            <div class="col-12">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                            </div>
                        </div>
                    </form>
                    <div class="text-white mt-4">
                        <a href="registration.aspx">Not Registered? <u>Register Now</u> </a><br />
                        <a href="ForgotPassword.aspx">Forgot Password </a><br />
                         <a href="Dellogin.aspx"> <u>Delivery Boy Login</u> </a><br />
                        <a href="StaffLogin.aspx"> <u>Staff Login</u> </a><br />

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add this script at the end of your HTML body section -->
    <%--<script>
        // Function to validate and show error messages
        function validateLoginForm() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
            var isValid = true;

            // Reset previous error messages
            removeErrorMessages();

            // Check for empty username
            if (username.trim() === "") {
                showError('<%= txtUsername.ClientID %>', 'Please enter your username', 'usernameError');
                isValid = false;
            }

            // Check for empty password
            if (password.trim() === "") {
                showError('<%= txtPassword.ClientID %>', 'Please enter your password', 'passwordError');
                isValid = false;
            }

            return isValid;
        }

        // Function to show error message
        function showError(elementId, errorMessage, errorLabelId) {
            var errorDiv = document.createElement("div");
            errorDiv.className = "text-danger error-message";
            errorDiv.innerHTML = errorMessage;

            var inputElement = document.getElementById(elementId);
            inputElement.parentNode.appendChild(errorDiv);

            // Set the error message in the hidden field
        }

        // Function to remove error messages
        function removeErrorMessages() {
            var errorMessages = document.querySelectorAll(".error-message");
            errorMessages.forEach(function (element) {
                element.remove();
            });

            // Reset the hidden error labels
            document.getElementById('<%= usernameError.ClientID %>').innerHTML = '';
            document.getElementById('<%= passwordError.ClientID %>').innerHTML = '';
        }

        // Submit form with validation
        document.getElementById('<%= btnLogin.ClientID %>').addEventListener("click", function (event) {
            if (!validateLoginForm()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    </script>--%>


        <!-- Add this script within the head or at the end of the body section in your HTML -->
<script>
    // Function to validate and show error messages
    function validateLoginForm() {
        var username = document.getElementById('<%= txtUsername.ClientID %>').value;
        var password = document.getElementById('<%= txtPassword.ClientID %>').value;
        var isValid = true;

        // Reset previous error messages
        removeErrorMessages();

        // Check for empty username
        if (username.trim() === "") {
            showError('<%= txtUsername.ClientID %>', 'Please enter your username', 'usernameError');
            isValid = false;
        }

        // Check for empty password
        if (password.trim() === "") {
            showError('<%= txtPassword.ClientID %>', 'Please enter your password', 'passwordError');
            isValid = false;
        }

        return isValid;
    }

    // Function to show error message
    function showError(elementId, errorMessage, errorLabelId) {
        var errorDiv = document.createElement("div");
        errorDiv.className = "text-danger error-message";
        errorDiv.innerHTML = errorMessage;

        var inputElement = document.getElementById(elementId);
        inputElement.parentNode.appendChild(errorDiv);

        // Set the error message in the hidden field
    }

    // Function to remove error messages
    function removeErrorMessages() {
        var errorMessages = document.querySelectorAll(".error-message");
        errorMessages.forEach(function (element) {
            element.remove();
        });

        // Reset the hidden error labels
        document.getElementById('<%= usernameError.ClientID %>').innerHTML = '';
        document.getElementById('<%= passwordError.ClientID %>').innerHTML = '';
    }

    // Attach the onblur event to input fields
    document.getElementById('<%= txtUsername.ClientID %>').addEventListener("blur", function () {
        validateLoginForm();
    });

    document.getElementById('<%= txtPassword.ClientID %>').addEventListener("blur", function () {
        validateLoginForm();
    });

    // Submit form with validation
    document.getElementById('<%= btnLogin.ClientID %>').addEventListener("click", function (event) {
        if (!validateLoginForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
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

        <!-- Add this script at the end of your HTML body section -->


        

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

