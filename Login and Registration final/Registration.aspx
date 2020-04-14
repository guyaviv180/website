<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Login_and_Registration_final.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>הירשמות</h1>


    <script src="javascript.js"></script>

    <form method="post" action ="Registration.aspx">
        <table>

            <tr>
                <td>
                    שם פרטי
                </td>
                <td>
                    <input type="text" id="firstName" name="firstName"/>
                </td>
                <td style="color:red" id="firstNameErr"></td>

            </tr>

            <tr>
                <td>
                    שם משפחה
                </td>
                <td>
                    <input type="text"  id="lastName" name="lastName"/>
                </td>
                <td style="color:red" id="lastNameErr"></td>
            </tr>

            <tr>
                <td>
                    שם משתמש
                </td>
                <td>
                    <input type="text" id="username" name="username"/>
                </td>
                <td style="color:red" id="usernameErr"></td>
            </tr>

            <tr>
                <td>
                    ססמה
                </td>
                <td>
                    <input type="password" id="password" name="password"/>
                </td>
                <td style="color:red" id="passwordErr"></td>
            </tr>
            <tr>
                <td>
                    תאריך לידה
                </td>
                <td>
                    <input type="date" id="birthdate" name="birthdate" />
                </td>
                <td style="color:red" id="bdErr"></td>
            </tr>
            <tr>
                <td>
                    גיל
                </td>
                <td>
                    <input type="number" id="age" disabled="disabled" />
                </td>
                <td style="color:red" id="ageErr"></td>
            </tr>
             <tr>
                <td>
                    אימייל
                </td>
                <td>
                    <input type="text" name="email" id="email" />
                </td>
                <td style="color:red" id="emailErr"></td>
            </tr>

             <tr>
                <td>
                    טלפון
                </td>
                <td>
                    <input type="number"  id="phone" name="phone" />
                </td>
                <td style="color:red" id="phoneErr"></td>
            </tr>

            <tr>
                <td>
                    מין (הכנס male או female)
                </td>
                <td>
                    <input type="text" name="gender" id="gender"/> 
                </td>
                <td style="color:red" id="genderErr"></td>
            </tr>

            <tr>
                <td>
                    כתובת (הכנס רחוב/מספר בית/עיר)
                </td>
                <td>
                    <input type="text" name="street" id="street" size="6"/>
                    <input type="text" name="houseNumber" id="houseNumber" size="1"/>
                    <input type="text" name="city" id="city" size="8"/>
                </td>
                <td style="color:red" id="addressErr"></td>
            </tr>

        </table>

        <input type="submit" id="submit" name="submit" value="הירשם" onclick="return check()" />

    </form>
</asp:Content>
