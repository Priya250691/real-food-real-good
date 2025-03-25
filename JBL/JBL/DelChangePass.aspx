<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelChangePass.aspx.cs" Inherits="JBL.DelChangePass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 400px;
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Change Password</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            <div class="form-group">
                <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Current Password" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="New Password" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm New Password" required></asp:TextBox>
            </div>
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn-submit" OnClick="btnChangePassword_Click" />
        </div>
    </form>
</body>
</html>