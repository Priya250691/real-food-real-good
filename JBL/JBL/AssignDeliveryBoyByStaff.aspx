<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignDeliveryBoyByStaff.aspx.cs" Inherits="JBL.AssignDeliveryBoyByStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign Delviery Boy</title>
    <style>
        button {
            margin-left: 1350px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

            /* Hover effect for the "Back" button */
            button:hover {
                background-color: #0056b3;
            }
    </style>
</head>
   
<body>
    <form id="form1" runat="server">
         <button type="button" onclick="goBack()" class="back-button">Back</button><br />
           
        
        <asp:GridView ID="gvDeliveryBoys" runat="server" AutoGenerateColumns="false" OnRowCommand="gvDeliveryBoys_RowCommand">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:TemplateField HeaderText="Assign">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkAssign" runat="server" CommandName="Assign" CommandArgument='<%# Eval("ID") %>' Text="Assign" />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    </form>
    <script>
        function goBack() {
            window.location.href = "StaffDashboard.aspx";
        }
    </script>

    <style>
        #form1 {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }
    </style>
</body>
</html>
