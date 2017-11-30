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
    public partial class Layout_master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand cmpLenh;
            connectData(out conn, out cmpLenh);

            LoadCategories(conn, cmpLenh);
        }

        private static void connectData(out SqlConnection conn, out SqlCommand cmpLenh)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            conn.Open();
            cmpLenh = new SqlCommand();
        }

        private void LoadCategories(SqlConnection conn, SqlCommand cmpLenh)
        {
            cmpLenh.CommandText = "LoadCategories";
            cmpLenh.Connection = conn;
            cmpLenh.CommandType = CommandType.StoredProcedure;
            SqlDataReader Categories = cmpLenh.ExecuteReader();
            RepeaterCategories.DataSource = Categories;
            RepeaterCategories.DataBind();
            Categories.Dispose();
        }
    }
}