using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Search : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadProductsByKeySearch();
            
        }

         private void LoadProductsByKeySearch(){

             string key = Request.QueryString["key"].ToString();
             ResultSearch.Text = key;

             if (DB.getProductByKeySearch(key).Rows.Count > 0)
             {
                 ResultNull.Visible = false;
                 RepeaterProductsSearch.DataSource = DB.getProductByKeySearch(key);
                 RepeaterProductsSearch.DataBind();
             }
             else
             {

                 ResultNull.Visible = true;
                 ResultNull.Text = "Không tìm thấy sản phẩm.";

             }

         }
       
    }
}