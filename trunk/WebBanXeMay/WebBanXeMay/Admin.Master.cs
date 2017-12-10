using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["hienThiTen"] != null && Session["hienThiTen"].Equals("admin"))
                {

                    lblHienThi.Text = Session["hienThiTen"].ToString();
                    //string message = "<script language=javascript>alert('Đăng nhập thành công');</script>";
                    //Response.Write(message);
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");

        }
    }
}