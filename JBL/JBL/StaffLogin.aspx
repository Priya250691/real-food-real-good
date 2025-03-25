<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="JBL.StaffLogin" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Login</title>
    <style>
       /* Responsive CSS */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    padding: 20px;
}

.container {
    max-width: 400px;
    margin: auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="password"],
input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
     background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #75a8de;
}


 a {
    display: block; /* Make link a block element for better spacing */
    text-align: center; /* Center align the link */
    color: #007bff; /* Change link color */
}

 a:hover {
    text-decoration: none; /* Remove underline on hover */
    color: #0056b3; /* Change link color on hover */
}

    </style>
</head>
<body>
    <div class="container">
        <h2>Staff Login</h2>
        <form id="formLogin" runat="server" onsubmit="return validateForm()">
            <input type="text" id="txtUsername" placeholder="Username" runat="server" required />
            <input type="password" id="txtPassword" placeholder="Password" runat="server" required />
            <input type="submit" value="Login" runat="server" onserverclick="btnLogin_Click" />
            <a href="login.aspx">   <u> Go to User Login</u> </a><br />
        </form>
    </div>

    <script>
        function validateForm() {
            // Client-side validation logic if needed
            return true;
        }
    </script>
</body>
</html>
</html>
