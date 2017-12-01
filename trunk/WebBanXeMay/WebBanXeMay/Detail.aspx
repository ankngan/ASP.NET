<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebBanXeMay.Order" %>
<asp:Content ID="DetailContent" ContentPlaceHolderID="Content" runat="server">

<div class="main">
  <div class="content_top">
  	<div class="container">
	   <div class="col-md-3 sidebar_box">
	   	   	 <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>Thương hiệu</strong></h3>
			  <ul class="menu">
                
                <asp:Repeater ID="RepeaterProducer" runat="server">
                <ItemTemplate>
                    <li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/><%#Eval("producer_name")%></a></li>
                </ItemTemplate>
                </asp:Repeater>

			</ul>
		</div>	
       </div>

        <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>Dòng xe</strong></h3>
			  <ul class="menu">

				<asp:Repeater ID="RepeaterMoto_model" runat="server">
                <ItemTemplate>
                    <li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/><%#Eval("moto_model_name")%></a></li>
                </ItemTemplate>
                </asp:Repeater>

			</ul>
		</div>	
       </div>

        <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>NHÂN VIÊN HỖ TRỢ</strong></h3>
			  <ul class="menu">

                <asp:Repeater ID="RepeaterEmployer" runat="server">
                <ItemTemplate>
				<li class="item1 support_employer">
                     <div class="info_left" >
                        <img src="images/employers/<%#Eval("avatar")%>" class="img-responsive" alt=""/>
                     </div>
                     <div class="info_right">
                         <p><strong><i class="fa fa-user" aria-hidden="true"></i><%#Eval("employer_name")%></strong></p>
                         <p><i class="fa fa-phone" aria-hidden="true"></i><%#Eval("employer_phone")%></p>
                         <p><i class="fa fa-envelope" aria-hidden="true"></i><%#Eval("employer_email")%></p>
                     </div>
                     <div class="clearfix"></div>
				</li>
                </ItemTemplate>
                </asp:Repeater>
				
			</ul>
		</div>	
       </div>
		</div>	
			

       <asp:Repeater ID="RepeaterProduct" runat="server">
       <ItemTemplate>
	   <div class="col-md-9 single_right">
	   	<div class="single_top">
	       <div class="single_grid">
				<div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a href="">
									<img class="etalage_thumb_image" src="images/products/<%#Eval("product_image")%>" class="img-responsive" />
									<img class="etalage_source_image" src="images/products/<%#Eval("product_image")%>" title="" />
								</a>
							</li>
						</ul>
						 <div class="clearfix"></div>		
				  </div> 
				  <div class="desc1 span_3_of_2">
				  	<h1><%#Eval("product_name")%></h1>

			    <div class="price_single">
				  <span class="reducedfrom"><%#Eval("product_price","{0:0,000}")%>  VND</span>
				</div>

				<h2 class="quick">Mô tả:</h2>
				<p><%#Eval("product_description")%></p>

				<div class="quantity_box">
					<ul class="product-qty">
					   <span>Số lượng:
					   <select>
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
					   </select></span>
				    </ul>
				    <ul class="single_social">
						<li><a href="#"><i class="fb1"> </i> </a></li>
						<li><a href="#"><i class="tw1"> </i> </a></li>
						<li><a href="#"><i class="g1"> </i> </a></li>
						<li><a href="#"><i class="linked"> </i> </a></li>
		   		    </ul>
		   		    <div class="clearfix"></div>
	   		    </div>
			    <a href="order.aspx" title="Online Reservation" class="btn bt1 btn-primary btn-normal btn-inline " target="_self">Thêm vào giỏ</a>
                <a href="order.aspx" title="Online Reservation" class="btn bt1 btn-primary btn-normal btn-inline " target="_self">Thanh toán</a>
               
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
									  	<%#Eval("product_description")%>
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
									  	<%#Eval("product_review")%>
									</ul>      
							     </div>	
							 </div>
					      </div>
			  </div>
        </div>
      </div> 
        </ItemTemplate>
        </asp:Repeater>
	</div>
</div>
</asp:Content>
