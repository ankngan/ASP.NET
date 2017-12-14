<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Contact.aspx.cs" Inherits="WebBanXeMay.Ad_Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Contact</h2>
        </div>
                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="search" class="light-table-filter" data-table="order-table" id="myInput"  placeholder=" Search for names.."/>
                        
                    </div>
                </div>
                <asp:Repeater ID="rptContact" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="order-table table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>Mã phản hồi</th>
                                    <th>Tên người gửi</th>
                                    <th>Email</th>
                                    <th>Nội dung</th>
                                     
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("id")%></td>
                                <td><%#Eval("name")%></td>
                                <td><%#Eval("email")%></td>
                                <td><%#Eval("noidung")%></td>
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
