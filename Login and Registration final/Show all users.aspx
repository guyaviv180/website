<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Show all users.aspx.cs" Inherits="Login_and_Registration_final.Show_all_users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        table{
            border:1px solid whitesmoke;
            border-spacing:15px;
            background-color: whitesmoke;
            border-radius: 20px;
        }
        td{
            text-align:center;
            margin:10px;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form name="filterForm" action="/Show all users.aspx" method="post">
        <table id="filter">
        <tr>
            <td>סנן לפי ערך ראשון</td>
            <td>
        <select name="firstFilter">
        <option value="firstName">שם פרטי</option>
        <option value="lastName">שם משפחה</option>
        <option value="username">שם משתמש</option>
        <option value="password">ססמה</option>
        <option value="birthdate">תאריך לידה</option>
        <option value="email">אימייל</option>
        <option value="phone">מספר טלפון</option>
        <option value="address">כתובת</option>
    </select>
            </td>
            <td>
                <input type="text" name="firstValue" id="firstValue" />
            </td>
        </tr>
        <tr>
            <td>סנן לפי ערך שני</td>
            <td>
        <select name="secondFilter">
        <option value="firstName">שם פרטי</option>
        <option value="lastName">שם משפחה</option>
        <option value="username">שם משתמש</option>
        <option value="password">ססמה</option>
        <option value="birthdate">תאריך לידה</option>
        <option value="email">אימייל</option>
        <option value="phone">מספר טלפון</option>
        <option value="address">כתובת</option>
    </select>
            </td>
            <td>
                <input type="text" name="secondValue" id="secondValue" />
            </td>
        </tr>
    </table>

        <input type="submit" name="filter" value="סנן משתמשים" />

    </form>

    <br />

    <%= Table %>

</asp:Content>
