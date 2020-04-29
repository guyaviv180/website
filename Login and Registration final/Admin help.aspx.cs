using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_and_Registration_final
{
    public partial class Admin_help : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Guest help.aspx");
            }
            else if (Session["isAdmin"].ToString() == "False")
            {
                Response.Redirect("User help.aspx");
            }
        }
    }
}