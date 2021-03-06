﻿using System;
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
                lblSoLuong.Text = "0";
                lblSL.Text = "0";
                if (Session["cart"] !=null)
                {
                    int slSanPham = 0;
                    DataTable dt = (DataTable)Session["cart"];
                    for (int i = 0; i < dt.Rows.Count; i++)
			        {
                        slSanPham += int.Parse(dt.Rows[i]["Quantity"].ToString());
			        }
                    lblSL.Text = slSanPham.ToString();
                    lblSoLuong.Text = slSanPham.ToString();
                }
                
                if (Session["hienThiTen"] != null)
                {
                    mtvFormLogin.ActiveViewIndex = 1;
                    lblHienThi.Text = "Kính Chào! " + Session["hienthiten"].ToString();
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

        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn thật sự muốn đăng xuất?')";
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

        protected void Search_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx?key="+key_search.Text.Trim());
        }
    }
}