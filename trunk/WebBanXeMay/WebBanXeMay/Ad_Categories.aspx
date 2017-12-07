<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Categories.aspx.cs" Inherits="WebBanXeMay.Categories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
    <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Categories</h2>
        </div>
        <asp:MultiView ID="mulCategories" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">

                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder=" Search for names.."/>
                        <p data-placement="top" data-toggle="tooltip" title="Add New">
                            <asp:LinkButton ID="linkAddNew" CssClass="btn btn-info btn-xs" runat="server" OnClick="linkAddNew_Click">Add New <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </p>
                    </div>
                </div>
                <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Loại xe</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("Categories_id")%></td>
                                <td><%#Eval("Categories_name")%></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("Categories_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("Categories_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                <h2 class="modal-title custom_align text-center" id="H2">Sửa chi tiết</h2>

                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtCategoriesIdEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Loại xe</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtCategoriesNameEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="updateCategories" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateCategories_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
            </asp:View>
            <!--<asp:View ID="v3" runat="server">
                <h4 class="modal-title custom_align" id="H4">Delete this entry</h4>
                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete this Record?</div>
                <asp:LinkButton ID="btnYes" class="btn btn-success" CommandName ="yes" runat="server" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</asp:LinkButton>
                <asp:LinkButton ID="btnNo" class="btn btn-default" CommandName ="no" runat="server"><span class="glyphicon glyphicon-remove"></span>No</asp:LinkButton>
            </asp:View>-->
            <asp:View ID="v4" runat="server">
                <h2 class="modal-title custom_align text-center" id="H1">Thêm Chi tiết</h2>

                
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Loại xe</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtCategoriesName" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="addNewCategories" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewCategories_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
