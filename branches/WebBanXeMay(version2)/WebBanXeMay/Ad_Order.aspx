<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Order.aspx.cs" Inherits="WebBanXeMay.Ad_Order" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
    <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Order</h2>
        </div>
        <asp:MultiView ID="mulOrder" runat="server" ActiveViewIndex="0">
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
                <asp:Repeater ID="rptOrder" runat="server" OnItemCommand="rptOrder_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="order-table table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Mã người dùng</th>
                                    <th>Mã sản phẩm</th>
                                     <th>Tổng tiền</th>
                                    <th>Số lượng</th>
                                    <th>Ngày đặt</th>
                                    <th>Tên khách hàng</th>
                                     <th>SĐT</th>
                                     <th>Email</th>
                                     <th>Địa chỉ</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("orders_id")%></td>
                                <td><%#Eval("user_id")%></td>
                                <td><%#Eval("product_id")%></td>
                                 <td><%#Eval("total_money")%></td>
                                <td><%#Eval("quantity")%></td>
                                <td><%#Eval("orders_date")%></td>
                                <td><%#Eval("customer_name")%></td>
                                <td><%#Eval("customer_phone")%></td>
                                <td><%#Eval("customer_email")%></td>
                                <td><%#Eval("customer_address")%></td>
                                
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("orders_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("orders_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                    <label for="inputId" class="col-sm-2 col-form-label">Mã đơn hàng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtOderIDEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Mã người dùng</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="drlUserIDEdit" runat="server"></asp:DropDownList>
                    </div>
                </div>
                 <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Mã sản phẩm</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="drdlProductEdit" runat="server"></asp:DropDownList>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Tổng tiền</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtTotalMoneyEdit" runat="server" TextMode="Number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtTotalMoneyEdit" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtQuantityEdit" runat="server" TextMode="Number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtQuantityEdit" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Ngày đặt hàng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNgayDatEdit" runat="server" ></asp:TextBox>
                        <asp:Calendar ID="cldNgayDatEdit" runat="server" OnSelectionChanged="cldNgayDatEdit_SelectionChanged"></asp:Calendar>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Tên khách hàng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNameEdit" runat="server" MaxLength="50"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Số điện thoại</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtSDTEdit" runat="server" MaxLength="11" TextMode="Phone"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"  ErrorMessage="Nhập đúng số điện thoại." ControlToValidate="txtSDTEdit" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmailEdit" runat="server" MaxLength="50" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator8" ControlToValidate="txtEmailEdit" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddressEdit" runat="server" MaxLength="200"></asp:TextBox>
                        
                    </div>
                </div>
                <asp:LinkButton ID="updateOrder" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateOrder_Click1" ><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
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
                    <label for="inputName" class="col-sm-2 col-form-label">Mã người dùng</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="drlUserID" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Mã sản phẩm</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="drdlProduct" runat="server"></asp:DropDownList>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Tổng tiền</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtTotalMoney" runat="server" TextMode="Number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtTotalMoney" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server" TextMode="Number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtQuantity" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Ngày đặt hàng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtNgayDat" runat="server" Enabled="true" ></asp:TextBox>
                        <%--<asp:Calendar ID="cldNgaydat" runat="server" OnSelectionChanged="cldNgaydat_SelectionChanged"></asp:Calendar>--%>
                    </div>
                </div>
               <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Tên khách hàng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Số điện thoại</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtSDT" runat="server" MaxLength="11" TextMode="Phone"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"  ErrorMessage="Nhập đúng số điện thoại." ControlToValidate="txtSDT" ForeColor="Red" ValidationExpression="^[0-9]{6,11}$" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" MaxLength="50" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator6" ControlToValidate="txtEmail" Text='"Nhập đúng định dạng email"' ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" MaxLength="200"></asp:TextBox>
                        
                    </div>
                <asp:LinkButton ID="addNewOrder" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewOrder_Click1" ><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
