<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_User.aspx.cs" Inherits="WebBanXeMay.User" %>

<asp:Content ID="CtUser" ContentPlaceHolderID="ctplAdmin" runat="server">
    <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">User</h2>
        </div>
        <asp:MultiView ID="mulUser" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">

                <div class="search">
                    <div class="col-md-12">
                        <!-- <div class="btn btn-info" data-placement="top" data-toggle="tooltip" title="Add New" data-toggle="modal" data-target="#addNew">Add New</div> -->
                        <input type="search" class="light-table-filter" data-table="order-table" id="myInput"  placeholder=" Search for names.."/>
                        <p data-placement="top" data-toggle="tooltip" title="Add New">
                            <asp:LinkButton ID="linkAddNew" CssClass="btn btn-info btn-xs" runat="server" OnClick="linkAddNew_Click">Add New <span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </p>
                    </div>
                </div>
                <asp:Repeater ID="rptUser" runat="server" OnItemCommand="rptUser_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class=" order-table table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Tên người dùng</th>
                                    <th>Địa chỉ</th>
                                    <th>SĐT</th>
                                    <th>Email</th>
                                    <th>Mật khẩu</th>
                                    <th>Trạng thái</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("user_id")%></td>
                                <td><%#Eval("name")%></td>
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
                    <label for="inputName" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNameEdit" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Tên người dùng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtUserNameEdit" runat="server" MaxLength="100"></asp:TextBox>
                        <asp:Label ID="lblUserEdit" runat="server" Text="" ForeColor="Red" Visible ="false"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAddress" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddressEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">SĐT</label>

                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhoneEdit" runat="server" TextMode="Phone" MaxLength="11"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage="Nhập đúng số điện thoại." ControlToValidate="txtPhoneEdit" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmailEdit" runat="server" MaxLength="100"></asp:TextBox>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator2" ControlToValidate="txtEmailEdit" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" /> 
                        <asp:Label ID="lblEmailEdit" runat="server" Text="" ForeColor="Red" Visible ="false"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Mật khẩu</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPassEdit" runat="server" MaxLength="32" ></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPer" class="col-sm-2 col-form-label">Trạng thái</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPerEdit" runat="server" MaxLength="1" TextMode="Number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"  ErrorMessage="Trạng thái chỉ có 1 và 0." ControlToValidate="txtPerEdit" ForeColor="Red" ValidationExpression="^[0-1]{1}$"/>
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
                    <label for="inputPassword" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                    
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Tên người dùng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtUserName" runat="server" MaxLength="100"></asp:TextBox>
                        <asp:Label ID="lblUser" runat="server" Text="" ForeColor="Red" Visible ="false"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">SĐT</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" MaxLength="11"></asp:TextBox>
	                    <asp:RegularExpressionValidator ID="rdvPhone" runat="server"  ErrorMessage="Nhập đúng số điện thoại." ControlToValidate="txtPhone" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" /> 
                        <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="Red" Visible ="false"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Mật khẩu</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" TextMode="Password" MaxLength="32"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Trạng thái</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPer" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Trạng thái chỉ có 1 và 0." ControlToValidate="txtPer" ForeColor="Red" ValidationExpression="^[0-1]{1}$"/>
                    </div>
                </div>
                <asp:LinkButton ID="addNewUser" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewUser_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>
            
        </asp:MultiView>
        <asp:HiddenField ID="hdUser" runat="server" />
        <asp:HiddenField ID="hdEmail" runat="server" />
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>

