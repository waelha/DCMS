using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DCMS_V7.App_Code;

namespace DCMS_V7 {
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack)
                Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e) {
            if(C_GlobalActivities.CheckUsernameAndPassword(tbUserName.Text,tbPassword.Text))
            {
                int USER_ID=C_GlobalActivities.GetUserID(tbUserName.Text);
                if(!C_GlobalActivities.CheckIfBanned(USER_ID))
                {
                    Session["U_ID"] = USER_ID;
                    Response.Redirect("~/");
                }
                else
                {
                    tbUserName.ErrorText = "Banned user contact the DCMS admin for help.";
                    tbUserName.IsValid = false;
                }
            }
            else
            {
                tbUserName.ErrorText = "Invalid user";
                tbUserName.IsValid = false;
            }
        }
    }
}