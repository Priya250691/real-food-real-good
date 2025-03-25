<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dellogin.aspx.cs" Inherits="JBL.Dellogin" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Login - Delivery Boy</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
       /* Add your custom CSS here */
body {
    background-color: #f8f9fa;
    font-family: Arial, sans-serif; /* Change font family for better readability */
}

.login-container {
    margin-top: 100px;
}

.login-form {
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    height: 50px;
    font-size: 16px;
    border-radius: 5px; /* Add rounded corners to form inputs */
}

.btn-login {
    width: 100%;
    height: 50px;
    font-size: 16px;
    border-radius: 5px; /* Add rounded corners to buttons */
}

.btn-login:hover {
    background-color: #007bff; /* Change background color on hover */
}

.login-form h2 {
    margin-top: 0; /* Remove default margin from heading */
    margin-bottom: 20px; /* Add space below heading */
    text-align: center; /* Center align the heading */
}

.login-form a {
    display: block; /* Make link a block element for better spacing */
    text-align: center; /* Center align the link */
    color: #007bff; /* Change link color */
}

.login-form a:hover {
    text-decoration: none; /* Remove underline on hover */
    color: #0056b3; /* Change link color on hover */
}

    </style>
</head>
<body>
    <form id="loginForm" runat="server" class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="login-form">
                    <h2 class="text-center mb-4">Delivery Boy Login</h2>
                    <div class="form-group">
                        <input type="email" id="txtEmail" runat="server" class="form-control" placeholder="Email" required />
                    </div>
                    <div class="form-group">
                        <input type="password" id="txtPassword" runat="server" class="form-control" placeholder="Password" required />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-login" OnClick="btnLogin_Click" />
                    </div>
                    <a href="login.aspx">   <u> Go to User Login</u> </a><br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>