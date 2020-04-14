<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Error page.aspx.cs" Inherits="Login_and_Registration_final.Error_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <script type="text/javascript">
        localErr = "<%= Session["CsErr"]%>"
        document.write("<p style='color: red;' id='errData'>" + localErr + "</p>");
    </script>
</asp:Content>
