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
    public partial class Product : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["id"]==null)
                    Response.Redirect("Home.aspx");
                LoadProducts();    
            }
            
            
        }

        
        private void LoadProducts()
        {
            String id_category = Request.QueryString["id"].ToString();
            int converId = Int16.Parse(id_category);
            if (converId < 4)
            {
                
                RepeaterProducts.DataSource = DB.getProductsByCategories(converId);
                RepeaterProducts.DataBind();
                
            }
            else
                Response.Redirect("Contact.aspx");
        }

        
    }
}