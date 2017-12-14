<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_OrderDetail.aspx.cs" Inherits="WebBanXeMay.Ad_OrderDetail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Order</h2>
        </div>
                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="search" class="light-table-filter" data-table="order-table" id="myInput"  placeholder=" Search for names.."/>
                        
                    </div>
                </div>
                <asp:Repeater ID="rptOrderDetail" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="order-table table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng chi tiết</th>
                                    <th>Mã đơn hàng</th>
                                    <th>Mã sản phẩm</th>
                                     
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("orders_detail_id")%></td>
                                <td><%#Eval("orders_id")%></td>
                                <td><%#Eval("product_id")%></td>
                             
                            </tr>
                            <!-- xong 1 hang -->
                        </tbody>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                        </FooterTemplate>
                </asp:Repeater>
         </div>
</asp:Content>
