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
    public partial class Home : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            LoadProducts();
            
        }

        
        private void LoadProducts()
        {
            
            RepeaterProducts.DataSource = DB.getLidtProduct() ;
            RepeaterProducts.DataBind();
            
        }

       
    }
}