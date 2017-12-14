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
    public partial class Order : System.Web.UI.Page
    {
        protected void msg_Buy(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có mua sản phẩm này?')";
        }
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadProductByID();
                LoadProductByID1();
            }
            else
                Response.Redirect("Home.aspx");
            
            
        }

        private void LoadProductByID()
        {
            String product_id = Request.QueryString["id"].ToString();
            int converId = Int16.Parse(product_id);

            if (DB.getProductByID(converId).Rows.Count > 0)
            {
                RepeaterProduct.DataSource = DB.getDetailProductByID(converId);
                RepeaterProduct.DataBind();
            }
            


        }
        private void LoadProductByID1()
        {
            String product_id = Request.QueryString["id"].ToString();
            int converId = Int16.Parse(product_id);

            if (DB.getProductByID(converId).Rows.Count > 0)
            {
                RepeaterProduct1.DataSource = DB.getDetailProductByID(converId);
                RepeaterProduct1.DataBind();
            }



        }
        protected void lbtnAddToCart_Click(object sender, EventArgs e)
        {
            
            if (txtSoLuong.Text.Equals(""))
            {
                lblSoLuong.Visible = true;
                lblSoLuong.Text = "Bạn chưa nhập số lượng muốn mua.";
            }
            else 
            {
                lblSoLuong.Visible = false;
                int soLuong = int.Parse(txtSoLuong.Text);
                string product_id = Request.QueryString["id"].ToString();
                int converId = Int32.Parse(product_id);
                AddProductCart cartProduct = new AddProductCart();
                cartProduct.Shoppping_AddCart(converId, soLuong);
                Response.Redirect(Request.Url.ToString());
            }
            
            
        }

        protected void lbtnThanhToan_Click(object sender, EventArgs e)
        {

            if (Session["hienThiTen"] != null)
            {
                if (txtSoLuong.Text.Equals(""))
                {
                    lblSoLuong.Visible = true;
                    lblSoLuong.Text = "Bạn chưa nhập số lượng muốn mua.";
                }
                else
                {
                    string product_id = Request.QueryString["id"].ToString();
                    int converId = Convert.ToInt32(product_id);
                    DataTable dt = new DataTable();
                    dt = DB.getDetailProductByID(converId);
                    //string date_order = DateTime.Now.ToString("MM-dd-yyyy") + " " + DateTime.Now.ToString("hh:mm:ss");
                    if (DB.themorder(Convert.ToInt32(Session["idNguoiDung"].ToString()), float.Parse(dt.Rows[0]["product_price"].ToString()), Convert.ToInt32(txtSoLuong.Text.Trim()), DateTime.Now.ToString(), Session["hienThiTen"].ToString(),Session["PhoneND"].ToString(), Session["EmailND"].ToString(), Session["AddressND"].ToString()))
                    {
                        DataTable dtOrder = (DataTable)DB.getLidtOrder();
                        if (DB.themOrder_Dettail(Convert.ToInt32(dtOrder.Rows[(dtOrder.Rows.Count) - 1]["orders_id"].ToString()), converId, Convert.ToInt32(txtSoLuong.Text.Trim()), float.Parse(dt.Rows[0]["product_price"].ToString())))
                        {
                            Response.Write("<script language=javascript>alert('Bạn vừa đặt hàng thành công!');</script>");
                            txtSoLuong.Text = "";    
                        }
                        
                        
                    }
                    else
                        Response.Write("<script language=javascript>alert('Quá trình đặt hàng thất bại !');</script>");
                }
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}