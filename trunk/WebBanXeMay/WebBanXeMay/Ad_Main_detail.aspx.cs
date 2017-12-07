using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_Main_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMain_detail();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa dữ liệu này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulMain_detail.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulMain_detail.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulMain_detail.ActiveViewIndex = 2;
        //}
        ConnectDB DB = new ConnectDB();
        void LoadMain_detail()
        {
            rptMain_detail.DataSource = DB.getLidtMain_detail();
            rptMain_detail.DataBind();
        }
        protected void rptMain_detail_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getMain_detailByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtMain_detailIdEdit.Text = dt.Rows[0]["main_detail_id"].ToString();
                        txtModelEdit.Text = dt.Rows[0]["model"].ToString();
                        txtWeightEdit.Text = dt.Rows[0]["weight"].ToString();
                        txtSizeEdit.Text = dt.Rows[0]["size"].ToString();
                        txtTankCapacityEdit.Text = dt.Rows[0]["tank_capacity"].ToString();
                        txtWarrantyPeriodEdit.Text = dt.Rows[0]["warranty_period"].ToString();

                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteMain_detail(int.Parse(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Main_detail.aspx");
                    //}
                    break;
            }
        }

        protected void addNewMain_detail_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtModel.Text.Trim()))
            {
                DB.themMain_detail(txtModel.Text.Trim(),float.Parse(txtWeight.Text.Trim()),txtSize.Text.Trim(),float.Parse(txtTankCapacity.Text.Trim()),txtWarrantyPeriod.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void updateMain_detail_Click(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(txtMain_detailIdEdit.Text.Trim()))
            {
                DB.updateMain_detail(Int32.Parse(txtMain_detailIdEdit.Text.Trim()), txtModelEdit.Text.Trim(), float.Parse(txtWeightEdit.Text.Trim()), txtSizeEdit.Text.Trim(), float.Parse(txtTankCapacityEdit.Text.Trim()), txtWarrantyPeriodEdit.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}