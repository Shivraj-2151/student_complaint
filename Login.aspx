<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ComplaintManagementSystem.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | Complaint System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .login-card {
            width: 400px;
            padding: 40px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            color: #fff;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            color: #555;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 12px 12px 12px 38px;
            border-radius: 10px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        .input-group input:focus,
        .input-group select:focus {
            box-shadow: 0 0 6px #fff;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #fff;
            color: #333;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #f1f1f1;
            transform: scale(1.04);
        }

        .divider {
            margin: 20px 0;
            text-align: center;
            font-size: 13px;
            opacity: 0.7;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .error {
            margin-top: 10px;
            color: #ff4d4d;
            text-align: center;
            font-size: 14px;
        }

        .footer-text {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            opacity: 0.7;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <h2>Welcome Back 👋</h2>

            <div class="input-group">
                <i class="fa fa-envelope"></i>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>

            <div class="input-group">
                <i class="fa fa-user"></i>
                <asp:DropDownList ID="ddlRole" runat="server">
    <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
    <asp:ListItem Text="HOD" Value="HOD"></asp:ListItem>
    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
</asp:DropDownList>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

            <div class="divider">OR</div>

            <div class="register-link">
                <asp:LinkButton ID="lnkRegister" runat="server" OnClick="lnkRegister_Click">
                    Don't have an account? Register
                </asp:LinkButton>
            </div>
            

            <asp:Label ID="lblMsg" runat="server" CssClass="error"></asp:Label>

            <div class="footer-text">
                © 2026 Complaint Management System
            </div>
        </div>
    </form>
</body>
</html>