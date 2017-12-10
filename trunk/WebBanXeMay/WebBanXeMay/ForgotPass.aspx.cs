using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void lbtnSend_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = DB.getLidtUser();
            if (!string.IsNullOrEmpty(txtEmailForGot.Text.Trim()))
            {
                lblEmail.Visible = false;
                if (dataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < dataTable.Rows.Count; i++)
                        {
                            if (txtEmailForGot.Text.Trim().Equals(dataTable.Rows[i]["user_email"].ToString()))
                            {
                                lblEmail.Visible = false;
                                lblCheckMail.Text = "Chúng tôi đã gửi link lấy lại mật khẩu vào trong email " + dataTable.Rows[i]["user_email"].ToString();
                                mtvForGotPass.ActiveViewIndex = 1;
                                break;
                            }
                            else
                            {
                                lblEmail.Text = "Email không đúng! Vui lòng nhập lại.";
                                lblEmail.Visible = true;
                                mtvForGotPass.ActiveViewIndex = 0;
                            }
                        }
                    }
                    else 
                    {
                        lblEmail.Text = "Email không đúng! Vui lòng nhập lại.";
                        lblEmail.Visible = true;                
                    }
                }
                else
                {
                    lblEmail.Text = "Nhập Email! Vui lòng không để trống.";
                    lblEmail.Visible = true;
                }
        }

        protected void LbtnCheckMail_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://mail.google.com");
        }
   }

}
