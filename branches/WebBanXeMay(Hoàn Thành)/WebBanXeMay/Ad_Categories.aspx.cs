﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Categories : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa dòng xe này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulCategories.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulCategories.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulCategories.ActiveViewIndex = 2;
        //}
        
        void LoadCategories()
        {
            rptCategories.DataSource = DB.getLidtCategories();
            rptCategories.DataBind();
        }
        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getCategoriesByID(Convert.ToInt32(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtCategoriesIdEdit.Text = dt.Rows[0]["Categories_id"].ToString();
                        txtCategoriesNameEdit.Text = dt.Rows[0]["Categories_name"].ToString();

                    }
                    break;
                case "Delete":
                    DB.deleteCategories(Convert.ToInt32(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());

                    break;
            }
        }

        protected void addNewCategories_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtCategoriesName.Text.Trim()))
            {
                DB.themCategories(txtCategoriesName.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
            else
            {
                Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
            }
        }

        protected void updateCategories_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtCategoriesNameEdit.Text.Trim()))
            {
                DB.updateCategories(Convert.ToInt32(txtCategoriesIdEdit.Text.Trim()), txtCategoriesNameEdit.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
            else 
            {
                Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
            }
        }
    }
}