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
            LoadProductByID();
        }

        private void LoadProductByID()
        {
            String product_id = Request.QueryString["id"].ToString();
            int converId = Int16.Parse(product_id);

            if (DB.getProductByID(converId).Rows.Count > 0)
            {
                RepeaterProduct.DataSource = DB.getProductByID(converId);
                RepeaterProduct.DataBind();
            }
            else
            {
               
            }


        }
    }
}