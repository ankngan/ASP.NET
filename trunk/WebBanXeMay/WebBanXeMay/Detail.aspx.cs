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
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand cmpLenh;
            connectData(out conn, out cmpLenh);

            LoadProductDetail(conn, cmpLenh);
            //LoadProducer(conn, cmpLenh);
            //LoadMotoModel(conn, cmpLenh);
            //LoadEmployer(conn, cmpLenh);
        }
        private static void connectData(out SqlConnection conn, out SqlCommand cmpLenh)
        {
            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            conn.Open();
            cmpLenh = new SqlCommand();
        }

        private void LoadProductDetail(SqlConnection conn, SqlCommand cmpLenh)
        {
            String str = Request.QueryString["id"].ToString();
            int id = Int16.Parse(str);

            cmpLenh.CommandText = "LoadProductDetail";
            cmpLenh.Parameters.Add("@id", SqlDbType.Int).Value = id;
            cmpLenh.Connection = conn;
            cmpLenh.CommandType = CommandType.StoredProcedure;
            SqlDataReader Product = cmpLenh.ExecuteReader();

            RepeaterProduct.DataSource = Product;
            RepeaterProduct.DataBind();
            Product.Dispose();
        }

        /*private void LoadProducer(SqlConnection conn, SqlCommand cmpLenh)
        {
            cmpLenh.CommandText = "LoadProducer";
            cmpLenh.Connection = conn;
            cmpLenh.CommandType = CommandType.StoredProcedure;
            SqlDataReader Producer = cmpLenh.ExecuteReader();
            RepeaterProducer.DataSource = Producer;
            RepeaterProducer.DataBind();
            Producer.Dispose();
        }

        private void LoadMotoModel(SqlConnection conn, SqlCommand cmpLenh)
        {
            cmpLenh.CommandText = "LoadMoto_Model";
            cmpLenh.Connection = conn;
            cmpLenh.CommandType = CommandType.StoredProcedure;
            SqlDataReader MotoModel = cmpLenh.ExecuteReader();
            RepeaterMoto_model.DataSource = MotoModel;
            RepeaterMoto_model.DataBind();
            MotoModel.Dispose();
        }

        private void LoadEmployer(SqlConnection conn, SqlCommand cmpLenh)
        {
            cmpLenh.CommandText = "LoadEmployer";
            cmpLenh.Connection = conn;
            cmpLenh.CommandType = CommandType.StoredProcedure;
            SqlDataReader Employer = cmpLenh.ExecuteReader();
            RepeaterEmployer.DataSource = Employer;
            RepeaterEmployer.DataBind();
            Employer.Dispose();
        }*/

    }
}