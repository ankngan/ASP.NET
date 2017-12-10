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
    }
}