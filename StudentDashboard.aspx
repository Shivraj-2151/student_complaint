<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="ComplaintManagementSystem.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial;
            background: linear-gradient(to right, #43cea2, #185a9d);
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .btn {
            padding: 8px 15px;
            background: #185a9d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background: #43cea2;
        }

        .grid {
            width: 100%;
        }

        .empty {
            text-align: center;
            color: red;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <div class="top-bar">
                <h2>My Complaints</h2>
                <div>
                    <a href="ComplaintForm.aspx" class="btn">+ Add Complaint</a>
                    <a href="Login.aspx" class="btn">Logout</a>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" CssClass="grid" AutoGenerateColumns="False" BorderWidth="1" CellPadding="8">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblEmpty" runat="server" CssClass="empty"></asp:Label>

        </div>
    </form>
</body>
</html>