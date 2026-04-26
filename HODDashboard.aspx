<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HODDashboard.aspx.cs" Inherits="ComplaintManagementSystem.HODDashboard" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HOD Dashboard</title>

    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
    }

    .container {
        width: 90%;
        margin: 40px auto;
        background: #ffffff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    h2 {
        margin: 0;
        color: #333;
    }

    .logout {
        text-decoration: none;
        background: #ff4b5c;
        color: white;
        padding: 8px 15px;
        border-radius: 6px;
        transition: 0.3s;
    }

    .logout:hover {
        background: #e84118;
    }

    /* GridView Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        overflow: hidden;
        border-radius: 10px;
    }

    th {
        background: #667eea;
        color: white;
        padding: 12px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {
        background: #f5f7ff;
    }

    /* Buttons */
    .btn {
        padding: 6px 12px;
        background: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn:hover {
        background: #218838;
    }

    /* Image styling */
    img {
        transition: transform 0.3s;
    }

    img:hover {
        transform: scale(1.5);
    }

    /* View link */
    a {
        color: #007bff;
        text-decoration: none;
        font-weight: 500;
    }

    a:hover {
        text-decoration: underline;
    }

</style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <div class="top-bar">
            <h2>All Complaints</h2>
            <a href="Login.aspx" class="logout">Logout</a>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataKeyNames="ComplaintID"
    OnRowCommand="GridView1_RowCommand"
    CellPadding="10" BorderWidth="1" Width="100%">

    <Columns>

        <asp:BoundField DataField="ComplaintID" HeaderText="ID" />

        <asp:BoundField DataField="Title" HeaderText="Title" />

        <asp:BoundField DataField="Description" HeaderText="Description" />

        <asp:BoundField DataField="Category" HeaderText="Category" />

        <asp:BoundField DataField="Status" HeaderText="Status" />

        <asp:BoundField DataField="Date" HeaderText="Date" 
            DataFormatString="{0:dd-MM-yyyy}" />

       <%-- IMAGE COLUMN --%>
        <asp:TemplateField HeaderText="Proof">
            <ItemTemplate>
                <asp:Image ID="imgProof" runat="server"
                    ImageUrl='<%# Eval("ImagePath") %>'
                    Width="80px" Height="80px"
                    Style="border-radius:5px; border:1px solid #ccc;"
                    Visible='<%# Eval("ImagePath") != DBNull.Value && Eval("ImagePath").ToString() != "" %>' />
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:TemplateField HeaderText="View">
            <ItemTemplate>
                <asp:HyperLink ID="lnkView" runat="server"
                    NavigateUrl='<%# Eval("ImagePath") %>'
                    Target="_blank"
                    Text="View"
                    Visible='<%# Eval("ImagePath") != DBNull.Value && Eval("ImagePath").ToString() != "" %>' />
            </ItemTemplate>
        </asp:TemplateField>

    
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="btnResolve" runat="server"
                    Text="Resolve"
                    CommandName="Resolve"
                    CommandArgument='<%# Container.DataItemIndex %>'
                    CssClass="btn" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>

    </div>

</form>
</body>
</html>