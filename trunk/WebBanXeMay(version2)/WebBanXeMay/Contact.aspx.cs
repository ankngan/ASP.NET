using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Contact : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(hoten.Text))
            { 
                DB.themContact(hoten.Text, email.Text, noidung.Text);
                Response.Write("<script language=javascript>alert('Bạn đã gửi thành công, chúng tôi sẽ liên hệ bạn trong vòng 1h !');</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
            }
        }
    }
}