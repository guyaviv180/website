<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User info.aspx.cs" Inherits="Login_and_Registration_final.User_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        td{
            font-family:Calibri;
        }
        p{
            font-family:'Calibri';
        }
        h1{
            font-family:'Calibri';
        }
    </style>
    <h1>פרטי משתמש</h1>

    <table>
        <tr>
            <td>שם משתמש</td>
            <td><%= username %></td>
        </tr>
        <tr>
            <td>שם פרטי</td>
            <td><%= firstName %></td>
        </tr>
        <tr>
            <td>שם משפחה</td>
            <td><%= lastName %></td>
        </tr>
        <tr>
            <td>ססמה</td>
            <td><%= password %></td>
        </tr>
        <tr>
            <td>תאריך לידה</td>
            <td><%= birthdate %></td>
        </tr>
        <tr>
            <td>אימייל</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td>טלפון</td>
            <td><%= phone %></td>
        </tr>
        <tr>
            <td>מין</td>
            <td><%= gender %></td>
        </tr>
        <tr>
            <td>כתובת</td>
            <td><%= address %></td>
        </tr>

    </table>

    <p>כדי לצאת מעמוד זה לחץ על כפתור הבית</p>

</asp:Content>
