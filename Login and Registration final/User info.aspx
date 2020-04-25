<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User info.aspx.cs" Inherits="Login_and_Registration_final.User_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>מידע משתמש</h1>

    שם משתמש: <%= username %> <br /> 
    שם פרטי: <%= firstName %><br />
    שם משפחה: <%= lastName %><br />
    ססמה: <%= password %><br />
    תאריך לידה: <%= birthdate %><br />
    אימייל: <%= email %><br />
    טלפון: <%= phone %><br />
    מין: <%= gender %><br />
    כתובת: <%= address %><br />
</asp:Content>
