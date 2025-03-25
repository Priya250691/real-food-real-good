<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deliView.aspx.cs" Inherits="JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms.deliView" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                              <h4 style="text-align: center;">Delivery Boy Registration Form</h4>
                              <p class="card-description"></p>
                              <form id="form1" runat="server">
                                  <div class="container">
                                      <h1>Delivery Boy Details</h1>
                                      <div class="table-container">
                                          <asp:GridView ID="gvDeliveryBoys" runat="server" DataKeyNames="ID" CssClass="table table-bordered table-striped" AutoGenerateColumns="False"
                                              OnRowEditing="gvDeliveryBoys_RowEditing" OnRowCancelingEdit="gvDeliveryBoys_RowCancelingEdit"
                                              OnRowUpdating="gvDeliveryBoys_RowUpdating" OnRowDeleting="gvDeliveryBoys_RowDeleting">
                                              <Columns>
                                                  <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" />
                                                  <asp:TemplateField HeaderText="Full Name">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Email">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Phone">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Address">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Vehicle Type">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblVehicleType" runat="server" Text='<%# Eval("VehicleType") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:DropDownList ID="ddlVehicleType" runat="server" SelectedValue='<%# Bind("VehicleType") %>'>
                                                              <asp:ListItem Text="Car" Value="Car"></asp:ListItem>
                                                              <asp:ListItem Text="Motorcycle" Value="Motorcycle"></asp:ListItem>
                                                              <asp:ListItem Text="Bicycle" Value="Bicycle"></asp:ListItem>
                                                          </asp:DropDownList>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Age">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Vehicle Number">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblVehicleNumber" runat="server" Text='<%# Eval("VehicleNumber") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtVehicleNumber" runat="server" Text='<%# Bind("VehicleNumber") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Driving License">
                                                      <ItemTemplate>
                                                          <asp:Label ID="lblDrivingLicense" runat="server" Text='<%# Eval("DrivingLicense") %>'></asp:Label>
                                                      </ItemTemplate>
                                                      <EditItemTemplate>
                                                          <asp:TextBox ID="txtDrivingLicense" runat="server" Text='<%# Bind("DrivingLicense") %>'></asp:TextBox>
                                                      </EditItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:CommandField ShowEditButton="True" />

                                                  <asp:TemplateField>
                                                      <ItemTemplate>
                                                          <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="return showAlertOnDelete();">Delete</asp:LinkButton>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                              </Columns>
                                          </asp:GridView>
                                      </div>
                                  </div>
                              </form>

                              <script>

                                  // Function to show alert when clicking on the "Delete" button in GridView
                                  function showAlertOnDelete() {
                                      if (!confirm('Are you sure you want to delete this sub-category?')) {
                                          return false;
                                      }
                                  }
                              </script>
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

                          /* Styles for the GridView */
                          #categoryGridView {
                              width: 100%;
                              margin-top: 15px;
                              border-collapse: collapse;
                          }

                              #categoryGridView th, #categoryGridView td {
                                  border: 1px solid #ddd;
                                  padding: 8px;
                                  text-align: left;
                              }

                              #categoryGridView th {
                                  background-color: #f2f2f2;
                              }

                              /* Styles for GridView editing and alternate rows */
                              #categoryGridView tr.edit-row,
                              #categoryGridView tr.alternate-row {
                                  background-color: #f9f9f9;
                              }

                              /* Styles for GridView edit and delete buttons */
                              #categoryGridView a.btn {
                                  margin-right: 5px;
                              }

                              /* Optional: Add hover effect to GridView rows */
                              #categoryGridView tbody tr:hover {
                                  background-color: #e6f7ff;
                              }

                          /* Styles for the GridView */
                          .table-container {
                              margin-top: 20px;
                              overflow-x: auto;
                          }

                          #gvDeliveryBoys {
                              width: 100%;
                              border-collapse: collapse;
                          }

                              #gvDeliveryBoys th, #gvDeliveryBoys td {
                                  border: 1px solid #ddd;
                                  padding: 8px;
                                  text-align: left;
                              }

                              #gvDeliveryBoys th {
                                  background-color: #f2f2f2;
                              }

                              /* Styles for GridView editing and alternate rows */
                              #gvDeliveryBoys tr.edit-row,
                              #gvDeliveryBoys tr.alternate-row {
                                  background-color: #f9f9f9;
                              }

                              /* Styles for GridView edit and delete buttons */
                              #gvDeliveryBoys a.btn {
                                  margin-right: 5px;
                              }

                              /* Optional: Add hover effect to GridView rows */
                              #gvDeliveryBoys tbody tr:hover {
                                  background-color: #e6f7ff;
                              }
                      </style>





                  </div>
              </div>




          </div>
          <!-- main-panel ends -->
      </div>
        <!-- page-body-wrapper ends -->
    </div>

     
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