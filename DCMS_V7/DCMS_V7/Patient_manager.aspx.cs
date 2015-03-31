using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCMS_V7.App_Code;

namespace DCMS_V7
{
    public partial class Patient_manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            List<object> fieldValues = ASPxGridView1.GetSelectedFieldValues(new string[] { "ID" });
            foreach (int item in fieldValues)
            {
                C_Doctor.DeletePatient(item);
                ASPxGridView1.DataBind();
            }
        }

        protected void ASPxFormLayout1_E6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxFormLayout1_E5_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["C_ID"] = ASPxFormLayout1_E5.SelectedIndex+1;
        }

        protected void ASPxFormLayout1_E8_Click(object sender, EventArgs e)
        {
            DateTime MinDate = new DateTime(1920, 01, 01);
            string F_name = ASPxFormLayout1_E1.Text;
            string L_name = ASPxFormLayout1_E2.Text;
            string P_num = ASPxFormLayout1_E3.Text;
            string E_mail = ASPxFormLayout1_E4.Text;
            string City = ASPxFormLayout1_E6.SelectedItem.Value.ToString();
            DateTime DOB = ASPxFormLayout1_E7.SelectedDate;
            if (DOB < MinDate)
                DOB = DateTime.Now;
            string Address = ASPxFormLayout1_E9.Text;
            C_Doctor.AddPatient(F_name, L_name, P_num, E_mail, City, Address, DOB.Day, DOB.Month, DOB.Year);
            ASPxGridView1.DataBind();
        }
    }
}