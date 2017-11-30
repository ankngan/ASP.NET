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
    public class ConectDB
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connect"].ConnectionString);
       
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
        public bool themUser(int UserId,string UserName, string UserAddress,int UserPhone, string UserEmail,string UserPass,int UserPer )
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Users values (@user_id, @user_name, @user_address, @user_phone, @user_email, @user_password, @user_permission)", conn);
                
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@user_id", UserId );
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
        public bool updateUser(int UserId, string UserName, string UserAddress, int UserPhone, string UserEmail, string UserPass, int UserPer)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Users set user_name = @User_name, user_address = @User_address, [user_phone] = @User_phone, user_email = @User_email, user_password = @User_pass, user_permission = @User_per where user_id = @User_id", conn);

                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@User_id", UserId);
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

    }
}