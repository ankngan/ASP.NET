<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBanXeMay.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="col-md-9 content_right">
        <div class="about">
            <div class="container">
                <div class="register">
                    <div class="loginmodal-container">
                        <h1>Đăng nhập </h1>
                        <br>
                        <%--<form runat="server">--%>
                            <div>
                                <span>Tên đăng nhập or Email<label>*</label></span>
                                <asp:TextBox ID="txtUser" runat="server" ></asp:TextBox>
                                <asp:Label ID="lblUser" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                            </div>
                            <div>
                                <span>Mật khẩu<label>*</label></span>
                                <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblPass" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                                
                            <asp:LinkButton ID="lbtnDangNhap" Style="background: #df1f26; padding: 10px 20px; font-weight: bold; border: none; color: White" runat="server" OnClick="lbtnDangNhap_Click">Đăng Nhập</asp:LinkButton>
                        <%--</form>--%>

                        <div class="login-help">
                            <a href="register.aspx" class ="dangKy">Đăng ký</a> - <a href="ForGotPass.aspx" class="forgotPass">Quên mật khẩu ? </a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                        </div>
                    </div>
            </div>
        </div>
    </div>



</asp:Content>
