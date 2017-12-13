using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Cart : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa sản phẩm này?')";
        }

        protected void msg_Order(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có đặt hàng sản phẩm này?')";
        }
        AddProductCart cart = new AddProductCart();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] !=null)
            {
                
                DataTable dt = (DataTable)Session["cart"];
                rptProductCart.DataSource = dt;
                rptProductCart.DataBind();
                float total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total += Convert.ToSingle(dt.Rows[i]["ToTalMoney"]); 
                }
                ltTotal.Text = string.Format("{0:N0}", total);
            }
        }
        protected void rptProductCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            cart.ShoppingCart_Remove(int.Parse(e.CommandArgument.ToString()));
            Response.Redirect(Request.Url.ToString());
        }

        protected void lbtnThanhToan_Click(object sender, EventArgs e)
        {
            
            DataTable dt = (DataTable)Session["cart"];
            if (Session["idNguoiDung"] != null)
            {
                bool kiemTra = false;
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        if (DB.themorder(Convert.ToInt32(Session["idNguoiDung"].ToString()), Convert.ToInt32(dt.Rows[i]["PId"].ToString()), float.Parse(dt.Rows[i]["TotalMoney"].ToString()), Convert.ToInt32(dt.Rows[i]["Quantity"].ToString()), DateTime.Now.ToString(), Session["hienThiTen"].ToString(), Session["PhoneND"].ToString(), Session["EmailND"].ToString(), Session["AddressND"].ToString()))
                        {
                            
                            DataTable dtOrder = (DataTable)DB.getLidtOrder();
                            if (DB.themOrder_Dettail(Convert.ToInt32(dtOrder.Rows[(dtOrder.Rows.Count) - 1]["orders_id"].ToString()), Convert.ToInt32(dt.Rows[i]["PId"].ToString())))
                            {
                                //cart.ShoppingCart_Remove(Convert.ToInt32(dt.Rows[i]["PId"].ToString()));
                                kiemTra = true;
                            }
                        }

                        else
                        {
                            kiemTra = false;
                        }
                    }
                    if (kiemTra == true)
                    {
                        
                        //Response.Write("<script language=javascript>alert('Bạn vừa đặt hàng thành công!');</script>");
                        Response.Redirect("Home.aspx");
                    }
                    else
                        Response.Redirect("<script language=javascript>alert('Quá trình đặt hàng thất bại !');</script>");

                }
                else
                {
                    string message = "<script language=javascript>alert('Bạn chưa có sản phẩm nào để thanh toán!');</script>";
                    Response.Write(message);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
            
            
        }
    }
}