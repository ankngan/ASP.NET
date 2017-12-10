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
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadProductByID();
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
        protected void lbtnAddToCart_Click(object sender, EventArgs e)
        {
            string product_id = Request.QueryString["id"].ToString();
            int converId = Int32.Parse(product_id);
            AddProductCart cartProduct = new AddProductCart();
            cartProduct.Shoppping_AddCart(converId,2);
            Response.Redirect("Cart.aspx");
        }
    }
}