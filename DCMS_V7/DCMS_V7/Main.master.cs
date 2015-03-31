using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCMS_V7 {
    public partial class MainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void ASPxGridLookup1_TextChanged(object sender, EventArgs e)
        {
            Session["P_ID"] =ASPxGridLookup1.Text;
            Response.RedirectLocation = "Default.aspx";
        }
    }
}