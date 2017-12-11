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
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    
                    txtUser.Text =Session["user"].ToString();
                    //txtPass.Text = Session["pass"].ToString();
                    string message = "<script language=javascript>alert('Đăng ký thành công');</script>";
                    Response.Write(message);
                }
                
            }
        }

        protected void lbtnDangNhap_Click(object sender, EventArgs e)
        {

            DataTable dataTable = new DataTable();
            dataTable = DB.getLidtUser();
            if (!string.IsNullOrEmpty(txtUser.Text.Trim().Trim()))
            {
                lblUser.Visible = false;
                if (!string.IsNullOrEmpty(txtPass.Text.Trim().Trim()))
                {
                    lblPass.Visible = false;
                    if (dataTable.Rows.Count > 0)
                    {
                        for (int i = 0; i < dataTable.Rows.Count; i++)
                        {
                            if ((dataTable.Rows[i]["user_name"].ToString().Equals(txtUser.Text.Trim()) || dataTable.Rows[i]["user_email"].ToString().Equals(txtUser.Text.Trim())) && dataTable.Rows[i]["user_password"].ToString().Equals(txtPass.Text.Trim()))
                            {
                                if (dataTable.Rows[i]["user_name"].Equals("admin"))
                                {
                                    txtPass.Visible = false;
                                    Session["idNguoiDung"] = dataTable.Rows[i]["user_id"].ToString();
                                    Session["hienThiTen"] = dataTable.Rows[i]["name"].ToString();
                                    Session["EmailND"] = dataTable.Rows[i]["user_email"].ToString();
                                    Session["PhoneND"] = dataTable.Rows[i]["user_phone"].ToString();
                                    Session["AddressND"] = dataTable.Rows[i]["user_address"].ToString();
                                    Response.Redirect("Ad_User.aspx");
                                    break;
                                    
                                }
                                else 
                                {
                                    txtPass.Visible = false;
                                    Session["hienThiTen"] = dataTable.Rows[i]["name"].ToString();
                                    Response.Redirect("Home.aspx");
                                    break;
                                }

                            }
                            else
                            {
                                lblPass.Text = "Mật khẩu hoặc tên đăng nhập không đúng!";
                                lblPass.Visible = true;
                            }
                        }
                    }
                    else 
                    {
                        lblPass.Text = "Mật khẩu hoặc tên đăng nhập không đúng!";
                        lblPass.Visible = true;                
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