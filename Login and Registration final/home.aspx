<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Login_and_Registration_final.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <h1>בית</h1>
    <button onclick="window.location.href='/Registration.aspx'" class="example">הירשמות</button> <br /> <br />
    <button onclick="window.location.href='/Login.aspx'" class="example">התחברות</button> <br /> <br />
    <button onclick="window.location.href='/User info.aspx'" class="example">מידע משתמש</button>
</asp:Content>
