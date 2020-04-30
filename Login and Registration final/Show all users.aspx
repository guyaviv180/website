<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Show all users.aspx.cs" Inherits="Login_and_Registration_final.Show_all_users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="StyleSheet1.css" rel="stylesheet" />

    <style>

        table{
            border:1px solid whitesmoke;
            border-spacing:15px;
            background-color: whitesmoke;
            border-radius: 20px;
            font-family:Calibri
        }
        td{
            text-align:center;
            margin:10px;
            font-family:Calibri
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
        <option value="gender">מין</option>
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
        <option value="gender">מין</option>
        <option value="address">כתובת</option>
    </select>
            </td>
            <td>
                <input type="text" name="secondValue" id="secondValue" />
            </td>
        </tr>
    </table>

        <input style="margin-bottom:5px; margin-top:5px; margin-left:2.5px" class="main" type="submit" name="filter" value="סנן משתמשים" />
        <input style="margin-bottom:5px; margin-top:5px; margin-right:2.5px" class="main" type="submit" name="delete" value="מחק משתמשים" onclick="Navigate()" >


        <div runat="server">
                <%=Table %>
        </div>
        <p>
        <input type="text" id="deleteLine" name="deleteLine" size="20" style="visibility: hidden" />
        </p>

    </form>

    <br />

    <script>
        function Navigate() {

            var length = document.getElementById("table").rows.length;
            var chkStr = "chk";
            var temp = "";
            var flag = true;
            var users = [];
            var counter = 0;

            for (var i = 1; i < length; i++) {
                temp = chkStr + i;
                flag = document.getElementById(temp).checked;
                if (flag) {
                    users[counter] = document.getElementById("user" + i).innerHTML;
                    counter++;
                }
            }
            sqlStr = "DELETE FROM Users WHERE (";
            for (var i = 0; i < counter; i++) {
                sqlStr += "username=N'" + users[i] + "'";
                if (i < counter - 1) {
                    sqlStr += " OR ";
                }
            }
            sqlStr += ")"

            document.getElementById("deleteLine").value = sqlStr;
            return true;
        }
    </script>
</asp:Content>
