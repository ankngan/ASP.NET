<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Employer.aspx.cs" Inherits="WebBanXeMay.Ad_Employer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
    <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Employer</h2>
        </div>
        <asp:MultiView ID="mulEmployer" runat="server" ActiveViewIndex="0">
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
                <asp:Repeater ID="rptEmployer" runat="server" OnItemCommand="rptEmployer_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>Mã ID</th>
                                    <th>Tên</th>
                                     <th>Email</th>
                                    <th>SĐT</th>
                                    <th>Ảnh đại diện</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("employer_id")%></td>
                                <td><%#Eval("employer_name")%></td>
                                 <td><%#Eval("employer_email")%></td>
                                <td><%#Eval("employer_phone")%></td>
                                <td class="text-center">
                                    <img src="images/employers/<%#Eval("avatar")%>" style="width:100px;height:50px;"/></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("employer_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("employer_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                <asp:HiddenField ID="hdFImages" runat="server"/>
            </asp:View>
            <asp:View ID="v2" runat="server">
                <h2 class="modal-title custom_align text-center" id="H2">Sửa chi tiết</h2>

                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">Mã ID</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtIDEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNameEdit" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmailEdit" runat="server" MaxLength="500" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator2" ControlToValidate="txtEmailEdit" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" /> 
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">SĐT</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhoneEdit" runat="server" MaxLength="11" TextMode="Phone"></asp:TextBox>
                         <asp:RegularExpressionValidator id="RegularExpressionValidator1" ControlToValidate="txtPhoneEdit" Text='"Nhập đúng định dạng số điện thoại"' ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" Runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Ảnh đại diện</label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="flUpEmployerEdit" runat="server" />
                    </div>
                </div>
               
                <asp:LinkButton ID="updateEmployer" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateEmployer_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
            </asp:View>
            <!--<asp:View ID="v3" runat="server">
                <h4 class="modal-title custom_align" id="H4">Delete this entry</h4>
                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete this Record?</div>
                <asp:LinkButton ID="btnYes" class="btn btn-success" CommandName ="yes" runat="server" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</asp:LinkButton>
                <asp:LinkButton ID="btnNo" class="btn btn-default" CommandName ="no" runat="server"><span class="glyphicon glyphicon-remove"></span>No</asp:LinkButton>
            </asp:View>-->
            <asp:View ID="v4" runat="server">
                <h2 class="modal-title custom_align text-center" id="H1">Bảng thêm chi tiết</h2>

               
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" MaxLength="500" TextMode="Email"></asp:TextBox>
                         <asp:RegularExpressionValidator id="RegularExpressionValidator3" ControlToValidate="txtEmail" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" />

                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">SĐT</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" MaxLength="11" TextMode="Phone"></asp:TextBox>
                         <asp:RegularExpressionValidator id="RegularExpressionValidator4" ControlToValidate="txtPhone" Text='"Nhập đúng định dạng số điện thoại"' ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" Runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Ảnh đại diện</label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="flUpEmployer" runat="server" />
                    </div>
                </div>
               
                <asp:LinkButton ID="addNewEmployer" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewEmployer_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
