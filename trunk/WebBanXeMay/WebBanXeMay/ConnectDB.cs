using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Threading.Tasks;
namespace WebBanXeMay
{
    public class ConnectDB
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        //User 
        //Lấy ra danh sách user
        public DataTable getLidtUser()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Users", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra User theo ID 
        public DataTable getUserByID(int userId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where user_id =@UserID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@UserID", userId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm user vào database
        public bool themUser(string Name, string UserName, string UserAddress, int UserPhone, string UserEmail, string UserPass, int UserPer)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Users values (@name,@user_name, @user_address, @user_phone, @user_email, @user_password, @user_permission)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue("@user_name", UserName);
                cmd.Parameters.AddWithValue("@user_address", UserAddress);
                cmd.Parameters.AddWithValue("@user_phone", UserPhone);
                cmd.Parameters.AddWithValue("@user_email", UserEmail);
                cmd.Parameters.AddWithValue("@user_password", UserPass);
                cmd.Parameters.AddWithValue("@user_permission", UserPer);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua user vào database
        public bool updateUser(int UserId, string name, string UserName, string UserAddress, int UserPhone, string UserEmail, string UserPass, int UserPer)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Users set name = @Name, user_name = @User_name, user_address = @User_address, [user_phone] = @User_phone, user_email = @User_email, user_password = @User_pass, user_permission = @User_per where user_id = @User_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@User_id", UserId);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@User_name", UserName);
                cmd.Parameters.AddWithValue("@User_address", UserAddress);
                cmd.Parameters.AddWithValue("@User_phone", UserPhone);
                cmd.Parameters.AddWithValue("@User_email", UserEmail);
                cmd.Parameters.AddWithValue("@User_pass", UserPass);
                cmd.Parameters.AddWithValue("@User_per", UserPer);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteUser(int UserId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Users where user_id = @User_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@User_id", UserId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Product ..................................................................................
        //Lấy ra danh sách product
        public DataTable getLidtProduct()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Product", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy dòng xe theo id
        public DataTable getProductByMotoModel(int id)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadDongXe", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@motoId", id);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy dòng xe theo id
        public DataTable getProductsByProducer(int id)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadThuongHieu", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@producer_Id", id);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy dòng xe tay ga
        public DataTable getProductsByCategories(int id)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadByCategories", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cateID", id);
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }
        //Lấy ra Product theo ID 
        public DataTable getProductByID(int productId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Product where product_id =@ProductID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }
        //Get detail
        public DataTable getDetailProductByID(int productId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Product p, Main_detail m where p.main_detail_id=m.main_detail_id and  product_id =@ProductID", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Product theo key 
        public DataTable getProductByKeySearch(string key_search)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Product where product_name like '%' + @key_search + '%' ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@key_search", key_search);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm Product vào database
        public bool themProduct(int categoryID, int producerID, int mainDetailID, int motoModelID, string productName, string productImage, int productPrice, int productQuantity, string productDes, string productReView)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product values (@categories_id, @producer_id, @main_detail_id, @moto_model_id, @product_name, @product_image, @product_price, @product_quantity, @product_description, @product_review)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@categories_id", categoryID);
                cmd.Parameters.AddWithValue("@producer_id", producerID);
                cmd.Parameters.AddWithValue("@main_detail_id", mainDetailID);
                cmd.Parameters.AddWithValue("@moto_model_id", motoModelID);
                cmd.Parameters.AddWithValue("@product_name", productName);
                cmd.Parameters.AddWithValue("@product_image", productImage);
                cmd.Parameters.AddWithValue("@product_price", productPrice);
                cmd.Parameters.AddWithValue("@product_quantity", productQuantity);
                cmd.Parameters.AddWithValue("@product_description", productDes);
                cmd.Parameters.AddWithValue("@product_review", productReView);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua user vào database
        public bool updateProduct(int productId, int categoryID, int producerID, int mainDetailID, int motoModelID, string productName, string productImage, int productPrice, int productQuantity, string productDes, string productReView)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Product set  categories_id = @CategoriesID, producer_id = @ProducerID, main_detail_id = @MainDetailID, moto_model_id = @MotoModelID, product_name = @ProductName, product_image = @ProductImage, product_price = @ProductPrice, product_quantity = @ProductQuantity, product_description = @ProductDescription, product_review = @ProductReview where product_id = @ProductId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.Parameters.AddWithValue("@CategoriesID", categoryID);
                cmd.Parameters.AddWithValue("@ProducerID", producerID);
                cmd.Parameters.AddWithValue("@MainDetailID", mainDetailID);
                cmd.Parameters.AddWithValue("@MotoModelID", motoModelID);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@ProductImage", productImage);
                cmd.Parameters.AddWithValue("@ProductPrice", productPrice);
                cmd.Parameters.AddWithValue("@ProductQuantity", productQuantity);
                cmd.Parameters.AddWithValue("@ProductDescription", productDes);
                cmd.Parameters.AddWithValue("@ProductReview", productReView);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteProduct(int productId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Product where product_id = @ProductId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ProductId", productId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Producer ....................................................................
        //Lấy ra danh sách Producer
        public DataTable getLidtProducer()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Producer", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Producer theo ID 
        public DataTable getProducerByID(int producerId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Producer where producer_id =@ProducerID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@ProducerID", producerId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm producer vào database
        public bool themProducer(string producerName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Producer values (@producer_name)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@producer_name", producerName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua producer vào database
        public bool updateProducer(int producerId, string producerName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Producer set producer_name = @ProducerName where producer_id = @ProducerId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ProducerId", producerId);
                cmd.Parameters.AddWithValue("@ProducerName", producerName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteProducer(int producerId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Producer where producer_id = @ProducerId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ProducerId", producerId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }


        //Categories ...................................................................................................................................
        //Lấy ra danh sách Categories
        public DataTable getLidtCategories()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Categories", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Categories theo ID 
        public DataTable getCategoriesByID(int categoriesId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Categories where categories_id =@CategoriesID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@CategoriesID", categoriesId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm Categories vào database
        public bool themCategories(string categoriesName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Categories values ( @categories_name)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@categories_name", categoriesName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Categories vào database
        public bool updateCategories(int categoriesId, string categoriesName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Categories set categories_name = @CategoriesName where categories_id = @CategoriesId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@CategoriesId", categoriesId);
                cmd.Parameters.AddWithValue("@CategoriesName", categoriesName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteCategories(int categoriesId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Categories where categories_id = @CategoriesId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@CategoriesId", categoriesId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Moto_model .............................................................................................................................................
        //Lấy ra danh sách Moto_model
        public DataTable getLidtMoto_model()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Moto_model", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Moto_model theo ID 
        public DataTable getMoto_modelByID(int Moto_modelId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Moto_model where moto_model_id =@Moto_modelID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@Moto_modelID", Moto_modelId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm Moto_model vào database
        public bool themMoto_model( string Moto_modelName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Moto_model values (@Moto_model_name)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Moto_model_name", Moto_modelName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Moto_model vào database
        public bool updateMoto_model(int Moto_modelId, string Moto_modelName)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Moto_model set moto_model_name = @Moto_modelName where moto_model_id = @Moto_modelId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Moto_modelId", Moto_modelId);
                cmd.Parameters.AddWithValue("@Moto_modelName", Moto_modelName);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteMoto_model(int Moto_modelId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Moto_model where moto_model_id = @Moto_modelId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Moto_modelId", Moto_modelId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Main_deitail .............................................................................................................................
        //Lấy ra danh sách Main_detail
        public DataTable getLidtMain_detail()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Main_detail", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Categories theo ID 
        public DataTable getMain_detailByID(int Main_detailId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Main_detail where main_detail_id =@Main_detailID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@Main_detailID", Main_detailId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm Categories vào database
        public bool themMain_detail(string model, float weight, string size, float tankCapacity,string warrantyPeriod )
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Main_detail values (@model, @weight, @size, @tank_capacity, @warranty_period)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@model", model);
                cmd.Parameters.AddWithValue("@weight", weight);
                cmd.Parameters.AddWithValue("@size", size); cmd.Parameters.AddWithValue("@tank_capacity", tankCapacity);
                cmd.Parameters.AddWithValue("@warranty_period", warrantyPeriod);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Categories vào database
        public bool updateMain_detail(int main_detailId, string model, float weight, string size, float tankCapacity, string warrantyPeriod)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Main_detail set model = @Model, weight = @weight, size = @size, tank_capacity = @tankCapacity, warranty_period = @warrantyPeriod where main_detail_id = @mainDetailId", conn);

                cmd.Parameters.AddWithValue("@mainDetailId", main_detailId);
                cmd.Parameters.AddWithValue("@Model", model);
                cmd.Parameters.AddWithValue("@weight", weight);
                cmd.Parameters.AddWithValue("@size", size); cmd.Parameters.AddWithValue("@tankCapacity", tankCapacity);
                cmd.Parameters.AddWithValue("@warrantyPeriod", warrantyPeriod);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteMain_detail(int Main_detailId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Main_detail where main_detail_id = @Main_detailId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Main_detailId", Main_detailId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }


        //Employer ................................................................................................................................

        //Lấy ra danh sách Employer
        public DataTable getLidtEmployer()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Employer", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Employer theo ID 
        public DataTable getEmployerByID(int EmployerId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Employer where employer_id =@EmployerID ", conn);
                cmd.CommandType = CommandType.Text;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@EmployerID", EmployerId);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Thêm Employer vào database
        public bool themEmployer(string EmployerName, string EmployerEmail, int EmployerPhone, string Avatar)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Employer values (@employer_name, @employer_email, @employer_phone, @avatar)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@employer_name", EmployerName);
                cmd.Parameters.AddWithValue("@employer_email", EmployerEmail);
                cmd.Parameters.AddWithValue("@employer_phone", EmployerPhone);
                cmd.Parameters.AddWithValue("@avatar", Avatar);
 
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Employer vào database
        public bool updateEmployer(int EmployerId, string EmployerName, string EmployerEmail, int EmployerPhone, string Avatar)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Employer set employer_name = @Employer_name, employer_email = @Employer_email, employer_phone = @Employer_phone, avatar = @Avatar where employer_id = @Employer_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Employer_id", EmployerId);
                cmd.Parameters.AddWithValue("@Employer_name", EmployerName);
                cmd.Parameters.AddWithValue("@Employer_email", EmployerEmail);
                cmd.Parameters.AddWithValue("@Employer_phone", EmployerPhone);
                cmd.Parameters.AddWithValue("@Avatar", Avatar);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteEmployer(int EmployerId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Employer where employer_id = @Employer_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Employer_id", EmployerId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }


        


        //Order ................................................................................................................................................


        //Lấy ra danh sách Oder
        public DataTable getLidtOrder()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Order theo ID 
        public DataTable getOrderByID(int OrderID)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadOrderByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@ID", OrderID);
                adapter.Fill(dataTable);
                return dataTable;
                
            }

            finally
            {
                
                conn.Close();
               
            }
        }

        //thêm order vào database
        public bool themorder(int userid, int productID , int totalmoney, int quantity, DateTime order_date, string ctmName, int ctmPhone,string ctmEmail, string ctmAddress)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into orders values (@user_id,@product_id, @total_money, @quantity, @orders_date, @customer_name, @customer_phone, @customer_email, @customer_address)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@user_id",userid);
                cmd.Parameters.AddWithValue("@product_id", productID);
                cmd.Parameters.AddWithValue("@total_money", totalmoney);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@orders_date", order_date);
                cmd.Parameters.AddWithValue("@customer_name", ctmName);
                cmd.Parameters.AddWithValue("@customer_phone", ctmPhone);
                cmd.Parameters.AddWithValue("@customer_email", ctmEmail);
                cmd.Parameters.AddWithValue("@customer_address", ctmAddress);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Order vào database
        public bool updateOrder(int OrderID, int userid, int productID, int totalmoney, int quantity, string order_date, string ctmName, int ctmPhone, string ctmEmail, string ctmAddress)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Orders set user_id = @user_id,product_id = @product_id, total_money = @total_money, quantity = @quantity, orders_date = @orders_date, customer_name = @customer_name, customer_phone = @customer_phone, customer_email = @customer_email, customer_address = @customer_address where orders_id = @orders_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@orders_id", OrderID);
                cmd.Parameters.AddWithValue("@user_id", userid);
                cmd.Parameters.AddWithValue("@product_id", productID);
                cmd.Parameters.AddWithValue("@total_money", totalmoney);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@orders_date", order_date);
                cmd.Parameters.AddWithValue("@customer_name", ctmName);
                cmd.Parameters.AddWithValue("@customer_phone", ctmPhone);
                cmd.Parameters.AddWithValue("@customer_email", ctmEmail);
                cmd.Parameters.AddWithValue("@customer_address", ctmAddress);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteOrder(int OrderId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Orders where orders_id = @OrderId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@OrderId", OrderId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }


        //Order_Detail 
        //Lấy ra danh sách Oder_Detail
        public DataTable getLidtOrder_Detail()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadOrder_Detail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
                return dataTable;
            }

            finally
            {
                conn.Close();
            }
        }

        //Lấy ra Order_detail theo ID 
        public DataTable getOrder_DetailByID(int Order_DetailID)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("LoadOrder_DetailByID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dataTable = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@ID", Order_DetailID);
                adapter.Fill(dataTable);
                return dataTable;

            }

            finally
            {

                conn.Close();

            }
        }

        //thêm order vào database
        public bool themOrder_Dettail(int orderID, int productID)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into orders values (@orders_id,@product_id)", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@orders_id", orderID);
                cmd.Parameters.AddWithValue("@product_id", productID);
                
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Sua Order vào database
        public bool updateOrder_Detail(int order_DetailID, int orderId, int productID)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Orders set orders_id = @orders_id,product_id = @product_id where orders_detail_id = @orders_detail_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@orders_detail_id", order_DetailID);
                cmd.Parameters.AddWithValue("@orders_id", orderId);
                cmd.Parameters.AddWithValue("@product_id", productID);
                
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete theo id
        public bool deleteOrder_Detail(int Order_DetailId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Orders_detail where orders_id = @Order_detailId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Order_detailId", Order_DetailId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }
        //Delete Order detail bay OrderID
        public bool deleteOrder_DetailByOrderID(int OrderId)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Delete from Orders_detail OD, Orders O where O.orders_id = OD.orders_id and orders_id = @OrderId", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@OrderId", OrderId);
                if (cmd.ExecuteNonQuery() > 0)
                    return true;
                else
                    return
                        false;
            }
            finally
            {
                conn.Close();
            }
        }




        //phan trang....................................................................................................................................................................

        public static DataSet ThucThiStore_DataSet(string StoredProcedure, params SqlParameter[] Parameters)
        { //Khai báo cuỗi kết nối   
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            SqlCommand cmd = new SqlCommand(StoredProcedure, conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = cmd;

            if
             (Parameters != null)
            {
                cmd.Parameters.Clear();
                cmd.Parameters.AddRange(Parameters);
            }
            try
            {
                conn.Open();
                da.Fill(ds);
            }
            finally
            {
                // Đóng kết nối   
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Dispose();
            }
            return ds;

        }
        // do du liệu
        public DataSet StoreToDataSet(
        int currPage,
        int recodperpage,
        int Pagesize)
        {
            DataSet dts = new DataSet();
            SqlParameter[] arrParam = {
                new SqlParameter("@currPage", SqlDbType.Int),
                new SqlParameter("@recodperpage", SqlDbType.Int),
                new SqlParameter("@Pagesize", SqlDbType.Int)
                };
            arrParam[0].Value = currPage;
            arrParam[1].Value = recodperpage;
            arrParam[2].Value = Pagesize;
            return ThucThiStore_DataSet("PhanTrang", arrParam);
        }
      
       
    }
}