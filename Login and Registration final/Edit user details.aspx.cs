using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Login_and_Registration_final
{
    public partial class edit_user_details : System.Web.UI.Page
    {
        public string firstName;
        public string lastName;
        public string username;
        public string password;
        public string birthdate;
        public string email;
        public string phone;
        public string gender;
        public string address;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            
            if (!(bool)Session["isAdmin"])
            {
                string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionstring);
                string commandString = string.Format("SELECT * FROM [Users] WHERE username=N'{0}'", Session["user"]);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(commandString, connectionstring);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count != 1)
                {
                    Response.Redirect("Login.aspx");
                }
                DataRow row = ds.Tables[0].Rows[0];
                username = row["username"].ToString();
                firstName = row["firstName"].ToString();
                lastName = row["lastName"].ToString();
                password = row["password"].ToString();
                birthdate = row["birthdate"].ToString();
                email = row["email"].ToString();
                phone = row["phone"].ToString();
                gender = row["gender"].ToString();
                address = row["address"].ToString();
                connection.Close();
            }

            else
            {
                DataSet xmlSet = new DataSet();
                xmlSet.ReadXml(System.Web.HttpContext.Current.Server.MapPath("admins.xml"));
                foreach (DataRow row in xmlSet.Tables[0].Rows)
                {
                    if (Session["usernameData"].ToString() == row["username"].ToString())
                    {
                        username = row[0].ToString();
                        password = row[1].ToString();
                        firstName = row[2].ToString();
                        lastName = row[3].ToString();
                        birthdate = row[4].ToString();
                        email = row[5].ToString();
                        phone = row[6].ToString();
                        gender = row[7].ToString();
                        address = row[8].ToString();
                    }
                }
            }

            if (Request.Form["submit"] != null)
            {
                firstName = Request.Form["firstName"];
                lastName = Request.Form["lastName"];
                password = Request.Form["password"];
                birthdate = Request.Form["birthdate"];
                email = Request.Form["email"];
                phone = Request.Form["phone"];
                gender = Request.Form["gender"];
                address = Request.Form["address"];

                if (!(bool)Session["isAdmin"])
                {
                    string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
                    string sqlInsertData = string.Format("UPDATE [Users] SET username = N'{0}',  password = N'{1}', firstName = N'{2}', lastName = N'{3}', birthdate = N'{4}', email = N'{5}', phone = N'{6}', gender = N'{7}', address = N'{8}' where (username = N'{0}')", username, password, firstName, lastName, birthdate, email, phone, gender, address);
                    SqlConnection connectionObj = new SqlConnection(connectionstring);
                    SqlCommand updateQuery = new SqlCommand(sqlInsertData, connectionObj);
                    connectionObj.Open();
                    int updatedRows = updateQuery.ExecuteNonQuery();
                    connectionObj.Close();
                    if (updatedRows == 1)
                    {
                        Response.Redirect("/User info.aspx");
                    }
                }

                else
                {
                    var xmlFile = XDocument.Load(MapPath("admins.xml"));
                    var userNode = xmlFile.Descendants("admin").FirstOrDefault(admin => admin.Element("username").Value == username);
                    userNode.SetElementValue("password", password);
                    userNode.SetElementValue("firstName", firstName);
                    userNode.SetElementValue("lastName", lastName);
                    userNode.SetElementValue("birthdate", birthdate);
                    userNode.SetElementValue("email", email);
                    userNode.SetElementValue("phone", phone);
                    userNode.SetElementValue("homeAddress", address);
                    userNode.SetElementValue("Gender", gender);
                    
                }
                

            }
            
                

                
            
        }

    }
}