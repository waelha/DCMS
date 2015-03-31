using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DCMS_V7.App_Code;

namespace DCMS_V7
{
    public partial class X_Ray : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            if(ASPxUploadControl1.HasFile)
            {
                int I_ID = int.Parse(Session["I_ID"].ToString());                
                int P_ID = int.Parse(Session["P_ID"].ToString());
                string filename = ASPxUploadControl1.FileName;
                string uploadfolder = Request.PhysicalApplicationPath;
                filename = Convert.ToString(P_ID) + " " +Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute)+".jpg";
                //string ext = Path.GetExtension(ASPxUploadControl1.PostedFile.FileName);
                filename.Replace(':', '-');
                filename.Replace('/', ' ');
                ASPxUploadControl1.SaveAs(Server.MapPath("~/Content/Xrays") + filename);
                C_Lab.SetImageURL(I_ID, "~/Content/Xrays"+filename);
                ASPxGridView1.DataBind();

            }
        }

        protected void ASPxGridView1_SelectionChanged(object sender, EventArgs e)
        {
  
        }

        protected void ASPxGridLookup2_TextChanged(object sender, EventArgs e)
        {
            Session["I_ID"] = ASPxGridLookup2.Text;
        }
    }
}