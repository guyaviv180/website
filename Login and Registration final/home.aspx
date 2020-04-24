<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Login_and_Registration_final.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <p>שלום <%= firstName %> <%= lastName %></p>
    <h1>בית</h1>
    <button onclick="window.location.href='/Registration.aspx'" class="main">הירשמות</button> <br /> <br />
    <button onclick="window.location.href='/Login.aspx'" class="main">התחברות</button> <br /> <br />
    <button onclick="window.location.href='/User info.aspx'" class="main">מידע משתמש</button><br /> <br />
    <button onclick="window.location.href='/Edit user details.aspx'" class="main">מידע משתמש</button><br /> <br />
    <form action="/home.aspx" method="post" name="logout">
        <input class="main" type="submit" name="Logout" value="התנתק" />
    </form>
    
    
</asp:Content>
