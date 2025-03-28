﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.index" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />


      <%-- Charts --%>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  </head>
  <body>
    <div class="container-scroller">
      <div class="row p-0 m-0 proBanner" id="proBanner">
        <div class="col-md-12 p-0 m-0">
          <div class="card-body card-body-padding d-flex align-items-center justify-content-between">
            <div class="ps-lg-1">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 font-weight-medium me-3 buy-now-text">Free 24/7 customer support, updates, and more with this template!</p>
                <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/?utm_source=organic&utm_medium=banner&utm_campaign=buynow_demo" target="_blank" class="btn me-2 buy-now-btn border-0">Get Pro</a>
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-between">
              <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/"><i class="mdi mdi-home me-3 text-white"></i></a>
              <button id="bannerClose" class="btn border-0 p-0">
                <i class="mdi mdi-close text-white me-0"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="index.aspx"><img src="assets/images/logo.svg" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="index.aspx"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
            <%--<li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                    <div class="nav-profile-img">
                        <img src="assets/images/faces/face1.jpg" alt="image">
                        <span class="availability-status online"></span>
                    </div>
                    <div class="nav-profile-text">
                        <p class="mb-1 text-black">David Greymaax</p>
                    </div>
                </a>
                <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="mdi mdi-cached me-2 text-success"></i>Activity Log </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">
                        <i class="mdi mdi-logout me-2 text-primary"></i>Signout </a>
                </div>
            </li>--%>
                <% if (Session["Username"] != null)
                    { %>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="nav-profile-img">
                            <img src="assets/images/faces/face1.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black"><%= Session["Username"] %></p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="index.aspx">
                            <i class="mdi mdi-cached me-2 text-success"></i>Activity Log </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="adminChangepass.aspx">
                            <i class="mdi mdi-cached me-2 text-success"></i>Change Password </a>
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
            </ul>
            
            
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="assets/images/faces/face1.jpg" alt="profile">
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
              <a class="nav-link" href="index.aspx">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pages/forms/addCategory.aspx">
                    <span class="menu-title">Add Category</span>
                    <i class="mdi mdi-contacts menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pages/forms/addSubcategory.aspx">
                    <span class="menu-title">Add Sub-category</span>
                    <i class="mdi mdi-contacts menu-icon"></i>
                </a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="pages/forms/addSnack.aspx">
                    <span class="menu-title">Add Snack</span>
                    <i class="mdi mdi-contacts menu-icon"></i>
                </a>
            </li>
              <li class="nav-item">
                    <a class="nav-link" href="pages/forms/deliReg.aspx">
                        <span class="menu-title">Add Delivery Boy</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="pages/forms/staffRegister.aspx">
                        <span class="menu-title">Add Staff </span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/forms/deliView.aspx">
                        <span class="menu-title">View Delivery Boy</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="pages/forms/staff_list.aspx">
                        <span class="menu-title">View Staff</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="pages/forms/generateReport.aspx">
                        <span class="menu-title">Generat Report</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
              <li class="nav-item">
                    <a class="nav-link" href="pages/forms/orders.aspx">
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
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/icons/mdi.html">
                <span class="menu-title">Icons</span>
                <i class="mdi mdi-contacts menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/forms/basic_elements.html">
                <span class="menu-title">Forms</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/charts/chartjs.html">
                <span class="menu-title">Charts</span>
                <i class="mdi mdi-chart-bar menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/tables/basic-table.html">
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
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
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
                            <div class="page-header">
                                <h3 class="page-title">
                                    <span class="page-title-icon bg-gradient-primary text-white me-2">
                                        <i class="mdi mdi-home"></i>
                                    </span>Dashboard
                                </h3>
                                <nav aria-label="breadcrumb">
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">
                                            <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="row">
                                <div class="col-md-4 stretch-card grid-margin">
                                    <div class="card bg-gradient-danger card-img-holder text-white">
                                        <div class="card-body">
                                            <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                            <h4 class="font-weight-normal mb-3">Total Sales <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                            </h4>
                                            <h2 class="mb-5">
                                                <asp:Label ID="lblTotalAmount" runat="server" /></h2>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 stretch-card grid-margin">
                                    <div class="card bg-gradient-info card-img-holder text-white">
                                        <div class="card-body">
                                            <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                            <h4 class="font-weight-normal mb-3">Total Orders <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i></h4>
                                            <h2 class="mb-5">
                                                <asp:Label ID="lblTotalOrders" runat="server" />
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 stretch-card grid-margin">
                                    <div class="card bg-gradient-success card-img-holder text-white">
                                        <div class="card-body">
                                            <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                            <h4 class="font-weight-normal mb-3">Visitors Online <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                            </h4>
                                            <h2 class="mb-5">95,5741</h2>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form id="orderForm" runat="server">
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

                                </form>


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
                            <div class="row">
                                <div class="col-md-7 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <h4 class="card-title float-left">Visit And Sales Statistics</h4>
                                                <div id="visit-sale-chart-legend" class="rounded-legend legend-horizontal legend-top-right float-right"></div>
                                            </div>
                                            <canvas id="visit-sale-chart" class="mt-4"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Traffic Sources</h4>
                                            <canvas id="traffic-chart"></canvas>
                                            <div id="traffic-chart-legend" class="rounded-legend legend-vertical legend-bottom-left pt-4"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Project Status</h4>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th># </th>
                                                            <th>Name </th>
                                                            <th>Due Date </th>
                                                            <th>Progress </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1 </td>
                                                            <td>Herman Beck </td>
                                                            <td>May 15, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>2 </td>
                                                            <td>Messsy Adam </td>
                                                            <td>Jul 01, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>3 </td>
                                                            <td>John Richards </td>
                                                            <td>Apr 12, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-warning" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>4 </td>
                                                            <td>Peter Meggik </td>
                                                            <td>May 15, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>5 </td>
                                                            <td>Edward </td>
                                                            <td>May 03, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-danger" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>5 </td>
                                                            <td>Ronald </td>
                                                            <td>Jun 05, 2015 </td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-gradient-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title text-white">Todo</h4>
                                            <div class="add-items d-flex">
                                                <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?">
                                                <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task">Add</button>
                                            </div>
                                            <div class="list-wrapper">
                                                <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                                                    <li>
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox">
                                                                Meeting with Alisa
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                    <li class="completed">
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox" checked>
                                                                Call John
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox">
                                                                Create invoice
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox">
                                                                Print Statements
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                    <li class="completed">
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox" checked>
                                                                Prepare for presentation
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input class="checkbox" type="checkbox">
                                                                Pick up kids from school
                                                            </label>
                                                        </div>
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
          </div>





                
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid d-flex justify-content-between">
              <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © bootstrapdash.com 2021</span>
              <span class="float-none float-sm-end mt-1 mt-sm-0 text-end"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    
    <!-- container-scroller -->
    <!-- plugins:js -->





    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>
