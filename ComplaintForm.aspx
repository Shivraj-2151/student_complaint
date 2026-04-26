<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplaintForm.aspx.cs" Inherits="ComplaintManagementSystem.ComplaintForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Complaint</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 420px;
            background: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            animation: fadeIn 0.5s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: 600;
        }

        .input-box {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 5px rgba(102,126,234,0.3);
        }

        textarea {
            resize: none;
            height: 90px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .msg {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Raise a Complaint</h2>

            <div class="input-box">
                <label>Complaint Title</label>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </div>

            <div class="input-box">
                <label>Description</label>
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="input-box">
                <label>Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Text="-- Select Category --" Value="" />
                    <asp:ListItem Text="Technical Issue" Value="Technical" />
                    <asp:ListItem Text="Facility Issue" Value="Facility" />
                </asp:DropDownList>
            </div>
            <div class="input-box">
    <label>Upload Proof (Image)</label>
    <asp:FileUpload ID="fileProof" runat="server" />
</div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Complaint"
                CssClass="btn" OnClick="btnSubmit_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
        </div>
    </form>
</body>
</html>