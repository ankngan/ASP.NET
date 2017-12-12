<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebBanXeMay.Cart" %>

<asp:Content ID="DetailContent" ContentPlaceHolderID="Content" runat="server">
    <%--<form runat="server">--%>
    <div class="col-md-9 content_right">
        <div class="top_grid2">
            <section id="cart_items" style="margin-top: 20px">
                <div class="container">

                    <div class="table-responsive cart_info">


                       
                                <table class="table table-condensed">
                                    <thead>
                                        <tr class="cart_menu">
                                            <th class="image" style="padding-bottom: 12px;">Sản phẩm</th>
                                            <%--<th>Mã sản phẩm</th>--%>
                                            <th class="description" style="padding-bottom: 12px;">Tên sản phẩm</th>
                                            <th class="quantity" style="padding-bottom: 12px;">Số lượng</th>
                                            <th class="price" style="padding-bottom: 12px;">Giá</th>
                                            <th class="total" style="padding-bottom: 12px;">Tổng tiền</th>
                                            <th class="total" style="padding-bottom: 12px;">Xóa</th>
                                            
                                        </tr>
                                    </thead>
                                    
                                    <asp:Repeater ID="rptProductCart" OnItemCommand="rptProductCart_ItemCommand" runat="server">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td><a href="Detail.aspx?id=<%#Eval("PId") %>"><img src="images/products/<%#Eval("Image")%>" style="width:100px; height:100px;"/></a></td>
                                                    <td><%#Eval("Name")%></td>
                                                    <td><%#Eval("Quantity") %></td>
                                                    <td><%# string.Format("{0:N0}",Eval("Price")) %></td>
                                                    <td><%# string.Format("{0:N0}",Eval("TotalMoney")) %></td>
                                                    <td class="cart_delete">
                                                        <asp:LinkButton ID="lbtnXoa" CssClass="cart_quantity_delete" ForeColor="Black"  runat="server" OnLoad="msg_Delete" CommandName="Xoa" CommandArgument=<%#Eval("PId") %> >Xóa</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                        
                            </table>

                    </div>
                    <div style="color:red; font-weight:bold; text-align:left ">
                        <span>Tổng tiền: </span><asp:Literal ID="ltTotal" Text="" runat="server" /></div>
                    <asp:LinkButton ID="lbtnThanhToan" CssClass="button_thanhtoan" runat="server" OnClick="lbtnThanhToan_Click">Thanh toán</asp:LinkButton>
                </div>

            </section>
        </div>
    </div>
    <%--</form>--%>
</asp:Content>
