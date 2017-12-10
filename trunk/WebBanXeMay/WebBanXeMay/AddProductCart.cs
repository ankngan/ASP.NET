using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebBanXeMay
{
    public class AddProductCart
    {
        ConnectDB DB = new ConnectDB();
        static void ShoppingCart_Create()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PId", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Price", typeof(int));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("TotalMoney", typeof(float));
            System.Web.HttpContext.Current.Session["cart"] = dt;
        }
        public void Shoppping_AddCart(int PId, int Quantity)
        {
            if (System.Web.HttpContext.Current.Session["cart"] == null)
            {
                ShoppingCart_Create();
                Shoppping_AddCart(PId, Quantity);
            }
            else
            {
                DataTable dt = new DataTable();
                dt = DB.getDetailProductByID(PId);
                if (dt.Rows.Count > 0)
                {
                    string name = dt.Rows[0]["product_name"].ToString();
                    int price = Int32.Parse(dt.Rows[0]["product_price"].ToString());
                    float money = price * Quantity;

                    DataTable dtCart = new DataTable();
                    dtCart = (DataTable)System.Web.HttpContext.Current.Session["cart"];

                    bool hdInsert = false;

                    for (int i = 0; i < dtCart.Rows.Count; i++)
                    {

                        if (dtCart.Rows[i]["PId"].ToString() == PId.ToString())
                        {
                            hdInsert = true;
                            Quantity = Quantity + Convert.ToInt32(dtCart.Rows[i]["Quantity"].ToString());
                            dtCart.Rows[i]["Quantity"] = Quantity;
                            dtCart.Rows[i]["TotalMoney"] = Quantity * Int32.Parse(dtCart.Rows[i]["Price"].ToString());
                            System.Web.HttpContext.Current.Session["cart"] = dtCart;
                            break;
                        }
                    }
                    if (hdInsert == false)
                    {
                        if (dtCart != null)
                        {
                            DataRow dr = dtCart.NewRow();
                            dr["PId"] = PId;
                            dr["Name"] = name;
                            dr["Quantity"] = Quantity;
                            dr["Price"] = price;
                            dr["TotalMoney"] = money;
                            
                            dtCart.Rows.Add(dr);
                            System.Web.HttpContext.Current.Session["cart"] = dtCart;
                        }
                    }

                }
            }
        }

        public void ShoppingCart_Remove(int PId)
        {
            DataTable dtCart = new DataTable();
            dtCart = (DataTable)System.Web.HttpContext.Current.Session["cart"];
            for (int i = 0; i < dtCart .Rows.Count; i++)
            {
                if (dtCart.Rows[i]["PId"].ToString() == PId.ToString())
                {
                    dtCart.Rows.RemoveAt(i);
                    break;
                }
            }
            System.Web.HttpContext.Current.Session["cart"] = dtCart;
        }
    }
}