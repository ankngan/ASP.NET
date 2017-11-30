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
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có người dùng này?')";
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
        ConectDB DB = new ConectDB();
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
                    dt = DB.getUserByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count>0)
                    {
                        txtIDEdit.Text = dt.Rows[0]["user_id"].ToString();
                        txtNameEdit.Text = dt.Rows[0]["user_name"].ToString();
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
                        DB.deleteUser(int.Parse(e.CommandArgument.ToString()));
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
            if (!string.IsNullOrEmpty(txtID.Text.Trim()))
            {
                DB.themUser(int.Parse(txtID.Text.Trim()), txtName.Text.Trim(), txtAddress.Text.Trim(), int.Parse(txtPhone.Text.Trim()), txtEmail.Text.Trim(), txtPass.Text.Trim(), int.Parse(txtPer.Text.Trim()));
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void updateUser_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtIDEdit.Text.Trim()))
            {
                DB.updateUser(int.Parse(txtIDEdit.Text.Trim()), txtNameEdit.Text.Trim(), txtAddressEdit.Text.Trim(), int.Parse(txtPhoneEdit.Text.Trim()), txtEmailEdit.Text.Trim(), txtPassEdit.Text.Trim(), int.Parse(txtPerEdit.Text.Trim()));
                Response.Redirect(Request.Url.ToString());
            }
        }

        

 

    }
}