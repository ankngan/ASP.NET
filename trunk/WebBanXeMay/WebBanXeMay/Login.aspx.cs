using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Login : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbtnDangNhap_Click(object sender, EventArgs e)
        {

            DataTable dataTable = new DataTable();
            dataTable = DB.getLidtUser();
            if (!string.IsNullOrEmpty(txtUser.Text.Trim()))
            {
                lblUser.Visible = false;
                if (!string.IsNullOrEmpty(txtPass.Text.Trim()))
                {
                    lblPass.Visible = false;
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        if ((dataTable.Rows[i]["user_name"].ToString().Equals(txtUser.Text)||dataTable.Rows[i]["user_email"].ToString().Equals(txtUser.Text)) && dataTable.Rows[i]["user_password"].ToString().Equals(txtPass.Text))
                        {
                            txtPass.Visible = false;
                            string message = "<script language=javascript>alert('Đăng nhập thành công');</script>";
                            Response.Write(message);
                            Response.Redirect("Home.aspx");

                        }
                        else {
                            lblPass.Text = "Mật khẩu hoặc tên đăng nhập không đúng!";
                            lblPass.Visible = true;
                        }
                    }
                }
                else
                {
                    lblPass.Text = "Mật khẩu không đúng!";
                    lblPass.Visible = true;
                }
            }
            else
            {
                lblUser.Text = "Bạn nhập sai tài khoản!";
                lblUser.Visible = true;
            }
        }
    }
}