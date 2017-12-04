using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_Producer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducer();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa người dùng này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulProducer.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulProducer.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulProducer.ActiveViewIndex = 2;
        //}
        ConnectDB DB = new ConnectDB();
        void LoadProducer()
        {
            rptProducer.DataSource = DB.getLidtProducer();
            rptProducer.DataBind();
        }
        protected void rptProducer_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getProducerByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtProducerIdEdit.Text = dt.Rows[0]["producer_id"].ToString();
                        txtProducerNameEdit.Text = dt.Rows[0]["producer_name"].ToString();
                       
                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteProducer(int.Parse(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Producer.aspx");
                    //}
                    break;
            }
        }

        protected void addNewProducer_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtProducerName.Text.Trim()))
            {
                DB.themProducer(txtProducerName.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void updateProducer_Click(object sender, EventArgs e)
        {
            DB.updateProducer(int.Parse(txtProducerIdEdit.Text.Trim()), txtProducerNameEdit.Text.Trim());
            Response.Redirect(Request.Url.ToString());
            if (!string.IsNullOrEmpty(txtProducerID.Text.Trim()))
            {
                
            }
        }
    }
}