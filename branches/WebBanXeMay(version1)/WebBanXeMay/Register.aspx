<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBanXeMay.Register" %>
<asp:Content ID="RegisterContent" ContentPlaceHolderID="Content" runat="server">
<div class="about">
  <div class="container">
      <div class="register">
		  	  <form> 
				 <div class="register-top-grid">
					<h3>THÔNG TIN ĐĂNG KÝ</h3>
					 <div>
						<span>Họ<label>*</label></span>
						<input type="text"> 
					 </div>
					 <div>
						<span>Tên<label>*</label></span>
						<input type="text"> 
					 </div>
					 <div>
						 <span>Địa chỉ Email<label>*</label></span>
						 <input type="text"> 
					 </div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
					   </a>
					 </div>
				     <div class="register-bottom-grid">
						    <h3>MẬT KHẨU ĐĂNG NHẬP</h3>
							 <div>
								<span>Mật khẩu<label>*</label></span>
								<input type="text">
							 </div>
							 <div>
								<span>Xác nhận mật khẩu<label>*</label></span>
								<input type="text">
							 </div>
							 <div class="clearfix"> </div>
					 </div>
                      <div class="clearfix"> </div>
                     <input type="submit" value="Đăng ký" style="background:red; padding:10px 20px; font-weight:bold; border:none; color:White">
				</form>
				
		   </div>
	</div>
</div>
</asp:Content>
