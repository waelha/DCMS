using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxClasses.Internal;
using DCMS_V7.App_Code;

namespace DCMS_V7 {
    public partial class RootMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["U_ID"] != null)
            {
                int U_ID = int.Parse(Session["U_ID"].ToString());
                if (C_GlobalActivities.CheckIfAdmin(U_ID))
                    ASPxMenu1.Items[2].Enabled = true;
                else
                    ASPxMenu1.Items[2].Enabled = false;
                if (C_GlobalActivities.CheckUserType(U_ID) != "Doctor")
                    ASPxMenu1.Items[1].Enabled = false;

            }
            else
            {
                HeadLoginView.Visible = false;
                ASPxMenu1.Visible = false;
            }
            
            ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by DCMS TCC PROJECT");
        }
    }
}