<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="DatabaseConnectivity.LoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style type="text/css">
         body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }
       .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #c0c0c0;
            border-radius: 80px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
       .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
         .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
           font-weight: bold;
            margin-bottom: 5px;
        }
       .input-group input {
            width: 100%;
            height: 35px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
         .btn-login {
            width: 100%;
            height: 40px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-login:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login Page</h2>

            <div class="input-group">
                <label for="TextBox1">Userid</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter the userid " ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>

            <div class="input-group">
                <label for="TextBox2">Password</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password must be entered" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server" CssClass="btn-login" Text="Login" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
