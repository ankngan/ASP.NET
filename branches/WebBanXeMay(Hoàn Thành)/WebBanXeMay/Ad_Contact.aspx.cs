using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_Contact : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            rptContact.DataSource = DB.getLidtContact();
            rptContact.DataBind();
        }
    }
}