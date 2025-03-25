<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSnack.aspx.cs" Inherits="JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.pages.forms.addSnack" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Snack    </title>
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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

</head>
<body>

    

    <div class="container-scroller">
        <!-- partial:../../partials/_navbar.html -->
        <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="../../index.html">
                    <img src="../../assets/images/logo.svg" alt="logo" /></a>
                <a class="navbar-brand brand-logo-mini" href="../../index.html">
                    <img src="../../assets/images/logo-mini.svg" alt="logo" /></a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-menu"></span>
                </button>
                <div class="search-field d-none d-md-block">
                </div>
                <ul class="navbar-nav navbar-nav-right">
                   <%-- <li class="nav-item nav-profile dropdown">
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
                    <%--<li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="mdi mdi-email-outline"></i>
                            <span class="count-symbol bg-warning"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                            <h6 class="p-3 mb-0">Messages</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <img src="../../assets/images/faces/face4.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Mark send you a message</h6>
                                    <p class="text-gray mb-0">1 Minutes ago </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <img src="../../assets/images/faces/face2.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Cregh send you a message</h6>
                                    <p class="text-gray mb-0">15 Minutes ago </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <img src="../../assets/images/faces/face3.jpg" alt="image" class="profile-pic">
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Profile picture updated</h6>
                                    <p class="text-gray mb-0">18 Minutes ago </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <h6 class="p-3 mb-0 text-center">4 new messages</h6>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                            <i class="mdi mdi-bell-outline"></i>
                            <span class="count-symbol bg-danger"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                            <h6 class="p-3 mb-0">Notifications</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-success">
                                        <i class="mdi mdi-calendar"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Event today</h6>
                                    <p class="text-gray ellipsis mb-0">Just a reminder that you have an event today </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-warning">
                                        <i class="mdi mdi-settings"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Settings</h6>
                                    <p class="text-gray ellipsis mb-0">Update dashboard </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item preview-item">
                                <div class="preview-thumbnail">
                                    <div class="preview-icon bg-info">
                                        <i class="mdi mdi-link-variant"></i>
                                    </div>
                                </div>
                                <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                                    <h6 class="preview-subject font-weight-normal mb-1">Launch Admin</h6>
                                    <p class="text-gray ellipsis mb-0">New admin wow! </p>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <h6 class="p-3 mb-0 text-center">See all notifications</h6>
                        </div>
                    </li>
                    <li class="nav-item nav-logout d-none d-lg-block">
                        <a class="nav-link" href="#">
                            <i class="mdi mdi-power"></i>
                        </a>
                    </li>
                    <li class="nav-item nav-settings d-none d-lg-block">
                        <a class="nav-link" href="#">
                            <i class="mdi mdi-format-line-spacing"></i>
                        </a>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="mdi mdi-menu"></span>
                </button>--%>
            </div>
        </nav>
    </div>

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
                            <li class="nav-item"><a class="nav-link" href="../../pages/ui-features/buttons.html">Buttons</a></li>
                            <li class="nav-item"><a class="nav-link" href="../../pages/ui-features/typography.html">Typography</a></li>
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
                            <li class="nav-item"><a class="nav-link" href="../../pages/samples/blank-page.html">Blank Page </a></li>
                            <li class="nav-item"><a class="nav-link" href="../../pages/samples/login.html">Login </a></li>
                            <li class="nav-item"><a class="nav-link" href="../../pages/samples/register.html">Register </a></li>
                            <li class="nav-item"><a class="nav-link" href="../../pages/samples/error-404.html">404 </a></li>
                            <li class="nav-item"><a class="nav-link" href="../../pages/samples/error-500.html">500 </a></li>
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
        <%--<div class="main-panel">
          <div class="content-wrapper">
            
            <div class="row">

                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title" style="margin-left: 500px;">Add Sub-Category form</h4>
                    <p class="card-description"> </p>
                    <form class="forms-sample">
                       <div class="form-group">
                      <label for="exampleFormControlSelect1">Status</label>
                      <select class="form-control form-control-lg" id="exampleFormControlSelect1">
                        <option></option>
                        <option></option>
                       
                      </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputUsername1">SubCategory Name</label>
                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Sub-Category Name"/>
                      </div>
                     <div class="form-group">
                      <label for="exampleFormControlSelect1">Status</label>
                      <select class="form-control form-control-lg" id="exampleFormControlSelect2">
                        <option>Active</option>
                        <option>Deactive</option>
                       
                      </select>
                      </div>
                      <button type="submit" class="btn btn-gradient-primary me-2">Submit</button>
                      <button class="btn btn-light">Cancel</button>
                    </form>
                  </div>
                </div>
              </div>
              </div>--%>

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="margin-left: 500px;">Add Snack form</h4>
                            <p class="card-description"></p>
                            <form class="forms-sample" runat="server" onsubmit="return submitForm()">


                                <div class="form-group">
                                    <label for="categoryDropDown">Category</label>
                                    <asp:DropDownList ID="categoryDropDown" runat="server" CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="categoryDropDown_SelectedIndexChanged">

                                        <%--Populate categories dynamically in code-behind--%>
                                    </asp:DropDownList>
                                </div>


                                <%--<div class="form-group">
                                    <label for="categoryDropDown">Category</label>
                                    <asp:DropDownList ID="categoryDropDown" runat="server" CssClass="form-control" required>
                                        
                                    </asp:DropDownList>
                                </div>--%>

                                <div class="form-group">
                                    <label for="subcategoryDropDown">Sub-Category</label>
                                    <asp:DropDownList ID="subcategoryDropDown" runat="server" CssClass="form-control" required>
                                        <asp:ListItem Text="-- Select Sub-Category --" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label for="snackname">Snack Name</label>
                                    <asp:TextBox ID="snackname" runat="server" CssClass="form-control" placeholder="Enter Snack Name" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter Snack Description" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="image">Image</label>
                                    <asp:FileUpload ID="image" runat="server" CssClass="form-control-file" required />
                                </div>

                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <asp:TextBox ID="price" runat="server" CssClass="form-control" placeholder="Enter Snack Price" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <%--<asp:DropDownList ID="status" runat="server" CssClass="form-control" required>
                                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>--%>
                                    <asp:DropDownList runat="server" ID="status" CssClass="form-control form-control-lg" Enabled="false">
                                      <asp:ListItem Text="Active" Value="Active" Selected="True" />
                                      <asp:ListItem Text="Deactive" Value="Deactive" />
                                    </asp:DropDownList>
                                </div>

                                <asp:Button ID="AddSnack" runat="server" Text="Add Snack" CssClass="btn btn-primary mr-2" OnClick="AddSnack_Click" />

                                <!-- Display the inserted data -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Inserted Snacks</h4>
                                        <asp:Label ID="errorLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        <asp:GridView ID="snacksGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="snackId"
                                            OnRowEditing="snacksGridView_RowEditing" OnRowUpdating="snacksGridView_RowUpdating"
                                            OnRowCancelingEdit="snacksGridView_RowCancelingEdit" OnRowDeleting="snacksGridView_RowDeleting"
                                            UpdateCommand="snacksGridView_UpdateCommand">
                                            <Columns>
                                                <asp:BoundField DataField="snackId" HeaderText="Snack ID" ReadOnly="true" />

                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("categoryName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Subcategory">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubcategory" runat="server" Text='<%# Eval("subcategoryName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Snack Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSnackName" runat="server" Text='<%# Eval("snackName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:HiddenField ID="hdnSnackId" runat="server" Value='<%# Eval("snackId") %>' />
                                                        <asp:TextBox ID="txtSnackName" runat="server" Text='<%# Bind("snackName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>



                                                <%--<asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <!-- Display the image or a placeholder as needed -->
                                                        <asp:Image ID="imgSnack" runat="server" ImageUrl='<%# Eval("image") %>' CssClass="snackImage" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>

                                                        <asp:FileUpload ID="fuEditImage" runat="server" CssClass="form-control-file" />
                                                        <br />
                                                        <!-- Display the current image for reference -->
                                                        <asp:Image ID="imgEditSnack" runat="server" ImageUrl='<%# Bind("image") %>' CssClass="snackImage" />
                                                    </EditItemTemplate>

                                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <!-- Display the image or a placeholder as needed -->
                                                        <asp:Image ID="imgSnack" runat="server" ImageUrl='<%# Eval("image") %>' CssClass="snackImage" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <!-- Display the current image for reference -->
                                                        <asp:Image ID="imgEditSnack" runat="server" ImageUrl='<%# Bind("image") %>' CssClass="snackImage" />
                                                        <br />
                                                        <!-- Display the file upload control only in edit mode -->
                                                        <asp:FileUpload ID="fuEditImage" runat="server" CssClass="form-control-file" Visible="false" />
                                                        <asp:HiddenField ID="hdnEditImage" runat="server" Value='<%# Bind("image") %>' />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Price">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlStatus" runat="server">
                                                            <asp:ListItem Text="Active" Value="Active" />
                                                            <asp:ListItem Text="Inactive" Value="Inactive" />
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:CommandField ShowEditButton="True" />
                                                <%--<asp:CommandField ShowDeleteButton="True" />--%>
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

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Function to show alert when clicking on the "Delete" button in GridView
        function showAlertOnDelete() {
            if (!confirm('Are you sure you want to delete this sub-category?')) {
                return false;
            }
        }
    </script>

    <style>
        .snackImage {
            width: 100px; /* Set the desired width */
            height: 100px; /* Set the desired height */
            object-fit: cover; /* Preserve aspect ratio and cover the entire container */
        }
    </style>

    <style>
        .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            color: #333;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style for GridView */
        #snacksGridView {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

            #snacksGridView th, #snacksGridView td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

            #snacksGridView th {
                background-color: #f2f2f2;
            }

            #snacksGridView tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            #snacksGridView tr:hover {
                background-color: #ddd;
            }

            #snacksGridView input,
            #snacksGridView select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }

        .page-body-wrapper {
            margin-top: 70px;
        }
    </style>


              

    <script>
      
    function submitForm() {
        return true;
        }
        // Example usage
       

    </script>
          
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


