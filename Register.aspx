<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ComplaintManagementSystem.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register | Complaint System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .register-card {
            width: 500px;
            padding: 40px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            color: #fff;
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .register-card h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .input-group {
            position: relative;
        }

        .input-group.full {
            grid-column: span 2;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 12px 12px 12px 38px;
            border-radius: 10px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        .input-group input:focus {
            box-shadow: 0 0 6px #fff;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #555;
        }

        .btn-register {
            width: 100%;
            padding: 13px;
            background: #fff;
            color: #333;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 15px;
        }

        .btn-register:hover {
            background: #f1f1f1;
            transform: scale(1.04);
        }

        .msg {
            margin-top: 12px;
            color: #ff4d4d;
            text-align: center;
            font-size: 14px;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>

    <script>
        function togglePassword() {
            var pwd = document.getElementById("<%= txtPassword.ClientID %>");
            var icon = document.getElementById("eyeIcon");

            if (pwd.type === "password") {
                pwd.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                pwd.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="register-card">
            <h2>Create Account 🚀</h2>

            <div class="form-grid">

                <div class="input-group full">
                    <i class="fa fa-user"></i>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>
                </div>

                <div class="input-group full">
                    <i class="fa fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                </div>

                <div class="input-group full">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <i id="eyeIcon" class="fa fa-eye toggle-password" onclick="togglePassword()"></i>
                </div>

                <div class="input-group">
                    <i class="fa fa-building"></i>
                    <asp:TextBox ID="txtDept" runat="server" placeholder="Department"></asp:TextBox>
                </div>

                <div class="input-group">
                    <i class="fa fa-id-card"></i>
                    <asp:TextBox ID="txtRoll" runat="server" placeholder="Roll No"></asp:TextBox>
                </div>

            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-register" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

            <div class="login-link">
                <asp:LinkButton ID="lnkLogin" runat="server" OnClick="lnkLogin_Click">
                    Already have an account? Login
                </asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>