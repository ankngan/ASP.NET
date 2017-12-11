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
            string date_order = DateTime.Now.ToString("MM-dd-yyyy") + " " + DateTime.Now.ToString("hh:mm:ss");
            DataTable dt = (DataTable)Session["cart"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DB.themorder(Convert.ToInt32(Session["idNguoiDung"].ToString()), Convert.ToInt32(dt.Rows[i]["PId"].ToString()), Convert.ToInt32(dt.Rows[i]["ToTalMoney"].ToString()), Convert.ToInt32(dt.Rows[i]["Quantity"].ToString()), date_order, Session["hienThiTen"].ToString(), Convert.ToInt32(Session["PhoneND"].ToString()), Session["EmailND"].ToString(), Session["AddressND"].ToString());
                }
            }
            //else
            //{
 
            //}
            
            
        }
    }
}