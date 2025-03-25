<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="JayBhavaniLocho.Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                     <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                     <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                     <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                     <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                     <asp:BoundField DataField="CIty" HeaderText="CIty" SortExpression="CIty" />
                     <asp:BoundField DataField="Pincode" HeaderText="Pincode" SortExpression="Pincode" />
                     <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                     <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                     <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
