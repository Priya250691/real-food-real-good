<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffRegister.aspx.cs" Inherits="JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms.staffRegister" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Staff Registration</title>
     <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Delivery Boy Registration</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico" />
</head>
<body>


    
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="../../index.aspx"><img src="../../assets/images/logo.svg" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="../../index.aspx"><img src="../../assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            
          </div>
          <ul class="navbar-nav navbar-nav-right">
            <%--<li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="../../assets/images/faces/face1.jpg" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black">David Greymaax</p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item" href="#">
                  <i class="mdi mdi-cached me-2 text-success"></i> Activity Log </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">
                  <i class="mdi mdi-logout me-2 text-primary"></i> Signout </a>
              </div>
            </li>--%>
               <% if (Session["Username"] != null)
                    { %>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="nav-profile-img">
                            <img src="../../assets/images/faces/face1.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black"><%= Session["Username"] %></p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="#">
                            <i class="mdi mdi-cached me-2 text-success"></i>Activity Log </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="https://localhost:44338/logout.aspx">
                            <i class="mdi mdi-logout me-2 text-primary"></i>Signout </a>
                    </div>
                </li>
                <% }
                 else
                {
                    Response.Redirect("https://localhost:44338/login.aspx");
                } %>
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>
            
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="../../assets/images/faces/face1.jpg" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                  <div class="nav-profile-text d-flex flex-column">
                      <span class="font-weight-bold mb-2"><%= Session["Username"] %></span>
                      <span class="text-secondary text-small">Project Manager</span>
                  </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
             
            <li class="nav-item">
              <a class="nav-link" href="../../index.aspx">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
              <li class="nav-item">
                    <a class="nav-link" href="addCategory.aspx">
                        <span class="menu-title">Add category</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addSubCategory.aspx">
                        <span class="menu-title">Add Subcategory</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addSnack.aspx">
                        <span class="menu-title">Add Sanck</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="deliReg.aspx">
                        <span class="menu-title">Add Delivery Boy</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="staffRegister.aspx">
                        <span class="menu-title">Add Staff </span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deliView.aspx">
                        <span class="menu-title">View Delivery Boy</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="staff_list.aspx">
                        <span class="menu-title">View Staff</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="generateReport.aspx">
                        <span class="menu-title">Generat Report</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="orders.aspx">
                        <span class="menu-title">Orders</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
            <%--<li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Basic UI Elements</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/buttons.html">Buttons</a></li>
                  <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/typography.html">Typography</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../../pages/icons/mdi.html">
                <span class="menu-title">Icons</span>
                <i class="mdi mdi-contacts menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../../pages/forms/basic_elements.html">
                <span class="menu-title">Forms</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../../pages/charts/chartjs.html">
                <span class="menu-title">Charts</span>
                <i class="mdi mdi-chart-bar menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../../pages/tables/basic-table.html">
                <span class="menu-title">Tables</span>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                <span class="menu-title">Sample Pages</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
              </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="../../pages/samples/blank-page.html"> Blank Page </a></li>
                  <li class="nav-item"> <a class="nav-link" href="../../pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="../../pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="../../pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="../../pages/samples/error-500.html"> 500 </a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item sidebar-actions">
              <span class="nav-link">
                <div class="border-bottom">
                  <h6 class="font-weight-normal mb-3">Projects</h6>
                </div>
                <button class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Add a project</button>
                <div class="mt-4">
                  <div class="border-bottom">
                    <p class="text-secondary">Categories</p>
                  </div>
                  <ul class="gradient-bullet-list mt-4">
                    <li>Free</li>
                    <li>Pro</li>
                  </ul>
                </div>
              </span>
            </li>--%>
          </ul>
        </nav>

          <!-- partial -->
          <div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="card">
                <div class="card-body">
                    <h2 style="text-align: center;">Staff Registration Form</h2>
                    <p class="card-description"></p>
                    <div class="container">
                        
                        <form id="formRegister" runat="server" onsubmit="return validateForm()" class="registration-form">
                            <div class="form-group">
                                <label for="txtFullName">Full Name:</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Full Name" required></asp:TextBox>
                                <span class="error-message" id="fullNameError" style="display: none;">Full Name is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtEmail">Email:</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" required></asp:TextBox>
                                <span class="error-message" id="emailError" style="display: none;">Email Address is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtPhone">Phone:</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone Number" required></asp:TextBox>
                                <span class="error-message" id="phoneError" style="display: none;">Phone Number is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">Address:</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="3" required></asp:TextBox>
                                <span class="error-message" id="addressError" style="display: none;">Address is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtDOB">Date of Birth:</label>
                                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" required></asp:TextBox>
                                <span class="error-message" id="dobError" style="display: none;">Date of Birth is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtUsername">Username:</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" required></asp:TextBox>
                                <span class="error-message" id="usernameError" style="display: none;">Username is required</span>
                            </div>
                            <div class="form-group">
                                <label for="txtPassword">Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" required></asp:TextBox>
                                <span class="error-message" id="passwordError" style="display: none;">Password is required</span>
                            </div>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    /* Styles for the container */
    .card {
        margin-top: 20px;
    }

    /* Styles for the card body */
    .card-body {
        padding: 20px;
    }

    /* Styles for the card title */
    .card-title {
        font-size: 20px;
        margin-bottom: 15px;
    }

    /* Styles for the registration form */
    .registration-form {
        width: 100%;
        max-width: 400px;
        margin: 0 auto;
    }

    .registration-form .form-group {
        margin-bottom: 15px;
    }

    .registration-form .form-control {
        border-radius: 0;
    }

    .registration-form .btn {
        border-radius: 0;
    }

    /* Styles for the error messages */
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>

<script>
    function validateForm() {
        var isValid = true;

        // Validate Full Name
        if (document.getElementById('txtFullName').value.trim() === '') {
            document.getElementById('fullNameError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('fullNameError').style.display = 'none';
        }

        // Validate Email Address
        if (document.getElementById('txtEmail').value.trim() === '') {
            document.getElementById('emailError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('emailError').style.display = 'none';
        }

        // Validate Phone Number
        if (document.getElementById('txtPhone').value.trim() === '') {
            document.getElementById('phoneError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('phoneError').style.display = 'none';
        }

        // Validate Address
        if (document.getElementById('txtAddress').value.trim() === '') {
            document.getElementById('addressError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('addressError').style.display = 'none';
        }

        // Validate Date of Birth
        if (document.getElementById('txtDOB').value.trim() === '') {
            document.getElementById('dobError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('dobError').style.display = 'none';
        }

        // Validate Username
        if (document.getElementById('txtUsername').value.trim() === '') {
            document.getElementById('usernameError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('usernameError').style.display = 'none';
        }

        // Validate Password
        if (document.getElementById('txtPassword').value.trim() === '') {
            document.getElementById('passwordError').style.display = 'inline';
            isValid = false;
        } else {
            document.getElementById('passwordError').style.display = 'none';
        }

        return isValid;
    }
</script>

          <!-- main-panel ends -->
      </div>
        <!-- page-body-wrapper ends -->
    </div>

     <script>
         function submitForm() {
             <%--var categoryName = document.getElementById('<%= categoryNameTextBox.ClientID %>').value.trim();

             if (categoryName === '') {
                 alert('Please enter a Category Name.');
                 return false;
             }--%>
             // You can add client-side validation logic here if needed
             return true;
         }

         function cancelForm() {
             // You can add cancel logic here if needed
         }
     </script>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="../../assets/js/file-upload.js"></script>
    <!-- End custom js for this page -->










    
</body>
</html>