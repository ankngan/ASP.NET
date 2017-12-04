using System;
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
                    dt = DB.getCategoriesByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtCategoriesIdEdit.Text = dt.Rows[0]["Categories_id"].ToString();
                        txtCategoriesNameEdit.Text = dt.Rows[0]["Categories_name"].ToString();

                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteCategories(int.Parse(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Categories.aspx");
                    //}
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
        }

        protected void updateCategories_Click(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(txtCategoriesNameEdit.Text.Trim()))
            {
                DB.updateCategories(int.Parse(txtCategoriesIdEdit.Text.Trim()), txtCategoriesNameEdit.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}