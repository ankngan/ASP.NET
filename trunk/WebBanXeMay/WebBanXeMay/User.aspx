<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebBanXeMay.User" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">User</h2>
        </div>
        <asp:MultiView ID="mulUser" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">

                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder=" Search for names..">
                        <p data-placement="top" data-toggle="tooltip" title="Add New">
                            <asp:LinkButton ID="linkAddNew" CssClass="btn btn-info btn-xs" runat="server" OnClick="linkAddNew_Click">Add New <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </p>
                    </div>
                </div>
                <asp:Repeater ID="rptUser" runat="server" OnItemCommand="rptUser_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Permission</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("user_id")%></td>
                                <td><%#Eval("user_name")%></td>
                                <td><%#Eval("user_address")%></td>
                                <td><%#Eval("user_phone")%></td>
                                <td><%#Eval("user_email")%></td>
                                <td><%#Eval("user_password")%></td>
                                <td><%#Eval("user_permission")%></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("user_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("user_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                    <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtIDEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNameEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddressEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhoneEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmailEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPassEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPer" class="col-sm-2 col-form-label">Permission</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPerEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <asp:LinkButton ID="updateUser" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateUser_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
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
                    <label for="inputPassword" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtID" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Address</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Phone</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPass" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Permission</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPer" runat="server"></asp:TextBox>
                    </div>
                </div>
                <asp:LinkButton ID="addNewUser" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewUser_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
</asp:Content>

