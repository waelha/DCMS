using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCMS_V7.App_Code;
namespace DCMS_V7
{
    public partial class Doctor1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {

        }

        protected void ASPxGridLookup1_TextChanged(object sender, EventArgs e)
        {
            Session["T_ID"] = ASPxGridLookup1.Text;
            ASPxGridView2.DataBind();
            ASPxRoundPanel1.Enabled = true;
        }

        protected void ASPxFormLayout1_E6_Click(object sender, EventArgs e)
        {
            DateTime MinDate = new DateTime(2000, 01, 01);
            string Kind = ASPxFormLayout1_E3.SelectedItem.Value.ToString();
            string Note = ASPxFormLayout1_E4.Text;
            DateTime Date = ASPxFormLayout1_E5.SelectedDate;
            if (Date < MinDate)
                Date = DateTime.Now;
            int T_ID = Convert.ToInt16(Session["T_ID"]);
            int D_ID = Convert.ToInt16(Session["U_ID"]);
            C_Doctor.AddTreatment(T_ID, D_ID, Kind, Note, Date.Day, Date.Month, Date.Year, 12, 00);
            ASPxGridView2.DataBind();

        }

        protected void ASPxFormLayout2_E4_Click(object sender, EventArgs e)
        {
            int P_ID=int.Parse(Session["P_ID"].ToString());
            int D_ID=int.Parse(Session["U_ID"].ToString());
            string Type=ASPxFormLayout2_E1.SelectedItem.Value.ToString();
            string Note=ASPxFormLayout2_E2.Text;

            C_Doctor.RequestImage(P_ID, D_ID, 2, Type, DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year, DateTime.Now.Hour, DateTime.Now.Minute, Note);
            Response.Redirect("~/");
        }

        protected void ASPxFormLayout3_E4_Click(object sender, EventArgs e)
        {
            int P_ID = int.Parse(Session["P_ID"].ToString());
            int D_ID = int.Parse(Session["U_ID"].ToString());
            string Type = ASPxFormLayout3_E1.SelectedItem.Value.ToString();
            string Note = ASPxFormLayout3_E3.Text;

            C_Doctor.RequestPiece(P_ID, D_ID, 7, Type, DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year, DateTime.Now.Hour, DateTime.Now.Minute, Note);
            ASPxGridView3.DataBind();
            Response.Redirect("~/");
        }


    }
}