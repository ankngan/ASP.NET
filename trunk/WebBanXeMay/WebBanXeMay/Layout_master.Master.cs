using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;


namespace WebBanXeMay
{
    public partial class Layout_master : System.Web.UI.MasterPage
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["hienThiTen"] != null)
                {
                    mtvFormLogin.ActiveViewIndex = 1;
                    lblHienThi.Text ="Xin chào! " + Session["hienThiTen"].ToString();
                    //string message = "<script language=javascript>alert('Đăng nhập thành công');</script>";
                    //Response.Write(message);
                }
                else 
                {
                    mtvFormLogin.ActiveViewIndex = 0;
                    
                }
                LoadCategories();
                LoadProducer();
                LoadMotoModel();
                LoadEmployer();   
            }
            
           
        }

       
        private void LoadCategories()
        {
            
            RepeaterCategories.DataSource = DB.getLidtCategories();
            RepeaterCategories.DataBind();
            
        }
        private void LoadProducer()
        {
            
            RepeaterProducer.DataSource = DB.getLidtProducer();
            RepeaterProducer.DataBind();
        }

        private void LoadMotoModel()
        {
            
            RepeaterMoto_model.DataSource = DB.getLidtMoto_model();
            RepeaterMoto_model.DataBind();
            
        }

        private void LoadEmployer()
        {
            
            RepeaterEmployer.DataSource = DB.getLidtEmployer();
            RepeaterEmployer.DataBind();
            
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}