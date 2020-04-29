﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Login_and_Registration_final
{
    public partial class Show_all_users : System.Web.UI.Page
    {
        protected string Table = "";
        protected string filterWhere = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["CsErr"] = "רק מנהלים מורשים לדף זה";
                Response.Redirect("/Error page.aspx");
            }
            if (Session["isAdmin"].ToString() == "False")
            {
                Session["CsErr"] = "רק מנהלים מורשים לדף זה";
                Response.Redirect("/Error page.aspx");
            }

            string commandString = string.Format("SELECT * FROM users");
            bool continueFlag = true;

            if (Request.Form["filter"] != null)
            {
                string firstValue = Request.Form["firstValue"].ToString();
                string secondValue = Request.Form["secondValue"].ToString();
                string firstFilter = Request.Form["firstFilter"].ToString();
                string secondFilter = Request.Form["secondFilter"].ToString();
                if (firstValue == "" && firstValue == "")
                {

                }
                else if (firstValue != "" && secondValue != "")
                {
                    if (firstFilter != secondFilter)
                    {
                        commandString += " WHERE (" + firstFilter + " = N'" + firstValue + "')";
                        commandString += " AND (" + secondFilter + " = N'" + secondValue + "')";
                    }
                    else
                    {
                        Table = "<table border='1' id=\"tbl1\" name=\"tbl1\"><span style='color:red; font-weight:bold'>על שני החתכים להיות שונים</span>";
                        continueFlag = false;
                    }
                }
                else if (firstValue != "" && secondValue == "")
                {
                    commandString += " WHERE (" + firstFilter + " = N'" + firstValue + "')";
                }
                else if (firstValue == "" && secondValue != "")
                {
                    commandString += " WHERE (" + secondFilter + " = N'" + secondValue + "')";
                }
            }


            Table += "<table id = \"tbl1\"><tr><th >שם משתמש</th><th> סיסמה</th><th >שם פרטי</th><th >שם משפחה</th><th >כתובת אימייל</th><th >מספר טלפון</th><th >כתובת</th><th >מין</th><th >תאריך לידה</th><th >מחיקה</th></tr>";

            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(commandString, connectionstring);
            DataSet Data = new DataSet();
            adapter.Fill(Data);
            int i = 1;
            foreach (DataRow row in Data.Tables[0].Rows)
            {
                string username = row["username"].ToString();
                string firstName = row["firstName"].ToString();
                string lastName = row["lastName"].ToString();
                string password = row["password"].ToString();
                string birthdate = row["birthdate"].ToString();
                string email = row["email"].ToString();
                string phone = row["phone"].ToString();
                string gender = row["gender"].ToString();
                string address = row["address"].ToString();
                string tempRow = string.Format("<tr><td id=\"user" + i + "\" name=\"user" + i + "\" class=\"cell\">{0}</td><td class=\"cell\">{1}</td><td class=\"cell\">{2}</td><td class=\"cell\">{3}</td><td class=\"cell\">{4}</td><td class=\"cell\">{5}</td><td class=\"cell\">{6}</td><td class=\"cell\">{7}</td><td class=\"cell\">{8}</td><td><input class=\"cell\" type =\"checkbox\" name =\"chk" + i + "\" id =\"chk" + i + "\" </td></tr>", username, password, firstName, lastName, email, phone, address, gender, birthdate);
                Table += tempRow;
                i++;
            }
            Table += "</table>";
        }
    }
}