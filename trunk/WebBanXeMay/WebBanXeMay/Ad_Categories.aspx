<
]\=]'/%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ad_Categories.aspx.cs" Inherits="WebBanXeMay.Categories" %>
?            </asp:View>-->
            <asp:View ID="v4" runat="server">
                <h2 class="modal-title custom_align text-center" id="H1">Thêm Chi tiết</h2>

                
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Loại xe</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="txtCategoriesName" runat="server" MaxLength="500"></asp:TextBox>
                    </div>
                </div>
                
                <asp:LinkButton ID="addNewCategories" CssClass="btn btn-warning btn-lg" runat="server" OnClick="addNewCategories_Click"><span class="glyphicon glyphicon-ok-sign"></span>Add</asp:LinkButton>
            </asp:View>

        </asp:MultiView>
    </div>
    <!-- het col-sm 10 -->
    <!-- hết nội dung-->
</asp:']
=-[]=\'=\[
9