using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCMS_V7.App_Code;

namespace DCMS_V7
{
    public partial class Admin_panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            List<object> fieldValues = ASPxGridView1.GetSelectedFieldValues(new string[] { "ID" });
            foreach (int item in fieldValues)
            {
                C_Admin.DeleteUser(item);
                ASPxGridView1.DataBind();
                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();
            }
        }

        protected void ASPxFormLayout1_E8_Click(object sender, EventArgs e)
        {
        }

        protected void ASPxFormLayout1_E5_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void ASPxFormLayout1_E6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {

        }

        protected void ASPxFormLayout1_E12_Click(object sender, EventArgs e)
        {
            DateTime MinDate = new DateTime(1920, 01, 01);
            string U_name = ASPxFormLayout1_E1.Text;
            string Pass=ASPxFormLayout1_E2.Text;
            string F_name = ASPxFormLayout1_E9.Text;
            string L_name = ASPxFormLayout1_E10.Text;
            string Spec = ASPxFormLayout1_E3.SelectedItem.Value.ToString();
            string P_num = ASPxFormLayout1_E4.Text;
            string E_mail = ASPxFormLayout1_E5.Text;
            string City = ASPxFormLayout1_E7.SelectedItem.Value.ToString();
            string Address = ASPxFormLayout1_E6.Text;
            DateTime DOB = ASPxFormLayout1_E11.SelectedDate;
            if (DOB < MinDate)
                DOB = DateTime.Now;
            
            C_Admin.AddUser(U_name,Pass,P_num,E_mail,City,Address,false,false,F_name, L_name,  DOB.Day, DOB.Month, DOB.Year,Spec);
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();

        }

        protected void ASPxFormLayout1_E8_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["C_ID"] = ASPxFormLayout1_E8.SelectedIndex + 1;
        }

        protected void ASPxFormLayout2_E9_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["C_ID"] = ASPxFormLayout2_E9.SelectedIndex + 1;

        }

        protected void ASPxFormLayout2_E10_Click(object sender, EventArgs e)
        {
            string U_name = ASPxFormLayout2_E3.Text;
            string Pass = ASPxFormLayout2_E2.Text;
            string L_name = ASPxFormLayout2_E6.Text;
            string Type = ASPxFormLayout2_E7.SelectedItem.Value.ToString();
            string P_num = ASPxFormLayout2_E1.Text;
            string E_mail = ASPxFormLayout2_E4.Text;
            string City = ASPxFormLayout2_E8.SelectedItem.Value.ToString();
            string Address = ASPxFormLayout2_E5.Text;
            
            C_Admin.AddUser(U_name, Pass, P_num, E_mail, City, Address, false, false, L_name, Type, "General");
            ASPxGridView1.DataBind();
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();
        }
    }
}