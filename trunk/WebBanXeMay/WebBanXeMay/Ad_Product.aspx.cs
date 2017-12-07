using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

namespace WebBanXeMay
{
    public partial class Ad_Product : System.Web.UI.Page
    {
        ConnectDB DB = new ConnectDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProduct();
                LoadCate();
                LoadCateEdit();
                LoadProducer();
                LoadProducerEdit();
                LoadMainDetail();
                LoadMainDetailEdit();
                LoadMoToMoDel();
                LoadMotoMoDelEdit();
            }

        }
        protected void msg_Delete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn muốn có xóa sản phẩm này?')";
        }

        protected void linkAddNew_Click(object sender, EventArgs e)
        {
            mulProduct.ActiveViewIndex = 3;
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            mulProduct.ActiveViewIndex = 1;

        }

        //Load categories
        void LoadCate()
        {
            drlCateID.DataSource = DB.getLidtCategories();
            drlCateID.DataValueField = "categories_id";
            drlCateID.DataTextField = "categories_name";
            drlCateID.DataBind();
        }
        void LoadCateEdit()
        {
            drlCateIDEdit.DataSource = DB.getLidtCategories();
            drlCateIDEdit.DataValueField = "categories_id";
            drlCateIDEdit.DataTextField = "categories_name";
            drlCateIDEdit.DataBind();
        }

        //Load Producer
        void LoadProducer()
        {
            drlIDProducer.DataSource = DB.getLidtProducer();
            drlIDProducer.DataValueField = "producer_id";
            drlIDProducer.DataTextField = "producer_name";
            drlIDProducer.DataBind();
        }
        void LoadProducerEdit()
        {
            drlIDProducerEdit.DataSource = DB.getLidtProducer();
            drlIDProducerEdit.DataValueField = "producer_id";
            drlIDProducerEdit.DataTextField = "producer_name";
            drlIDProducerEdit.DataBind();
        }

        //Load MainDetail
        void LoadMainDetail()
        {
            drlMainDetail.DataSource = DB.getLidtMain_detail();
            drlMainDetail.DataValueField = "main_detail_id";
            drlMainDetail.DataTextField = "model";
            drlMainDetail.DataBind();
        }
        void LoadMainDetailEdit()
        {
            drlMainDetailEdit.DataSource = DB.getLidtMain_detail();
            drlMainDetailEdit.DataValueField = "main_detail_id";
            drlMainDetailEdit.DataTextField = "model";
            drlMainDetailEdit.DataBind();
        }

        //Load MotoModel
        void LoadMoToMoDel()
        {
            drlMoToMoDel.DataSource = DB.getLidtMoto_model();
            drlMoToMoDel.DataValueField = "moto_model_id";
            drlMoToMoDel.DataTextField = "moto_model_name";
            drlMoToMoDel.DataBind();
        }
        void LoadMotoMoDelEdit()
        {
            drlMoToMoDelEdit.DataSource = DB.getLidtMoto_model();
            drlMoToMoDelEdit.DataValueField = "moto_model_id";
            drlMoToMoDelEdit.DataTextField = "moto_model_name";
            drlMoToMoDelEdit.DataBind();
        }
        //protected void linkDelete_Click(object sender, EventArgs e)
        //{
        //   mulProduct.ActiveViewIndex = 2;
        //}
        
        void LoadProduct()
        {
            rptProduct.DataSource = DB.getLidtProduct();
            rptProduct.DataBind();
        }
        protected void rptProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            switch (e.CommandName.ToString())
            {
                case "Edit":

                    dt = DB.getProductByID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtProductIDEdit.Text = dt.Rows[0]["product_id"].ToString();
                        drlCateIDEdit.Text = dt.Rows[0]["categories_id"].ToString();
                        drlIDProducerEdit.Text = dt.Rows[0]["producer_id"].ToString();
                        drlMainDetailEdit.Text = dt.Rows[0]["main_detail_id"].ToString();
                        drlMoToMoDelEdit.Text = dt.Rows[0]["moto_model_id"].ToString();
                        txtProductNameEdit.Text = dt.Rows[0]["product_name"].ToString();
                        hdFImages.Value = dt.Rows[0]["product_image"].ToString();
                        txtPriceEdit.Text = dt.Rows[0]["product_price"].ToString();
                        txtQuantityEdit.Text = dt.Rows[0]["product_quantity"].ToString();
                        txtDescriptionEdit.Text = dt.Rows[0]["product_description"].ToString();
                        txtReviewEdit.Text = dt.Rows[0]["product_review"].ToString();
                    }
                    break;
                case "Delete":
                    //if (e.CommandName.ToString() == "yes")
                    //{
                    DB.deleteProduct(int.Parse(e.CommandArgument.ToString()));
                    Response.Redirect(Request.Url.ToString());
                    //}
                    //else if(e.CommandName.ToString() == "no") 
                    //{
                    //   Response.Redirect("Product.aspx");
                    //}
                    break;
            }
        }

        protected void addNewProduct_Click(object sender, EventArgs e)
        {
            string file = UploadImage(flUpImages);
            if (!file.Equals(""))
            {
                if (!string.IsNullOrEmpty(drlCateID.Text.Trim()))
                {
                    DB.themProduct(Int32.Parse(drlCateID.Text.Trim()), Int32.Parse(drlIDProducer.Text.Trim()), Int32.Parse(drlMainDetail.Text.Trim()), Int32.Parse(drlMoToMoDel.Text.Trim()), txtProductName.Text.Trim(), file, Int32.Parse(txtPrice.Text.Trim()), Int32.Parse(txtQuantity.Text.Trim()), txtDescription.Text.Trim(), txtReview.Text.Trim());
                    Response.Redirect(Request.Url.ToString());
                }
            }
            else {
                string message = "<script language=javascript>alert('Bạn chưa chọn hình ảnh!');</script>";
                Response.Write(message);
            }
            
        }

        protected void updateProduct_Click(object sender, EventArgs e)
        {
            string file = UploadImage(flUpImagesEdit);
            if (file.Equals(""))
                {
                    file = hdFImages.Value;
                    if (File.Exists(Server.MapPath("~/images/products/"+hdFImages.Value)) == true)
                    {
                        file = hdFImages.Value;
                    }
                }
            
            
            if (!string.IsNullOrEmpty(txtProductIDEdit.Text.Trim()))
            {
                DB.updateProduct(Int32.Parse(txtProductIDEdit.Text.Trim()), Int32.Parse(drlCateIDEdit.Text.Trim()), Int32.Parse(drlIDProducerEdit.Text.Trim()), Int32.Parse(drlMainDetailEdit.Text.Trim()), Int32.Parse(drlMoToMoDelEdit.Text.Trim()), txtProductNameEdit.Text.Trim(), file, Int32.Parse(txtPriceEdit.Text.Trim()), Int32.Parse(txtQuantityEdit.Text.Trim()), txtDescriptionEdit.Text.Trim(), txtReviewEdit.Text.Trim());
                Response.Redirect(Request.Url.ToString());
            }
        }

        //upload images
        public string UploadImage(FileUpload value) {
            string typeFile = "";
            string file = "";
            if (value.FileName.Length > 0)
            {
                if (value.PostedFile.ContentLength < 5000000)
                {
                    if (value.PostedFile.ContentType.Equals("image/jpeg") || value.PostedFile.ContentType.Equals("image/png") || value.PostedFile.ContentType.Equals("image/gif"))
                    {
                        typeFile = Path.GetExtension(value.FileName).ToLower();
                        file = Path.GetFileName(value.PostedFile.FileName);
                        //file = value.FileName.Replace(file,file+typeFile);
                        value.PostedFile.SaveAs(Server.MapPath("~/images/products/") + file);
                    }
                }
            }
            return file;
        }
    }
}