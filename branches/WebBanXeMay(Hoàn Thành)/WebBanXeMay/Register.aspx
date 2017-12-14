<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBanXeMay.Register" %>
<asp:Content ID="RegisterContent" ContentPlaceHolderID="Content" runat="server">
    <div class="col-md-9 content_right">
<div class="about">
  <div class="container">
      <div class="register">
				 <div class="register-top-grid">
					<h3>THÔNG TIN ĐĂNG KÝ</h3>
					 <div>
                         <asp:GridView ID="GVuser" runat="server"></asp:GridView>
						<span>Họ và Tên<label>*</label></span>
                         <asp:TextBox ID="txtNameRef" runat="server" MaxLength="50"></asp:TextBox>
                         <asp:Label ID="lblNameRef" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
					 </div>
					 <div>
						<span>Tên tài khoản<label>*</label></span>
                         <asp:TextBox ID="txtUserNameRef" runat="server" MaxLength="100"></asp:TextBox>
                         <asp:Label ID="lblUserRef" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
					 </div>
                     <div>
						<span>Địa chỉ<label>*</label></span>
                         <asp:TextBox ID="txtAddressRef" runat="server" MaxLength="500"></asp:TextBox>
					 </div>
                     <div>
						<span>SĐT</span>
                         <asp:TextBox ID="txtPhoneRef" runat="server" MaxLength="11"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage='"Nhập đúng số điện thoại."' ControlToValidate="txtPhoneRef" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
					 </div>
					 <div>
						 <span>Địa chỉ Email<label>*</label></span>
                         <asp:TextBox ID="txtEmailRef" runat="server" MaxLength="100"></asp:TextBox>
                         <asp:Label ID="lblEmailRef" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                         <asp:RegularExpressionValidator id="RegularExpressionValidator2" ControlToValidate="txtEmailRef" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" /> 
					 </div>
					 <div class="clearfix"> </div>
                           <asp:CheckBox ID="ckbNewLetter" Text="Sign Up for Newsletter" runat="server" AutoPostBack="true" OnCheckedChanged="ckbNewLetter_CheckedChanged" />
				
					 </div>
				     <div class="register-bottom-grid">
						    <h3>MẬT KHẨU ĐĂNG NHẬP</h3>
							 <div>
								<span>Mật khẩu<label>*</label></span>
                                 <asp:TextBox ID="txtPassRef" runat="server" TextMode="Password" MaxLength="32"></asp:TextBox>
                                 <asp:Label ID="lblPassRef" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
							 </div>
							 <div>
								<span>Xác nhận mật khẩu<label>*</label></span>
                                 <asp:TextBox ID="txtRePass" runat="server" TextMode="Password" MaxLength="32"></asp:TextBox>
							    <asp:Label ID="lblRePass" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                             </div>
							 <div class="clearfix"> </div>
					 </div>
                      <div class="clearfix"> </div>
                    <asp:LinkButton ID="lbtnDangKy" style="background:red; padding:10px 20px; font-weight:bold; border:none; color:White" runat="server" OnClick="lbtnDangKy_Click" Enabled="False">Đăng Ký</asp:LinkButton>
				
		   </div>
	</div>
</div>
</div>
</asp:Content>
