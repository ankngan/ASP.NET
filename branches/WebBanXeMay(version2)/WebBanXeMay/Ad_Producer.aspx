<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Producer.aspx.cs" Inherits="WebBanXeMay.Ad_Producer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
     <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Producer</h2>
        </div>
        <asp:MultiView ID="mulProducer" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">

                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="search" class="light-table-filter" data-table="order-table" id="myInput" placeholder=" Search for names.."/>
                        <p data-placement="top" data-toggle="tooltip" title="Add New">
                            <asp:LinkButton ID="linkAddNew" CssClass="btn btn-info btn-xs" runat="server" OnClick="linkAddNew_Click">Add New <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </p>
                    </div>
                </div>
                <asp:Repeater ID="rptProducer" runat="server" OnItemCommand="rptProducer_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class=" order-table table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Producer_ID</th>
                                    <th>Producer_Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("producer_id")%></td>
                                <td><%#Eval("producer_name")%></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("producer_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("producer_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                    </p>
                                </td>
                            </tr>
                            <!-- xong 1 hang -->
                        </tbody>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                <!-- het table -->
                    </FooterTemplate>
                </asp:Repeater>
            </asp:View>
            <asp:View ID="v2" runat="server">
                <h2 class="modal-title custom_align text-center" id="H2">Edit Detail</h2>

                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">ProducerId</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtProducerIdEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">ProducerName</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtProducerNameEdit" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="updateProducer" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateProducer_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
            </asp:View>
            <!--<asp:View ID="v3" runat="server">
                <h4 class="modal-title custom_align" id="H4">Delete this entry</h4>
                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete this Record?</div>
                <asp:LinkButton ID="btnYes" class="btn btn-success" CommandName ="yes" runat="server" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</asp:LinkButton>
                <asp:LinkButton ID="btnNo" class="btn btn-default" CommandName ="no" runat="server"><span class="glyphicon glyphicon-remove"></span>No</asp:LinkButton>
            </asp:View>-->
            <asp:View ID="v4" runat="server">
                <h2 class="modal-title custom_align text-center" id="H1">Add New Detail</h2>

               
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">ProducerName</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtProducerName" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="addNewProducer" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewProducer_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
