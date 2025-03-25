<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="JayBhavaniLocho.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>
</head>
<body>
    <div class="col-md-4">
    <div class="card mb-4 box-shadow">
        <img class="card-img-top" src='<%# Eval("image") %>' alt='<%# Eval("snackName") %>'>
        <div class="card-body">
            <h5 class="card-title"><%# Eval("snackName") %></h5>
            <p class="card-text"><%# Eval("description") %></p>
        </div>
    </div>
</div>
</body>
</html>

