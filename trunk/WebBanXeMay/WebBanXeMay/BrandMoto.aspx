<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="BrandMoto.aspx.cs" Inherits="WebBanXeMay.BrandMoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="col-md-9 content_right">
       

	    <div class="top_grid2">
        <asp:Label ID="lblTitle" CssClass= "hethang" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="RepeaterProducts" runat="server">
             <ItemTemplate>
	          <div class="col-md-4 top_grid1-box1"><a href="detail.aspx?id=<%#Eval("product_id")%>">
	     	    <div class="grid_1 hover_product">
	     	      <div class="image_product">
		            <img src="images/products/<%#Eval("product_image")%>" class="img-responsive" alt=""/> </div>
	     	      <div class="grid_2">
	     	  	    <p><%#Eval("product_name")%></p>
	     	  	    <ul class="grid_2-bottom">
	     	  		    <li class="grid_2-left"><p><%#Eval("product_price", "{0:0,000}")%><small>VND</small></p></li>
	     	  		    <li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Xem</div></li>
	     	  		    <div class="clearfix"> </div>
	     	  	    </ul>
	     	      </div>
	     	    </div>
	         </a></div>
             </ItemTemplate>
        </asp:Repeater>

	     <div class="clearfix"> </div>
	    </div> 
       </div>

</asp:Content>
