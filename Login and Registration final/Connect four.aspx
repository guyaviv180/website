<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Connect four.aspx.cs" Inherits="Login_and_Registration_final.Connect_four" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="connect%20four%20StyleSheet.css" rel="stylesheet" />
    <script src="Connect four.js"></script>
    <table>
        <tr>
            <td><button type="button" onclick="return play('0')" class="empty" id="0"></button></td>
            <td><button type="button" onclick="return play('1')" class="empty" id="1"></button></td>
            <td><button type="button" onclick="return play('2')" class="empty" id="2"></button></td>
            <td><button type="button" onclick="return play('3')" class="empty" id="3"></button></td>
            <td><button type="button" onclick="return play('4')" class="empty" id="4"></button></td>
            <td><button type="button" onclick="return play('5')" class="empty" id="5"></button></td>
            <td><button type="button" onclick="return play('6')" class="empty" id="6"></button></td>
        </tr>
        <tr>
            <td><button type="button" onclick="return play('7')" class="empty" id="7"></button></td>
            <td><button type="button" onclick="return play('8')" class="empty" id="8"></button></td>
            <td><button type="button" onclick="return play('9')" class="empty" id="9"></button></td>
            <td><button type="button" onclick="return play('10')" class="empty" id="10"></button></td>
            <td><button type="button" onclick="return play('11')" class="empty" id="11"></button></td>
            <td><button type="button" onclick="return play('12')" class="empty" id="12"></button></td>
            <td><button type="button" onclick="return play('13')" class="empty" id="13"></button></td>
        </tr>
        <tr>
            <td><button type="button" onclick="return play('14')" class="empty" id="14"></button></td>
            <td><button type="button" onclick="return play('15')" class="empty" id="15"></button></td>
            <td><button type="button" onclick="return play('16')" class="empty" id="16"></button></td>
            <td><button type="button" onclick="return play('17')" class="empty" id="17"></button></td>
            <td><button type="button" onclick="return play('18')" class="empty" id="18"></button></td>
            <td><button type="button" onclick="return play('19')" class="empty" id="19"></button></td>
            <td><button type="button" onclick="return play('20')" class="empty" id="20"></button></td>
        </tr>
        <tr>
            <td><button type="button" onclick="return play('21')" class="empty" id="21"></button></td>
            <td><button type="button" onclick="return play('22')" class="empty" id="22"></button></td>
            <td><button type="button" onclick="return play('23')" class="empty" id="23"></button></td>
            <td><button type="button" onclick="return play('24')" class="empty" id="24"></button></td>
            <td><button type="button" onclick="return play('25')" class="empty" id="25"></button></td>
            <td><button type="button" onclick="return play('26')" class="empty" id="26"></button></td>
            <td><button type="button" onclick="return play('27')" class="empty" id="27"></button></td>
        </tr>
        <tr>
            <td><button type="button" onclick="return play('28')" class="empty" id="28"></button></td>
            <td><button type="button" onclick="return play('29')" class="empty" id="29"></button></td>
            <td><button type="button" onclick="return play('30')" class="empty" id="30"></button></td>
            <td><button type="button" onclick="return play('31')" class="empty" id="31"></button></td>
            <td><button type="button" onclick="return play('32')" class="empty" id="32"></button></td>
            <td><button type="button" onclick="return play('33')" class="empty" id="33"></button></td>
            <td><button type="button" onclick="return play('34')" class="empty" id="34"></button></td>
        </tr>
        <tr>
            <td><button type="button" onclick="return play('35')" class="empty" id="35"></button></td>
            <td><button type="button" onclick="return play('36')" class="empty" id="36"></button></td>
            <td><button type="button" onclick="return play('37')" class="empty" id="37"></button></td>
            <td><button type="button" onclick="return play('38')" class="empty" id="38"></button></td>
            <td><button type="button" onclick="return play('39')" class="empty" id="39"></button></td>
            <td><button type="button" onclick="return play('40')" class="empty" id="40"></button></td>
            <td><button type="button" onclick="return play('41')" class="empty" id="41"></button></td>
        </tr>
    </table>
</asp:Content>
