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
    public partial class BrandMoto : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand cmpLenh;
            connectData(out conn, out cmpLenh);

            LoadProducts(conn, cmpLenh);
           
        }
        private static void connectData(out SqlConnection conn, out SqlCommand cmpLenh)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            conn.Open();
            cmpLenh = new SqlCommand();
        }

        private void LoadProducts(SqlConnection conn, SqlCommand cmpLenh)
        {
            String id_category = Request.QueryString["id"].ToString();
            int converId = Int16.Parse(id_category);
            if (DB.getProductsByProducer(converId).Rows.Count > 0)
            {
                lblTitle.Visible = false;
                RepeaterProducts.DataSource = DB.getProductsByProducer(converId);
                RepeaterProducts.DataBind();
            }
            else
            {
                
                lblTitle.Visible = true;
                lblTitle.Text = "Sản phẩm đã hết hàng.";
                
            }
            
            
        }
       
    }
}