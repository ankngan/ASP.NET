<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebBanXeMay.Order" %>
<asp:Content ID="DetailContent" ContentPlaceHolderID="Content" runat="server">

<div class="main">
  <div class="content_top">
  	<div class="container">
	   <div class="col-md-3 sidebar_box">
	   	 <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>Danh mục</strong></h3>
			  <ul class="menu">
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Thương hiệu</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Honda </a></li>
						<li class="subitem2"><a href="#">Yamaha </a></li>
						<li class="subitem3"><a href="#">Suzuki </a></li>
                        <li class="subitem3"><a href="#">SYM </a></li>
					</ul>
				</li>
				<li class="item2"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Dòng xe</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Exciter </a></li>
						<li class="subitem2"><a href="#">Nouvo </a></li>
						<li class="subitem3"><a href="#">Sirius </a></li>
                        <li class="subitem3"><a href="#">Luvias </a></li>
					</ul>
				</li>		
			</ul>
		</div>
				<!--initiate accordion-->
		<script type="text/javascript">
		    $(function () {
		        var menu_ul = $('.menu > li > ul'),
			           menu_a = $('.menu > li > a');
		        menu_ul.hide();
		        menu_a.click(function (e) {
		            e.preventDefault();
		            if (!$(this).hasClass('active')) {
		                menu_a.removeClass('active');
		                menu_ul.filter(':visible').slideUp('normal');
		                $(this).addClass('active').next().stop(true, true).slideDown('normal');
		            } else {
		                $(this).removeClass('active');
		                $(this).next().stop(true, true).slideUp('normal');
		            }
		        });

		    });
		</script>
       </div>
		    <div class="delivery">
				<img src="images/delivery.jpg" class="img-responsive" alt=""/>
				<h3>Delivering</h3>
				<h4>World Wide</h4>
			</div>
			<div class="twitter">
			   <h3>Latest From Twitter</h3>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc"><span class="m_1">@Contrary</span> to popular belief, Lorem Ipsum is<span class="m_1"> not simply</span></li>
			   	  <div class="clearfix"> </div>
			   </ul>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc"><span class="m_1">There are many</span> variations of passages of Lorem Ipsum available, but the majority <span class="m_1">have suffered</span></li>
			   	  <div class="clearfix"> </div>
			   </ul>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc"><span class="m_1">Lorem Ipsum</span> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has <span class="m_1">been the industry's standard dummy text ever</span></li>
			   	  <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clients">
				<h3>Our Happy Clients</h3>
				<h4>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae.</h4>
			   <ul class="user">
			   	<i class="user_icon"></i>
			   	<li class="user_desc"><a href="#"><p>John Doe, Company Info</p></a></li>
			   	<div class="clearfix"> </div>
			   </ul>
			</div>
	   </div> 
	   <div class="col-md-9 single_right">
	   	<div class="single_top">
	       <div class="single_grid">
				<div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a href="#">
									<img class="etalage_thumb_image" src="images/p1.png" class="img-responsive" />
									<img class="etalage_source_image" src="images/p1.png" class="img-responsive" title="" />
								</a>
							</li>
						</ul>
						 <div class="clearfix"></div>		
				  </div> 
				  <div class="desc1 span_3_of_2">
				  	<h1> Tên sản phẩm</h1>

			    <div class="price_single">
				  <span class="reducedfrom">$140.00</span>
				</div>

				<h2 class="quick">Mô tả:</h2>
				<p class="quick_desc">Nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; es</p>

				<div class="quantity_box">
					<ul class="product-qty">
					   <span>Số lượng:
					   <select>
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
						 <option>6</option>
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
									  	<li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</a></li>
									  	<li><a href="#">augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigatione</a></li>
									  	<li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li>
									  </ul>           
							        </div>
							     </div>	
							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<div class="facts">
									  <ul class="tab_list">
									    <li><a href="#">augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigatione</a></li>
									  	<li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li>
									  </ul>           
							        </div>
							     </div>	
							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									<ul class="tab_list">
									  	<li><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</a></li>
									  	<li><a href="#">augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigatione</a></li>
									  	<li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores leg</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li>
									  </ul>      
							     </div>	
							 </div>
					      </div>
			  </div>
		<h3 class="single_head">Related Products</h3>	
	    <div class="related_products">
	     <div class="col-md-4 top_grid1-box1 top_grid2-box2"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p12.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p13.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p14.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 
	    <div class="top_grid2">
	     <div class="col-md-4 top_grid1-box1 top_grid2-box2"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p9.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	    </a> </div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	 <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p10.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p11.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 
        </div>
      </div> 
	</div>
</div>
</asp:Content>
