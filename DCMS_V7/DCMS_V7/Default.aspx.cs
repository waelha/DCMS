using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCMS_V7.App_Code;
namespace DCMS_V7 {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            int USER_ID = (int)Session["U_ID"];
            Response.Redirect("~/" + C_GlobalActivities.CheckUserType(USER_ID));
        }
		
    }
}