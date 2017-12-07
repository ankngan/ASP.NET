using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_Order : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder();
                getUser();
                getUserEdit();
            }

        }

        void getUser() 
        {
            drlUserID.DataSource = DB.getLidtUser();
            drlUserID.DataValueField = "user_id";
            drlUserID.DataTextField = "name";
            drlUserID.DataBind();
        }
        void getUserEdit()
        {
            drlUserIDEdit.DataSource = DB.getLidtUser();
            drlUserIDEdit.DataValueField = "user_id";
            drlUserIDEdit.DataTextField = "name";
            drlUserIDEdit.DataBind();
        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa đơn hàng này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulOrder.ActiveViewIndex = 3;
            txtNgayDat.Text = DateTime.Now.ToString();
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulOrder.ActiveViewIndex = 1;

        }

        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulOrder.ActiveViewIndex = 2;
        //}
        
        protected void LoadOrder()
        {
            rptOrder.DataSource = DB.getLidtOrder();
            rptOrder.DataBind();
        }
        protected void rptOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":
                    dt = DB.getOrderByID(Convert.ToInt32(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtOderIDEdit.Text = dt.Rows[0]["orders_id"].ToString();
                        drlUserIDEdit.Text = dt.Rows[0]["user_id"].ToString();
                        txtTotalMoneyEdit.Text = dt.Rows[0]["total_money"].ToString();
                        txtQuantityEdit.Text = dt.Rows[0]["quantity"].ToString();
                        txtNgayDatEdit.Text = dt.Rows[0]["orders_date"].ToString();
                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteOrder(Convert.ToInt32(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Order.aspx");
                    //}
                    break;
            }
        }

        //protected void addNewOrder_Click(object sender, EventArgs e)
        //{
        //    if (!string.IsNullOrEmpty(txtNgayDat.Text.Trim()))
        //    {
        //                DB.themOrder(Convert.ToInt32(drlUserID.Text.Trim()), Convert.ToInt32(txtTotalMoney.Text.Trim()), Convert.ToInt32(txtQuantity.Text.Trim()), txtNgayDat.Text.Trim());
        //                Response.Redirect(Request.Url.ToString());
        //        }

        //    }

        //protected void updateOrder_Click(object sender, EventArgs e)
        //{
            
        //    if (!string.IsNullOrEmpty(txtOderIDEdit.Text.Trim()))
        //    {
        //        DB.updateOrder(Convert.ToInt32(txtOderIDEdit.Text.Trim()), Convert.ToInt32(drlUserIDEdit.Text.Trim()), Convert.ToInt32(txtTotalMoneyEdit.Text.Trim()), Convert.ToInt32(txtQuantityEdit.Text.Trim()), txtNgayDatEdit.Text.Trim());
        //        Response.Redirect(Request.Url.ToString());
        //    }
        //}



        protected void cldNgaydat_SelectionChanged(object sender, EventArgs e)
        {
            txtNgayDat.Text = cldNgaydat.SelectedDate.ToString("mm-dd-yyyy") + " " + DateTime.Now.ToString("hh:mm:ss");
        }

        protected void cldNgayDatEdit_SelectionChanged(object sender, EventArgs e)
        {
            txtNgayDatEdit.Text = cldNgayDatEdit.SelectedDate.ToString("mm-dd-yyyy") + " " + DateTime.Now.ToString("hh:mm:ss");
        }

       
    }
}