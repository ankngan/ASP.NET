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
            if (!string.IsNullOrEmpty(txtNameRef.Text.Trim()))
            {
                lblNameRef.Visible = false;
                if (!string.IsNullOrEmpty(txtUserNameRef.Text.Trim()))
                {
                    lblUserRef.Visible = false;
                    if (!string.IsNullOrEmpty(txtPassRef.Text.Trim()))
                    {
                        lblPassRef.Visible = false;
                        if (!string.IsNullOrEmpty(txtRePass.Text.Trim()))
                        {
                            lblRePass.Visible = false;
                            if (dataTable.Rows.Count > 0)
                            {
                                bool userExits = false;
                                foreach (DataRow dr in dataTable.Rows)
                                {
                                    if (dr["user_name"].Equals(txtUserNameRef.Text))
                                    {
                                        lblUserRef.Text = "Người dùng đã được đăng ký";
                                        lblUserRef.Visible = true;
                                        userExits = true;
                                        break;
                                    }
                                    else if (dr["user_email"].Equals(txtEmailRef.Text))
                                    {
                                        userExits = true;
                                        lblEmailRef.Text = "Email đã được đăng ký";
                                        lblEmailRef.Visible = true;
                                        break;
                                    }
                                    
                                    
                                }
                                if (userExits == false)
                                {
                                    if (txtPassRef.Text.Equals(txtRePass.Text.Trim()))
                                    {
                                        Session["user"] = txtUserNameRef.Text;
                                        lblRePass.Visible = false;
                                        DB.themUser(txtNameRef.Text.Trim(), txtUserNameRef.Text.Trim(), txtAddressRef.Text.Trim(),txtPhoneRef.Text.Trim(), txtEmailRef.Text.Trim(), txtPassRef.Text.Trim(), 0);
                                        Response.Redirect("Login.aspx");

                                    }
                                    else
                                    {
                                        lblRePass.Text = "Vui lòng nhập lại đúng mật khẩu đã nhập.";
                                        lblRePass.Visible = true;
                                    }   
                                }
                            }
                            else 
                            {
                                if (txtPassRef.Text.Equals(txtRePass.Text))
                                {
                                    lblRePass.Visible = false;
                                    Session["user"] = txtUserNameRef.Text;
                                    lblRePass.Visible = false;
                                    DB.themUser(txtNameRef.Text.Trim(), txtUserNameRef.Text.Trim(), txtAddressRef.Text.Trim(), txtPhoneRef.Text.Trim(), txtEmailRef.Text.Trim(), txtPassRef.Text.Trim(), 0);
                                    Response.Redirect("Login.aspx");
                                    
                                }
                                else
                                {
                                    lblRePass.Text = "Vui lòng nhập lại đúng mật khẩu đã nhập.";
                                    lblRePass.Visible = true;
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
                        lblPassRef.Text = "Vui lòng không để trống mật khẩu.";
                        lblPassRef.Visible = true;
                    }
                }
                else
                {
                    lblUserRef.Text = "Vui lòng không để trống Tên người dùng.";
                    lblUserRef.Visible = true;
                }
            }
            else
            {
                lblNameRef.Text = "Vui lòng nhập đầy đủ tên.";
                lblNameRef.Visible = true;
            }
            
            
        }

        protected void ckbNewLetter_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbNewLetter.Checked)
                lbtnDangKy.Enabled = true;
            else
                lbtnDangKy.Enabled = false;
            
        }
    }
}