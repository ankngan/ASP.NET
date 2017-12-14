<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Main_detail.aspx.cs" Inherits="WebBanXeMay.Ad_Main_detail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
      <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Main_detail</h2>
        </div>
        <asp:MultiView ID="mulMain_detail" runat="server" ActiveViewIndex="0">
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
                <asp:Repeater ID="rptMain_detail" runat="server" OnItemCommand="rptMain_detail_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="order-table table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Model</th>
                                    <th>Weight</th>
                                    <th>Size</th>
                                    <th>TankCapacity</th>
                                    <th>WarrantyPeriod</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("main_detail_id")%></td>
                                <td><%#Eval("model")%></td>
                                <td><%#Eval("weight")%></td>
                                <td><%#Eval("size")%></td>
                                <td><%#Eval("tank_capacity")%></td>
                                <td><%#Eval("warranty_period")%></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("main_detail_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("main_detail_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
                    <label for="inputId" class="col-sm-2 col-form-label">Main_detailId</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtMain_detailIdEdit" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Model</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtModelEdit" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">Weight</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtWeightEdit" runat="server" TextMode="Number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtWeightEdit" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Size</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtSizeEdit" runat="server" MaxLength="200"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">TankCapacity</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtTankCapacityEdit" runat="server" TextMode="Number" ></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtTankCapacityEdit" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">WarrantyPeriod</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtWarrantyPeriodEdit" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <asp:LinkButton ID="updateMain_detail" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateMain_detail_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
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
                    <label for="inputName" class="col-sm-2 col-form-label">Model</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtModel" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">Weight</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtWeight" runat="server" TextMode="Number" ></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtWeight" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Size</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtSize" runat="server" MaxLength="200"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">TankCapacity</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtTankCapacity" runat="server" TextMode="Number" ></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ErrorMessage="Chỉ được nhập số." ControlToValidate="txtTankCapacity" ForeColor="Red" ValidationExpression="\d+" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">WarrantyPeriod</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtWarrantyPeriod" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="addNewMain_detail" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewMain_detail_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
