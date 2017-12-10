<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebBanXeMay.Order" %>
<asp:Content ID="DetailContent" ContentPlaceHolderID="Content" runat="server">
    <form  runat="server">

    
       <asp:Repeater ID="RepeaterProduct" runat="server">
       <ItemTemplate>
	   <div class="col-md-9 single_right">
	   	<div class="single_top">
	       <div class="single_grid">
				<div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a href="#">
									<%--<img class="etalage_thumb_image" src="images/products/<%#Eval("product_image")%>" class="img-responsive" />--%>
									<img class="etalage_source_image img-responsive" style="width:100%;" src="images/products/<%#Eval("product_image")%>"  />
								</a>
							</li>
						</ul>
						 <div class="clearfix"></div>		
				  </div> 
				  <div class="desc1 span_3_of_2">
				  	<h1><%#Eval("product_name")%></h1>

			    <div class="price_single">
				  <span>Giá chính hãng: <%#Eval("product_price","{0:0,000}")%> VND</span>
				</div>

				<h2 class="quick">Mô tả:</h2>
				<p class="quick_desc"><%#Eval("product_description")%></p>

				<div class="quantity_box">
					<ul class="product-qty">
					   <div>
						<span>Số Lượng<label>*</label></span>
                         <asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox>
                         <asp:Label ID="lblSoLuong" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
					 </div>
					   
				    </ul>
				    <ul class="single_social">
						<li><a href="#"><i class="fb1"> </i> </a></li>
						<li><a href="#"><i class="tw1"> </i> </a></li>
						<li><a href="#"><i class="g1"> </i> </a></li>
						<li><a href="#"><i class="linked"> </i> </a></li>
		   		    </ul>
		   		    <div class="clearfix"></div>
	   		    </div>
                     
                      <asp:LinkButton CssClass="btn bt1 btn-primary btn-normal btn-inline "  ID="lbtnAddToCart" runat="server" OnClick="lbtnAddToCart_Click">Thêm vào giỏ</asp:LinkButton>
                      <asp:LinkButton ID="lbtnThanhToan" CssClass="btn bt1 btn-primary btn-normal btn-inline" runat="server">Thanh toán</asp:LinkButton>               
			    </div>
         
		    <div class="clearfix"> </div>
				</div>
          	    <div class="clearfix"></div>
          </div>
          <div class="sap_tabs">	
				     <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Mô tả sản phẩm</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Đặt điểm chính</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Đánh giá sản phẩm</span></li>
							  <div class="clear"></div>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class="facts">
									  <ul class="tab_list">
									  	<li><%#Eval("product_description")%></li>
									  </ul>           
							        </div>
							     </div>	

							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<div class="facts">
									  <ul class="tab_list">
									    <li>Dòng xe: <%#Eval("model")%></li>
									    <li>Trọng lượng: <%#Eval("weight")%> KG</li>
                                        <li>Kích thước (dài x rộng x cao): <%#Eval("size")%></li>
                                        <li>Dung tích bình xăng: <%#Eval("tank_capacity")%> Lít</li>
                                        <li>Thời gian bảo hành: <%#Eval("warranty_period")%> Năm</li>		
									  </ul>           
							        </div>
							     </div>	
							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									<ul class="tab_list">
									  	<li><%#Eval("product_review")%></li>
									  </ul>      
							     </div>	
							 </div>
					      </div>
			  </div>
        </ItemTemplate>
        </asp:Repeater>

	     <div class="clearfix"> </div>
    		</form>
</asp:Content>
