<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="DatabaseConnectivity.RegistrationPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .form-container {
           
            margin: auto;
            border: 2px solid #333;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container div {
            margin-bottom: 12px;
        }
        .form-container label {
            display: block;
            font-weight: bold;
        }
        .form-container input[type="text"], 
        .form-container input[type="email"], 
        .form-container input[type="password"] {
            width: 100%;
            padding: 6px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"] {
            width: 90px;
            margin: 5px;
            padding: 6px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .buttons {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container" id="Label">
            <h2>Registration Form</h2>

            <div>
                <label for="txtFirstName">First Name:</label>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ControlToValidate="txtFirstName" ErrorMessage="First Name is required!" ForeColor="Red" />
            </div>

            <div>
                <label for="txtLastName">Last Name:</label>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </div>

            <div>
                <label for="txtPhone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                    ControlToValidate="txtPhone"
                    ValidationExpression="^\d{10}$"
                    ErrorMessage="Enter a valid 10-digit number!"
                    ForeColor="Red" />
            </div>

            <div>
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Invalid Email Address!" ForeColor="Red" />
            </div>

            <div>
                <label for="txtAge">Age:</label>
                
                <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" ErrorMessage="Enter valid Age" ForeColor="Red" MaximumValue="90" MinimumValue="18" Type="Integer"></asp:RangeValidator>
            </div>

            <div>
                <label for="txtUserID">User ID:</label>
                <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            </div>

            <div>
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div>
                <label for="txtConfirmPassword">Confirm Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="cvPassword" runat="server" 
                    ControlToCompare="txtPassword" 
                    ControlToValidate="txtConfirmPassword"
                    ErrorMessage="Passwords do not match!" 
                    ForeColor="Red" />
            </div>

            
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click"  class="buttons"/>   

                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  class="buttons"/>

                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"  class="buttons"/>

                <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click"  class="buttons"/>
            
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
            
            
        </div>
    </form>
</body>
</html>
