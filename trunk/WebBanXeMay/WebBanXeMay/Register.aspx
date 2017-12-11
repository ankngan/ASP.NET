<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBanXeMay.Register" %>
<asp:Content ID="RegisterContent" ContentPlaceHolderID="Content" runat="server">
    <div class="col-md-9 content_right">
<div class="about">
  <div class="container">
      <div class="register">
		  	  <%--<form runat="server">--%> 
				 <div class="register-top-grid">
					<h3>THÔNG TIN ĐĂNG KÝ</h3>
					 <div>
						<span>Họ và Tên<label>*</label></span>
                         <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                         <asp:Label ID="lblName" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
					 </div>
					 <div>
						<span>Tên tài khoản<label>*</label></span>
                         <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                         <asp:Label ID="lblUser" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
					 </div>
                     <div>
						<span>Địa chỉ<label>*</label></span>
                         <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
					 </div>
                     <div>
						<span>SĐT</span>
                         <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage='"Nhập đúng số điện thoại."' ControlToValidate="txtPhone" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
					 </div>
					 <div>
						 <span>Địa chỉ Email<label>*</label></span>
                         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                         <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                         <asp:RegularExpressionValidator id="RegularExpressionValidator2" ControlToValidate="txtEmail" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" /> 
					 </div>
					 <div class="clearfix"> </div>
                           <asp:CheckBox ID="ckbNewLetter" Text="Sign Up for Newsletter" runat="server" AutoPostBack="true" OnCheckedChanged="ckbNewLetter_CheckedChanged" />
				
					 </div>
				     <div class="register-bottom-grid">
						    <h3>MẬT KHẨU ĐĂNG NHẬP</h3>
							 <div>
								<span>Mật khẩu<label>*</label></span>
                                 <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                                 <asp:Label ID="lblPass" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
							 </div>
							 <div>
								<span>Xác nhận mật khẩu<label>*</label></span>
                                 <asp:TextBox ID="txtRePass" runat="server" TextMode="Password"></asp:TextBox>
							    <asp:Label ID="lblRePass" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                             </div>
							 <div class="clearfix"> </div>
					 </div>
                      <div class="clearfix"> </div>
                    <asp:LinkButton ID="lbtnDangKy" style="background:red; padding:10px 20px; font-weight:bold; border:none; color:White" runat="server" OnClick="lbtnDangKy_Click" Enabled="False">Đăng Ký</asp:LinkButton>
				<%--</form>--%>
				
		   </div>
	</div>
</div>
</div>
</asp:Content>
