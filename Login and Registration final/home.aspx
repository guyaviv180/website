<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Login_and_Registration_final.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <p>שלום <%= firstName %> <%= lastName %></p>
    <h1>בית</h1>

    <button onclick="window.location.href='/Connect four.aspx'" class="connectFour">ארבע בשורה</button>
    <button onclick="window.location.href='/jumping-cube.aspx'" class="jumpingCube">קוביה מקפצת</button>
    <button onclick="window.location.href='/pong.aspx'" class="pong">פונג</button><br /> <br />
</asp:Content>
