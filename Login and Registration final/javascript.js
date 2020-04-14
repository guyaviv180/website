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

function checkUsername() {
    var username = document.getElementById("username").value;
    if (username.length == 0) {
        document.getElementById("usernameErr").innerHTML = "טעות בשם משתמש";
        return false;
    }
    for (var i = 0; i < username.length; i++) {
        if (!(username[i] >= 1 || username[i] <= 9 || username[i] >= 'a' && username[i] <= 'z' || username[i] >= 'A' && username[i] <= 'Z' || username[i] == '_')) {
            document.getElementById("usernameErr").innerHTML = "טעות בשם משתמש";
            return false;
        }
    }
    document.getElementById("usernameErr").innerHTML = "";
    return true
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
        document.getElementById("ageErr").innerHTML = "שגיאה";
        return false;
    }
    if (year < 1960) {
        document.getElementById("bdErr").innerHTML = "יש לבחור שנה החל מ 1960";
        document.getElementById("ageErr").innerHTML = "שגיאה";
        return false;
    }
    else {
        document.getElementById("bdErr").innerHTML = "";
        document.getElementById("ageErr").innerHTML = "";
        var current = new Date();
        var age = current.getFullYear() - year;
        document.getElementById("age").value = age;
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

function checkAddress() {
    var street = document.getElementById("street").value;
    var houseNumber = document.getElementById("houseNumber").value;
    var city = document.getElementById("city").value;
    var address = street + "/" + houseNumber + "/" + city;
    if ((street.length) == 0 || (houseNumber == 0) || (city == 0)) {
        document.getElementById("addressErr").innerHTML = "יש למלא את כל התאים";
        return false;
    }
    if (isNaN(houseNumber)) {
        document.getElementById("addressErr").innerHTML = "טעות בהכנסת מספר בית";
        return false;
    }
    document.getElementById("addressErr").innerHTML = "";
    return true;

}

function check() {
    var a = checkFirstName();
    var b = checkLastName();
    var c = checkUsername();
    var d = checkPassword();
    var e = checkBirthdate();
    var f = checkEmail();
    var g = checkPhone();
    var h = checkGender();
    var i = checkAddress();

    return a && b && c && d && e && f && g && h && i;
}

function Logincheck(){
    var c = checkUsername();
    var d = checkPassword();

    return c && d;
}