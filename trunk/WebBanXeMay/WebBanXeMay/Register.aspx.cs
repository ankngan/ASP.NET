using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Register : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void lbtnDangKy_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = DB.getLidtUser();
            if (!string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                lblName.Visible = false;
                if (!string.IsNullOrEmpty(txtUserName.Text.Trim()))
                {
                    lblUser.Visible = false;
                    if (!string.IsNullOrEmpty(txtPass.Text.Trim()))
                    {
                        lblPass.Visible = false;
                        if (!string.IsNullOrEmpty(txtRePass.Text.Trim()))
                        {
                            lblRePass.Visible = false;
                            for (int i = 0; i < dataTable.Rows.Count; i++)
                            {
                                if (dataTable.Rows[i]["user_name"].ToString() != txtUserName.Text.Trim())
                                {
                                    lblUser.Visible = false;
                                    if (dataTable.Rows[i]["user_email"].ToString() != txtEmail.Text.Trim())
                                    {
                                        lblEmail.Visible = false;
                                        if (txtPass.Text.Equals(txtRePass.Text))
                                        {
                                            lblRePass.Visible = false;
                                            DB.themUser(txtName.Text.Trim(), txtUserName.Text.Trim(), txtAddress.Text.Trim(), Convert.ToInt32(txtPhone.Text.Trim()), txtEmail.Text.Trim(), txtPass.Text.Trim(), 0);
                                            Response.Redirect("Home.aspx");
                                            break;
                                        }
                                        else
                                        {
                                            lblRePass.Text = "Vui lòng nhập lại đúng mật khẩu.";
                                            lblRePass.Visible = true;
                                        }
                                    }
                                    else
                                    {
                                        lblEmail.Text = "Email đã được đăng ký.";
                                        lblEmail.Visible = true;
                                    }
                                }
                                else
                                {
                                    lblUser.Text = "Người dùng đã được đăng ký";
                                    lblUser.Visible = true;
                                }

                            }
                        }
                        else 
                        {
                            lblRePass.Text = "Vui lòng nhập đầy lại mật khẩu.";
                            lblRePass.Visible = true;
                        }
                    }
                    else
                    {
                        lblPass.Text = "Vui lòng không để trống mật khẩu.";
                        lblPass.Visible = true;
                    }
                }
                else
                {
                    lblUser.Text = "Vui lòng không để trống Tên người dùng.";
                    lblUser.Visible = true;
                }
            }
            else
            {
                lblName.Text = "Vui lòng nhập đầy đủ tên.";
                lblName.Visible = true;
            }
            
            
        }

        protected void ckbNewLetter_CheckedChanged(object sender, EventArgs e)
        {
            lbtnDangKy.Enabled = true;
        }
    }
}