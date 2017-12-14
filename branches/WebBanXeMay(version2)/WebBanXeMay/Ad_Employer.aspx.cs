using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebBanXeMay
{
    public partial class Ad_Employer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployer();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa nhân viên này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulEmployer.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulEmployer.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulEmployer.ActiveViewIndex = 2;
        //}
        ConnectDB DB = new ConnectDB();
        void LoadEmployer()
        {
            rptEmployer.DataSource = DB.getLidtEmployer();
            rptEmployer.DataBind();
        }
        protected void rptEmployer_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getEmployerByID(Convert.ToInt32(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtIDEdit.Text = dt.Rows[0]["Employer_id"].ToString();
                        txtNameEdit.Text = dt.Rows[0]["Employer_name"].ToString();
                        txtEmailEdit.Text = dt.Rows[0]["Employer_email"].ToString();
                        txtPhoneEdit.Text = dt.Rows[0]["Employer_phone"].ToString();
                        hdFImages.Value = dt.Rows[0]["avatar"].ToString();
                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteEmployer(Convert.ToInt32(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Employer.aspx");
                    //}
                    break;
            }
        }

        protected void addNewEmployer_Click(object sender, EventArgs e)
        {
            string file = UploadImage(flUpEmployer);
            if (!string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                if (!file.Equals(""))
                {
                    if (!string.IsNullOrEmpty(txtName.Text.Trim()) && !string.IsNullOrEmpty(txtPhone.Text.Trim()) && !string.IsNullOrEmpty(txtEmail.Text.Trim()))
                    {
                        DB.themEmployer(txtName.Text.Trim(), txtEmail.Text.Trim(),txtPhone.Text.Trim(), file);
                        Response.Redirect(Request.Url.ToString());
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
                    }
                }
                else
                {
                    string message = "<script language=javascript>alert('Bạn chưa chọn hình ảnh!');</script>";
                    Response.Write(message);
                }
                
            }
        }

        protected void updateEmployer_Click(object sender, EventArgs e)
        {
            string file = UploadImage(flUpEmployerEdit);
            if (file.Equals(""))
            {
                file = hdFImages.Value;
                if (File.Exists(Server.MapPath("~/images/employers/" + hdFImages.Value)) == true)
                {
                    file = hdFImages.Value;
                }
            }
            if (!string.IsNullOrEmpty(txtNameEdit.Text.Trim()) && !string.IsNullOrEmpty(txtPhoneEdit.Text.Trim()) && !string.IsNullOrEmpty(txtEmailEdit.Text.Trim()))
            {
                DB.updateEmployer(Convert.ToInt32(txtIDEdit.Text.Trim()), txtNameEdit.Text.Trim(), txtEmailEdit.Text.Trim(),txtPhoneEdit.Text.Trim(),file);
                Response.Redirect(Request.Url.ToString());
            }
            else
            {
                Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
            }
        }
        public string UploadImage(FileUpload value)
        {
            string typeFile = "";
            string file = "";
            if (value.FileName.Length > 0)
            {
                if (value.PostedFile.ContentLength < 5000000)
                {
                    if (value.PostedFile.ContentType.Equals("image/jpeg") || value.PostedFile.ContentType.Equals("image/png") || value.PostedFile.ContentType.Equals("image/gif"))
                    {
                        typeFile = Path.GetExtension(value.FileName).ToLower();
                        file = Path.GetFileName(value.PostedFile.FileName);
                        //file = value.FileName.Replace(file,file+typeFile);
                        value.PostedFile.SaveAs(Server.MapPath("~/images/employers/") + file);
                    }
                }
            }
            return file;
        }

    }
}