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

            int page = Convert.ToInt32("0" + Request.QueryString["page"]);
            if (page == 0) page = 1;
            if (!IsPostBack)
            {
                NapDuLieu(page, 24, 3);
            }

        }

        
        private void LoadProducts()
        {
            
            RepeaterProducts.DataSource = DB.getLidtProduct() ;
            RepeaterProducts.DataBind();
            
        }
        //do dữ liệu
        
        //phantrang
        private void NapDuLieu(int currPage, int recodperpage, int Pagesize)
        {
            DataSet ds = DB.StoreToDataSet(currPage, recodperpage, Pagesize);
            DataTable dtbData = ds.Tables[0];
            DataTable dtbPhanTrang = ds.Tables[1];
            if (dtbData.Rows.Count > 0)
            {
                RepeaterProducts.DataSource = dtbData;
                RepeaterProducts.DataBind();
                if (dtbPhanTrang.Rows.Count > 0)
                {
                    ltlPhanTrang.Text = dtbPhanTrang.Rows[0]["PhanTrang"] + "";
                }
            }
        }


    }
}