using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_and_Registration_final
{
    public partial class home : System.Web.UI.Page
    {
        public string firstName;
        public string lastName;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionstring);
                string commandString = string.Format("SELECT * FROM [Users] WHERE username=N'{0}'", Session["user"]);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(commandString, connectionstring);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count == 1)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    firstName = row["firstName"].ToString();
                    lastName = row["lastName"].ToString();
                }

                else if (Session["isAdmin"].ToString() == "True")
                {
                    DataSet xmlDs = new DataSet();
                    xmlDs.ReadXml(System.Web.HttpContext.Current.Server.MapPath("admins.xml"));
                    foreach (DataRow Xrow in xmlDs.Tables[0].Rows)
                    {
                        firstName = Xrow[2].ToString();
                        lastName = Xrow[3].ToString();
                    }
                }

                if (Request.Form["logout"] != null)
                {
                    Session["user"] = null;
                    Response.Redirect("/Logout.aspx");
                }

                if (Request.Form["play connect four"] != null)
                {
                    Response.Redirect("/Connect four.aspx");
                }
            }
        }
    }
}