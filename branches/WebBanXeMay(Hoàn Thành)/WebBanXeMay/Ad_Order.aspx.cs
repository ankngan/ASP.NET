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
                getProduct();
                getProductEdit();
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
        void getProduct()
        {
            drdlProduct.DataSource = DB.getLidtProduct();
            drdlProduct.DataValueField = "product_id";
            drdlProduct.DataTextField = "product_name";
            drdlProduct.DataBind();
        }
        void getProductEdit()
        {
            drdlProductEdit.DataSource = DB.getLidtProduct();
            drdlProductEdit.DataValueField = "product_id";
            drdlProductEdit.DataTextField = "product_name";
            drdlProductEdit.DataBind();
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
                        drdlProductEdit.Text = dt.Rows[0]["product_id"].ToString();
                        txtTotalMoneyEdit.Text = dt.Rows[0]["total_money"].ToString();
                        txtQuantityEdit.Text = dt.Rows[0]["quantity"].ToString();
                        txtNgayDatEdit.Text = dt.Rows[0]["orders_date"].ToString();
                        txtNameEdit.Text = dt.Rows[0]["customer_name"].ToString();
                        txtSDTEdit.Text = dt.Rows[0]["customer_phone"].ToString();
                        txtEmailEdit.Text = dt.Rows[0]["customer_email"].ToString();
                        txtAddressEdit.Text = dt.Rows[0]["customer_address"].ToString();
                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteOrder_Detail(Convert.ToInt32(e.CommandArgument.ToString()));
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


 



        //protected void cldNgaydat_SelectionChanged(object sender, EventArgs e)
        //{
        //    txtNgayDat.Text = cldNgaydat.SelectedDate.ToString("MM-dd-yyyy") + " " + DateTime.Now.ToString("hh:mm:ss");
        //}

        protected void cldNgayDatEdit_SelectionChanged(object sender, EventArgs e)
        {
            txtNgayDatEdit.Text = cldNgayDatEdit.SelectedDate.ToString("MM-dd-yyyy") ;
        }

        protected void updateOrder_Click1(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txtOderIDEdit.Text.Trim()) && !string.IsNullOrEmpty(txtNgayDatEdit.Text.Trim()) && !string.IsNullOrEmpty(txtNameEdit.Text.Trim()) && !string.IsNullOrEmpty(txtEmailEdit.Text.Trim()) && !string.IsNullOrEmpty(txtAddressEdit.Text.Trim()) && !string.IsNullOrEmpty(txtQuantityEdit.Text.Trim()) && !string.IsNullOrEmpty(txtSDTEdit.Text.Trim()) && !string.IsNullOrEmpty(txtTotalMoneyEdit.Text.Trim()))
            {
                if (DB.updateOrder(Convert.ToInt32(txtOderIDEdit.Text.Trim()), Convert.ToInt32(drlUserIDEdit.SelectedValue), Convert.ToInt32(drdlProductEdit.SelectedValue), float.Parse(txtTotalMoneyEdit.Text.Trim()), Convert.ToInt32(txtQuantityEdit.Text.Trim()), txtNgayDatEdit.Text.Trim(), txtNameEdit.Text.Trim(),txtSDTEdit.Text.Trim(), txtEmailEdit.Text.Trim(), txtAddressEdit.Text.Trim()))
                {
                    DataTable dtIDOrder_detail = (DataTable) DB.getIDOrder_DetailByOrderID(Convert.ToInt32(txtOderIDEdit.Text.Trim()));
                    DB.updateOrder_Detail(Convert.ToInt32(dtIDOrder_detail.Rows.Count - 1), Convert.ToInt32(drlUserIDEdit.SelectedValue), Convert.ToInt32(drdlProductEdit.SelectedValue));
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
                }
                
            }
        }

        protected void addNewOrder_Click1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNgayDat.Text.Trim()) && !string.IsNullOrEmpty(txtName.Text.Trim()) && !string.IsNullOrEmpty(txtEmail.Text.Trim()) && !string.IsNullOrEmpty(txtAddress.Text.Trim()) && !string.IsNullOrEmpty(txtQuantity.Text.Trim()) && !string.IsNullOrEmpty(txtSDT.Text.Trim()) && !string.IsNullOrEmpty(txtTotalMoney.Text.Trim()))
            {
                if (DB.themorder(Convert.ToInt32(drlUserID.SelectedValue), Convert.ToInt32(drdlProduct.SelectedValue), float.Parse(txtTotalMoneyEdit.Text.Trim()), Convert.ToInt32(txtQuantity.Text.Trim()), DateTime.Now.ToString(), txtName.Text.Trim(), txtSDT.Text.Trim(), txtEmail.Text.Trim(), txtAddress.Text.Trim()))
                {
                    DataTable dt = (DataTable) DB.getLidtOrder();
                    DB.themOrder_Dettail(Convert.ToInt32(dt.Rows.Count - 1), Convert.ToInt32(drdlProduct.SelectedValue));
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Bạn phải nhập đầy đủ các trường !');</script>");
                }
                
            }
        }

       
    }
}