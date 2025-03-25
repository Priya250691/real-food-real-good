<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="JBL.registration" %>  


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
                            <a href="registration.aspx" class="nav-item nav-link active">Registration</a>
                        </div>



                        <% } %>
                         



                       
                    </div>

                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Registration</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="home.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="menu.aspx">Menu</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Registration</li>
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
            <div class="video">
                <button type="button" class="btn-play" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/DWRcNpR6Kdc" data-bs-target="#videoModal">
                    <span></span>
                </button>
            </div>
        </div>
        <div class="col-md-6 bg-dark d-flex align-items-center">
            <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                <h5 class="section-title ff-secondary text-start text-primary fw-normal">Registration</h5>
                <h1 class="text-white mb-4">Register Yourself</h1>
                <form id="form1" runat="server" onsubmit="return validateRegistration();">
                    <div class="row g-3">
                        <!-- Full Name field -->

                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" onblur="validateField('txtFullName', 'lblFullNameError');"></asp:TextBox>
                                <label for="txtFullName">Full Name</label>
                            </div>
                            <asp:Label ID="lblFullNameError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Username -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" onblur="validateField('txtUsername', 'lblUsernameError');"></asp:TextBox>
                                <label for="txtUsername">Username</label>
                            </div>
                            <asp:Label ID="lblUsernameError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Mobile Number -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" onblur="validateField('txtMobileNumber', 'lblMobileNumberError');"></asp:TextBox>
                                <label for="txtMobileNumber">Mobile Number</label>
                            </div>
                            <asp:Label ID="lblMobileNumberError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Date of Birth -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" onblur="validateField('txtDateOfBirth', 'lblDateOfBirthError');"></asp:TextBox>
                                <label for="txtDateOfBirth">Date of Birth</label>
                            </div>
                            <asp:Label ID="lblDateOfBirthError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Gender -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" onblur="validateField('ddlGender', 'lblGenderError');">
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:DropDownList>
                                <label for="ddlGender">Gender</label>
                            </div>
                            <asp:Label ID="lblGenderError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Address -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" onblur="validateField('txtAddress', 'lblAddressError');"></asp:TextBox>
                                <label for="txtAddress">Address</label>
                            </div>
                            <asp:Label ID="lblAddressError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- City -->
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" onblur="validateField('ddlCity', 'lblCityError');">
                                    <asp:ListItem Text="Select City" Value="" />
                                    <asp:ListItem Text="Surat" Value="Surat" />
                                    <asp:ListItem Text="Ahmedabad" Value="Ahmedabad" />
                                    <asp:ListItem Text="bardoili" Value="bardoili" />
                                    <asp:ListItem Text="Gandhinagar" Value="Gandhinagar" />
                                </asp:DropDownList>
                                <label for="ddlCity">City</label>
                            </div>
                            <asp:Label ID="lblCityError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Pincode -->
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" onblur="validateField('txtPincode', 'lblPincodeError');"></asp:TextBox>
                                <label for="txtPincode">Pincode</label>
                            </div>
                            <asp:Label ID="lblPincodeError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Email -->
                        <div class="col-md-6">
                            <div class="form-floating">
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" onblur="validateField('txtEmail', 'lblEmailError');"></asp:TextBox>
                                <label for="txtEmail">Your Email</label>
                            </div>
                            <asp:Label ID="lblEmailError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                        <!-- Password -->
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" onblur="validateField('txtPassword', 'lblPasswordError');"></asp:TextBox>
                                <label for="txtPassword">Password</label>
                            </div>
                            <asp:Label ID="lblPasswordError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                    <!-- Submit button -->
                    <div class="col-12 mt-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                    <!-- Error message for general errors -->
                    <div class="col-md-6 mt-2">
                        <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                    </div>
                </form>
                <div class="text-white mt-4">
                    <a href="login.aspx"> Already Registered? <u>Login</u> </a>
                </div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        function validateRegistration() {
            // Validate Full Name
            var fullName = document.getElementById('<%= txtFullName.ClientID %>').value;
            if (!/^[a-zA-Z\s]+$/.test(fullName) || /\d/.test(fullName) || /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(fullName)) {
                showError('<%= lblFullNameError.ClientID %>', 'Invalid Full Name. It should not contain digits or special characters.');
                return false;
            } else {
                hideError('<%= lblFullNameError.ClientID %>');
            }


            // Validate Username
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;

            if (!/^[a-z0-9_]+$/.test(username) || username.toUpperCase() === username || username.length <= 5) {
                showError('<%= lblUsernameError.ClientID %>', 'Invalid Username. It should not contain capital letters, only support underscore as a special character, and have a minimum length of 5 characters.');
                return false;
            } else {
                hideError('<%= lblUsernameError.ClientID %>');
            }


            // Validate Mobile Number
            var mobileNumber = document.getElementById('<%= txtMobileNumber.ClientID %>').value;
            if (!/^[6-9]\d{9}$/.test(mobileNumber)) {
                showError('<%= lblMobileNumberError.ClientID %>', 'Invalid Mobile Number.');
                return false;
            } else {
                hideError('<%= lblMobileNumberError.ClientID %>');
            }

            // Validate Date of Birth
            var dateOfBirth = document.getElementById('<%= txtDateOfBirth.ClientID %>').value;
            if (!isValidDateOfBirth(dateOfBirth)) {
                showError('<%= lblDateOfBirthError.ClientID %>', 'Invalid Date of Birth. Date of Birth must be at least 15 years ago. ');
                return false;
            } else {
                hideError('<%= lblDateOfBirthError.ClientID %>');
            }

            // Validate City
            var city = document.getElementById('<%= ddlCity.ClientID %>').value;
            if (city === '') {
                showError('<%= lblCityError.ClientID %>', 'Please select a City.');
                return false;
            } else {
                hideError('<%= lblCityError.ClientID %>');
            }

            // Validate Pincode
            var pincode = document.getElementById('<%= txtPincode.ClientID %>').value;
            if (!/^\d{6}$/.test(pincode)) {
                showError('<%= lblPincodeError.ClientID %>', 'Pincode must contain six digits.');
                return false;
            } else {
                hideError('<%= lblPincodeError.ClientID %>');
            }

            // Validate Email
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            if (!isValidEmail(email) || !email.endsWith("@gmail.com")) {
                showError('<%= lblEmailError.ClientID %>', 'Invalid Email address. Only Gmail accounts are supported.');
                return false;
            } else {
                hideError('<%= lblEmailError.ClientID %>');
            }

            // Validate Password
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
            if (!validatePassword(password)) {
                showError('<%= lblPasswordError.ClientID %>', 'Invalid Password. It must contain 6 to 15 characters, at least one special character, and at least one digit.');
                return false;
            } else {
                hideError('<%= lblPasswordError.ClientID %>');
            }

            return true;
        }

        function validateField(inputId, errorLabelId) {
            var input = document.getElementById(inputId);
            var errorLabel = document.getElementById(errorLabelId);

            // Your validation logic here
            if (input.value.trim() === "") {
                errorLabel.textContent = "This field is required";
                return false;
            } else {
                errorLabel.textContent = "";
                return true;
            }
        }

        function showError(elementId, message) {
            var errorLabel = document.getElementById(elementId);
            errorLabel.innerText = message;
            errorLabel.style.display = 'block';
        }

        function hideError(elementId) {
            var errorLabel = document.getElementById(elementId);
            errorLabel.innerText = '';
            errorLabel.style.display = 'none';
        }

        function isValidUsername(username) {
            return /^[a-zA-Z0-9_]*$/.test(username);
        }

        function isValidDateOfBirth(dateOfBirth) {
            var currentDate = new Date();
            var inputDate = new Date(dateOfBirth);
            var ageDifference = currentDate.getFullYear() - inputDate.getFullYear();

            if (ageDifference < 15) {
                return false;
            }

            return true;
        }

        function isValidEmail(email) {
            var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }

        function validatePassword(password) {
            // Check if password is between 6 to 15 characters
            if (password.length < 6 || password.length > 15) {
                return false;
            }

            // Check if password contains at least one special character
            if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password)) {
                return false;
            }

            // Check if password contains at least one digit
            if (!/\d/.test(password)) {
                return false;
            }

            return true;
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



