<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit user details.aspx.cs" Inherits="Login_and_Registration_final.edit_user_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>שנה פרטי משתמש</h1>

    <form  method="post" action="Edit user details.aspx">


        <table>

            <tr>
                <td>
                    שם פרטי
                </td>
                <td>
                    <input type="text" id="firstName" name="firstName" value="<%= firstName %>"/>
                </td>
                <td style="color:red" id="firstNameErr"></td>
            </tr>

            <tr>
                <td>
                    שם משפחה
                </td>
                <td>
                    <input type="text"  id="lastName" name="lastName" value="<%= lastName %>"/>
                </td>
                <td style="color:red" id="lastNameErr"></td>
            </tr>

            <tr>
                <td>
                    שם משתמש
                </td>
                <td>
                    <input type="text" id="username" name="username" disabled="disabled" value="<%= username %>"/>
                </td>
                <td style="color:red" id="usernameErr"></td>
            </tr>

            <tr>
                <td>
                    ססמה
                </td>
                <td>
                    <input type="password" id="password" name="password" value="<%= password %>"/>
                </td>
                <td style="color:red" id="passwordErr"></td>
            </tr>
            <tr>
                <td>
                    תאריך לידה
                </td>
                <td>
                    <input type="date" id="birthdate" name="birthdate" value="<%= birthdate %>"/>
                </td>
                <td style="color:red" id="bdErr"></td>
            </tr>
             <tr>
                <td>
                    אימייל
                </td>
                <td>
                    <input type="text" name="email" id="email" value="<%= email %>"/>
                </td>
                <td style="color:red" id="emailErr"></td>
            </tr>

             <tr>
                <td>
                    טלפון
                </td>
                <td>
                    <input type="number"  id="phone" name="phone" value="<%= phone %>"/>
                </td>
                <td style="color:red" id="phoneErr"></td>
            </tr>

            <tr>
                <td>
                    מין (הכנס male או female)
                </td>
                <td>
                    <input type="text" name="gender" id="gender"value="<%= gender %>"/> 
                </td>
                <td style="color:red" id="genderErr"></td>
            </tr>

            <tr>
                <td>
                    כתובת (הכנס רחוב/מספר בית/עיר)
                </td>
                <td>
                    <input type="text" name="address" id="address" value="<%= address %>"/>
                </td>
                <td style="color:red" id="addressErr"></td>
            </tr>

        </table>

        <br />

        <input type="submit" id="submit" name="submit" class="main" onclick="return check()" value="שנה פרטים" /> 
    </form>
    <button style="margin-right:5px" onclick="window.location.href='/Delete user.aspx'" class="main">מחק משתמש</button>

    <script>
        function checkFirstName() {

            var firstName = document.getElementById("firstName").value;
            if (firstName.length == 0) {
                document.getElementById("firstNameErr").innerHTML = "טעות בשם";
                return false;
            }
            for (var i = 0; i < firstName.length; i++) {
                if (!(firstName[i] >= 'א' && firstName[i] <= 'ת' || firstName[i] == ' ')) {
                    document.getElementById("firstNameErr").innerHTML = "טעות בשם";
                    return false;
                }
            }
            document.getElementById("firstNameErr").innerHTML = "";
            return true;
        }

        function checkLastName() {
            var lastName = document.getElementById("lastName").value;
            if (lastName.length == 0) {
                document.getElementById("lastNameErr").innerHTML = "טעות בשם";
                return false;
            }
            for (var i = 0; i < lastName.length; i++) {
                if (!(lastName[i] >= 'א' && lastName[i] <= 'ת' || lastName[i] == ' ')) {
                    document.getElementById("lastNameErr").innerHTML = "טעות בשם";
                    return false;
                }
            }
            document.getElementById("lastNameErr").innerHTML = "";
            return true;
        }
        function checkPassword() {
            var password = document.getElementById("password").value
            if (password.length > 10 || password.length < 6) {

                document.getElementById("passwordErr").innerHTML = "טעות בססמה"
                return false
            }
            for (var i = 0; i < password.length; i++) {
                if (!((password[i] >= 0 && password[i] <= 9) || password[i] >= 'a' && password[i] <= 'z' || password[i] >= 'A' && password[i] <= 'Z' || password[i] == '_')) {
                    document.getElementById("passwordErr").innerHTML = "טעות בססמה";
                    return false;
                }
            }
            document.getElementById("passwordErr").innerHTML = "";
            return true;
        }

        function checkBirthdate() {
            var bd = document.getElementById("birthdate").value;
            var bDate = new Date(bd);
            var year = bDate.getFullYear();
            if (!bd) {
                document.getElementById("bdErr").innerHTML = "יש לבחור תאריך";
                return false;
            }
            if (year < 1960) {
                document.getElementById("bdErr").innerHTML = "יש לבחור שנה החל מ 1960";
                return false;
            }
            else {
                document.getElementById("bdErr").innerHTML = "";
                var current = new Date();
                return true;
            }
        }

        function checkEmail() {
            var email = document.getElementById("email").value;
            var ending = "@gmail.com";
            var emailcheck = email.substring((email.length - 10), email.length)

            if ((email.length - 10) < 6 || (email.length - 10) > 30) {
                document.getElementById("emailErr").innerHTML = "טעות באימייל";
                return false;
            }
            for (var i = 0; i < (email.length - 10); i++) {
                if (!((email[i] >= 0 && email[i] <= 9) || email[i] >= 'a' && email[i] <= 'z' || email[i] >= 'A' && email[i] <= 'Z' || email[i] == '.')) {
                    document.getElementById("emailErr").innerHTML = "טעות באימייל";
                    return false;
                }
            }
            if (ending != emailcheck) {
                document.getElementById("emailErr").innerHTML = "טעות באימייל";
                return false;
            }
            document.getElementById("emailErr").innerHTML = "";
            return true;
        }

        function checkPhone() {
            var phone = document.getElementById("phone").value;
            if (phone.length == 0) {
                document.getElementById("phoneErr").innerHTML = "יש להכניס טלפון";
                return false;
            }
            if (phone.length != 10) {
                document.getElementById("phoneErr").innerHTML = "טעות בטלפון";
                return false;
            }
            document.getElementById("phoneErr").innerHTML = "";
            return true;
        }

        function checkGender() {
            var gender = document.getElementById("gender").value;
            if (!(gender == "male" || gender == "female")) {
                document.getElementById("genderErr").innerHTML = "טעות במין";
                return false;
            }
            document.getElementById("genderErr").innerHTML = "";
            return true;

        }

        function check() {
            var a = checkFirstName();
            var b = checkLastName();
            var c = checkPassword();
            var d = checkBirthdate();
            var e = checkEmail();
            var f = checkPhone();
            var g = checkGender();

            return a && b && c && d && e && f && g;
        }
    </script>
</asp:Content>
