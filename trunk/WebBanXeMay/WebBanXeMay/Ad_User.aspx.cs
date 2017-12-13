using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUser();   
            }
            
        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa người dùng này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulUser.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulUser.ActiveViewIndex = 1;
            
        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
         //   mulUser.ActiveViewIndex = 2;
        //}
        ConnectDB DB = new ConnectDB();
        void LoadUser() 
        {
            rptUser.DataSource = DB.getLidtUser();
            rptUser.DataBind();
        } 
        protected void rptUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch(e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getUserByID(Convert.ToInt32(e.CommandArgument.ToString()));
                    if (dt.Rows.Count>0)
                    {
                        txtIDEdit.Text = dt.Rows[0]["user_id"].ToString();
                        txtNameEdit.Text = dt.Rows[0]["name"].ToString();
                        txtUserNameEdit.Text = dt.Rows[0]["user_name"].ToString();
                        txtAddressEdit.Text = dt.Rows[0]["user_address"].ToString();
                        txtPhoneEdit.Text = dt.Rows[0]["user_phone"].ToString();
                        txtEmailEdit.Text = dt.Rows[0]["user_email"].ToString();
                        txtPassEdit.Text = dt.Rows[0]["user_password"].ToString();
                        txtPerEdit.Text = dt.Rows[0]["user_permission"].ToString();
                    }
                    break;
                case"Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                        DB.deleteUser(Convert.ToInt32(e.CommandArgument.ToString()));
                        Response.Redirect(Request.Url.ToString());       
                //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                     //   Response.Redirect("User.aspx");
                    //}
                    break;
            }
        }

        protected void addNewUser_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = DB.getLidtUser();
            if (dataTable.Rows.Count > 0)
            {
                bool userExits = false;
                foreach (DataRow dr in dataTable.Rows)
                {
                    if (dr["user_name"].Equals(txtUserName.Text))
                    {
                        lblUser.Text = "Người dùng đã được đăng ký";
                        lblUser.Visible = true;
                        userExits = true;
                        break;
                    }
                    else if (dr["user_email"].Equals(txtEmail.Text))
                    {
                        userExits = true;
                        lblEmail.Text = "Email đã được đăng ký";
                        lblEmail.Visible = true;
                        break;
                    }


                }
                if (userExits == false)
                {
                    if (!string.IsNullOrEmpty(txtName.Text.Trim()) && !string.IsNullOrEmpty(txtPass.Text.Trim()) && !string.IsNullOrEmpty(txtUserName.Text.Trim()) && !string.IsNullOrEmpty(txtPer.Text.Trim()) && !string.IsNullOrEmpty(txtEmail.Text.Trim()) && !string.IsNullOrEmpty(txtAddress.Text.Trim()))
                    {
                        DB.themUser(txtName.Text.Trim(), txtUserName.Text.Trim(), txtAddress.Text.Trim(), txtPhone.Text.Trim(), txtEmail.Text.Trim(), txtPass.Text.Trim(), Convert.ToInt32(txtPer.Text.Trim()));
                        Response.Redirect(Request.Url.ToString());
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
                    }    
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(txtName.Text.Trim()) && !string.IsNullOrEmpty(txtPass.Text.Trim()) && !string.IsNullOrEmpty(txtUserName.Text.Trim()) && !string.IsNullOrEmpty(txtPer.Text.Trim()) && !string.IsNullOrEmpty(txtEmail.Text.Trim()) && !string.IsNullOrEmpty(txtAddress.Text.Trim()))
                {
                    DB.themUser(txtName.Text.Trim(), txtUserName.Text.Trim(), txtAddress.Text.Trim(), txtPhone.Text.Trim(), txtEmail.Text.Trim(), txtPass.Text.Trim(), Convert.ToInt32(txtPer.Text.Trim()));
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
                }
            }
        }

        protected void updateUser_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtIDEdit.Text.Trim()) && !string.IsNullOrEmpty(txtNameEdit.Text.Trim()) && !string.IsNullOrEmpty(txtPassEdit.Text.Trim()) && !string.IsNullOrEmpty(txtUserNameEdit.Text.Trim()) && !string.IsNullOrEmpty(txtPerEdit.Text.Trim()) && !string.IsNullOrEmpty(txtAddressEdit.Text.Trim())  && !string.IsNullOrEmpty(txtEmailEdit.Text.Trim()))
            {
                DB.updateUser(Convert.ToInt32(txtIDEdit.Text.Trim()), txtNameEdit.Text.Trim(), txtUserNameEdit.Text.Trim(), txtAddressEdit.Text.Trim(), txtPhoneEdit.Text.Trim(), txtEmailEdit.Text.Trim(), txtPassEdit.Text.Trim(), Convert.ToInt32(txtPerEdit.Text.Trim()));
                Response.Redirect(Request.Url.ToString());
            }
            else
            {
                Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
            }
        }

        

 

    }
}