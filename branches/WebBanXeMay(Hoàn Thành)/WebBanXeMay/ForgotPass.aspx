<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="WebBanXeMay.ForgotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="col-md-9 content_right">
        <div class="about">
            <div class="container">
                <div class="register">
                    <form runat="server">
                        <div class="register-top-grid">
                            <asp:MultiView ID="mtvForGotPass" runat="server" ActiveViewIndex ="0">
                                <asp:View ID="v1" runat="server">
                                    <h3 class="title_register">Nhập Email bạn muốn lấy lại mật khẩu</h3>
                                    <div>
                                        <span>Email:
                                            <label>*</label></span>
                                        <asp:TextBox ID="txtEmailForGot" runat="server"></asp:TextBox>
                                        <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                                    </div>
                                    <div class="clearfix"></div>
                                    <asp:LinkButton ID="lbtnSend" Style="background: red; padding: 10px 20px; font-weight: bold; border: none; color: White" runat="server" OnClick="lbtnSend_Click" >Send</asp:LinkButton>

                                </asp:View>
                                <asp:View ID="v2" runat="server">
                                    <h3 class="title_register">Thông Báo</h3>
                                    <div>
                                        
                                        <asp:Label ID="lblCheckMail" runat="server" ForeColor="Black" Text=""></asp:Label>
                                    </div>
                                    <div class="clearfix"></div>
                                    <asp:LinkButton ID="LbtnCheckMail" Style="background: red; padding: 10px 20px; font-weight: bold; border: none; color: white" runat="server" OnClick="LbtnCheckMail_Click" >Kiểm tra Email</asp:LinkButton>

                                </asp:View>
                            </asp:MultiView>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
