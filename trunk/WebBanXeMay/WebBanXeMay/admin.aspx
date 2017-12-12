<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebBanXeMay.Ad_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/admin_login_form.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     <div class="login-page">
        <div class="form">
        <form class="login-form">
          <asp:TextBox ID="txtUser" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox>
          <asp:Label ID="lblUser" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
          <div class="blank-space"></div>
          <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Nhập mật khẩu"></asp:TextBox>
          <asp:Label ID="lblPass" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            <div class="blank-space"></div>
          <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click" Style="background:#4CAF50"/></div>
        </form>
  </div>
</div>

    </div>
    </form>
</body>
</html>
