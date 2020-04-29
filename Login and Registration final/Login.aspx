<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login_and_Registration_final.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>התחברות</h1>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="javascript.js"></script>

     <form method="post" action ="Login.aspx">
        <table>
            <tr>
                <td>
                    שם משתמש
                </td>
                <td>
                    <input type="text" name="username" id="username" />
                </td>
                <td style="color:red" id="usernameErr"></td>
            </tr>

            <tr>
                <td>
                    ססמה
                </td>
                <td>
                    <input type="password" name="password" id="password" />
                </td>
                <td style="color:red" id="passwordErr"></td>
            </tr>
        </table>

         <br />

        <input type="submit" name="submit" id="submitLogin" class="main" value="התחבר" onclick="return Logincheck()"/>
    </form>

</asp:Content>
