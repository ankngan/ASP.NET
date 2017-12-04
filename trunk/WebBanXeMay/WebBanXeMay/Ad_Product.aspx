<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Product.aspx.cs" Inherits="WebBanXeMay.Ad_Product" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ctplAdmin" runat="server">
     <!-- bắt đầu nội dung-->
    <div class="col-md-10 ">
        <div class="row">
            <h2 class="text-center">Product</h2>
        </div>
        <asp:MultiView ID="mulProduct" runat="server" ActiveViewIndex="0">
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
                <asp:Repeater ID="rptProduct" runat="server" OnItemCommand="rptProduct_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" >
                            <thead>
                                <tr>
                                    <th>Mã Sản Phẩm</th>
                                    <th>Loại Xe</th>
                                    <th>Thương hiệu</th>
                                    <th>Thông số</th>
                                    <th>Dòng Xe</th>
                                    <th>Tên</th>
                                    <th>Hình ảnh</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Miêu tả</th>
                                    <th>Giới thiệu</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("product_id")%></td>
                                <td><%#Eval("categories_id")%></td>
                                <td><%#Eval("producer_id")%></td>
                                <td><%#Eval("main_detail_id")%></td>
                                <td><%#Eval("moto_model_id")%></td>
                                 <td><%#Eval("product_name")%></td>
                                 <td class="text-center"><img src='images/products/<%#Eval("product_image")%>' style="width:200px; height:200px;"/></td>
                                <td><%#Eval("product_price")%></td>
                                <td><%#Eval("product_quantity")%></td>
                                <td><%#Eval("product_description")%></td>
                                <td><%#Eval("product_review")%></td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <asp:LinkButton CssClass="btn btn-primary btn-xs" ID="linkEdit" CommandName="Edit" CommandArgument='<%#Eval ("product_id") %>' runat="server" OnClick="linkEdit_Click"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                                    </p>
                                </td>
                                <td class="text-center">
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <asp:LinkButton CssClass="btn btn-danger btn-xs" ID="linkDelete" CommandName="Delete" CommandArgument='<%#Eval ("product_id") %>' runat="server" OnLoad="msg_Delete"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
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
               <asp:HiddenField ID="hdFImages" runat="server" />
                                   
            </asp:View>
            <asp:View ID="v2" runat="server">
                <h2 class="modal-title custom_align text-center" id="H2">Bảng Chi Tiết Sửa</h2>

                <div class="form-group row">
                    <label for="inputId" class="col-sm-2 col-form-label">Mã Sản Phẩm</label>
                    <div class="col-sm-10">
                       <asp:TextBox CssClass="form-control" ID="txtProductIDEdit" Enabled="false" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputCategories_ID" class="col-sm-2 col-form-label">Loại Xe</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlCateIDEdit" AutoPostBack="true" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputIDProducer" class="col-sm-2 col-form-label">Thương hiệu</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlIDProducerEdit" AutoPostBack="true" runat="server"></asp:DropDownList>
                    </div>
                </div>
                 <div class="form-group row">
                    <label for="inputMain_Detail_ID" class="col-sm-2 col-form-label">Thông số</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlMainDetailEdit" AutoPostBack="true" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputIDMoToModel" class="col-sm-2 col-form-label">Dòng Xe</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlMoToMoDelEdit" AutoPostBack="true" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtProductNameEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputProductImage" class="col-sm-2 col-form-label">Hình ảnh</label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="flUpImagesEdit" runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPrice" class="col-sm-2 col-form-label">Giá</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPriceEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputQuantity" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtQuantityEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputDescription" class="col-sm-2 col-form-label">Miêu tả</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtDescriptionEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputReview" class="col-sm-2 col-form-label">Giới thiệu</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtReviewEdit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <asp:LinkButton ID="updateProduct" CssClass="btn btn-warning btn-lg" runat="server" OnClick="updateProduct_Click"><span class="glyphicon glyphicon-ok-sign"></span>Update</asp:LinkButton>
            </asp:View>
            <!--<asp:View ID="v3" runat="server">
                <h4 class="modal-title custom_align" id="H4">Delete this entry</h4>
                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete this Record?</div>
                <asp:LinkButton ID="btnYes" class="btn btn-success" CommandName ="yes" runat="server" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</asp:LinkButton>
                <asp:LinkButton ID="btnNo" class="btn btn-default" CommandName ="no" runat="server"><span class="glyphicon glyphicon-remove"></span>No</asp:LinkButton>
            </asp:View>-->
            <asp:View ID="v4" runat="server">
                <h2 class="modal-title custom_align text-center" id="H1">Bảng chi tiết thêm</h2>

                 
                <div class="form-group row">
                    <label for="inputCategories_ID" class="col-sm-2 col-form-label">Loại Xe</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlCateID" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputIDProducer" class="col-sm-2 col-form-label">Thương hiệu</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlIDProducer" runat="server"></asp:DropDownList>
                    </div>
                </div>
                 <div class="form-group row">
                    <label for="inputMain_Detail_ID" class="col-sm-2 col-form-label">Thông số</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlMainDetail" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputIDMoToModel" class="col-sm-2 col-form-label">Dòng Xe</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control"  ID="drlMoToMoDel" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">Tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtProductName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputProductImage" class="col-sm-2 col-form-label">Hình ảnh</label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="flUpImages" runat="server" />
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPrice" class="col-sm-2 col-form-label">Giá</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputQuantity" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputDescription" class="col-sm-2 col-form-label">Miêu tả</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputReview" class="col-sm-2 col-form-label">Giới thiệu</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtReview" runat="server"></asp:TextBox>
                    </div>
                </div>
                <asp:LinkButton ID="addNewProduct" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewProduct_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add New</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:Content>
