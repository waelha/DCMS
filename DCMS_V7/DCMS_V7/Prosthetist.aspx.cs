using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCMS_V7.App_Code;

namespace DCMS_V7
{
    public partial class Prosthetist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void ASPxFormLayout1_E2_Click(object sender, EventArgs e)
        {
            String newState=ASPxFormLayout1_E1.SelectedItem.Value.ToString();
            List<object> fieldValues = ASPxGridView1.GetSelectedFieldValues(new string[] { "ID" });
            foreach (int item in fieldValues) {
                C_Lab.SetPieceStatus(item,newState);
            }
            ASPxGridView1.DataBind();
        }
    }
}