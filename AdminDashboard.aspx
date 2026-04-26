<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ComplaintManagementSystem.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: 'Segoe UI';
            background: #eef2f7;
            margin: 0;
        }

        .header {
            background: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
        }

        .container {
            width: 95%;
            margin: auto;
            margin-top: 20px;
        }

        /* DASHBOARD CARDS */
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 25px;
        }

        .card {
            flex: 1;
            min-width: 180px;
            padding: 20px;
            border-radius: 10px;
            color: white;
            font-size: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin: 0;
            font-size: 30px;
        }

        .blue { background: #3498db; }
        .green { background: #2ecc71; }
        .orange { background: #f39c12; }
        .red { background: #e74c3c; }
        .purple { background: #9b59b6; }
        .dark { background: #34495e; }

        /* GRID */
        .grid {
            background: white;
            padding: 15px;
            border-radius: 10px;
        }

        .btn {
            padding: 5px 10px;
            background: green;
            color: white;
            border: none;
            border-radius: 5px;
        }

        .delete {
            background: red;
        }

        table {
            width: 100%;
        }
    </style>
</head>

<body>

<div class="header">
    Admin Dashboard
</div>

<form id="form1" runat="server">
<div class="container">

    <!-- 🔥 CARDS -->
    <div class="cards">

        <div class="card blue">
            Total Users
            <h3><asp:Label ID="lblUsers" runat="server" /></h3>
        </div>

        <div class="card green">
            Students
            <h3><asp:Label ID="lblStudents" runat="server" /></h3>
        </div>

        <div class="card purple">
            HODs
            <h3><asp:Label ID="lblHOD" runat="server" /></h3>
        </div>

        <div class="card orange">
            Total Complaints
            <h3><asp:Label ID="lblTotalComplaints" runat="server" /></h3>
        </div>

        <div class="card red">
            Pending
            <h3><asp:Label ID="lblPending" runat="server" /></h3>
        </div>

        <div class="card dark">
            Resolved
            <h3><asp:Label ID="lblResolved" runat="server" /></h3>
        </div>

    </div>

    <!-- GRID -->
    <div class="grid">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataKeyNames="ComplaintID"
            OnRowCommand="GridView1_RowCommand">

            <Columns>
                <asp:BoundField DataField="ComplaintID" HeaderText="ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Date" HeaderText="Date" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Resolve"
                            CssClass="btn"
                            CommandName="Resolve"
                            CommandArgument="<%# Container.DataItemIndex %>" />

                        <asp:Button runat="server" Text="Delete"
                            CssClass="btn delete"
                            CommandName="DeleteRow"
                            CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

    </div>

</div>
</form>

</body>
</html>