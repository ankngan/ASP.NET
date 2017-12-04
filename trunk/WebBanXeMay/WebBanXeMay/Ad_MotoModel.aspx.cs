using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_MotoModel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMoto_Model();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa dữ liệu này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulMoto_Model.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulMoto_Model.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulMoto_Model.ActiveViewIndex = 2;
        //}
        ConnectDB DB = new ConnectDB();
        void LoadMoto_Model()
        {
            rptMoto_Model.DataSource = DB.getLidtMoto_model();
            rptMoto_Model.DataBind();
        }
        protected void rptMoto_Model_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getMoto_modelByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtMoto_ModelIdEdit.Text = dt.Rows[0]["Moto_Model_id"].ToString();
                        txtMoto_ModelNameEdit.Text = dt.Rows[0]["Moto_Model_name"].ToString();

                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteMoto_model(int.Parse(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Moto_Model.aspx");
                    //}
                    break;
            }
        }

        protected void addNewMoto_Model_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMoto_ModelName.Text.Trim()))
            {
                DB.themMoto_model(txtMoto_ModelName.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void updateMoto_Model_Click(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(txtMoto_ModelIdEdit.Text.Trim()))
            {
                DB.updateMoto_model(int.Parse(txtMoto_ModelIdEdit.Text.Trim()), txtMoto_ModelNameEdit.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}