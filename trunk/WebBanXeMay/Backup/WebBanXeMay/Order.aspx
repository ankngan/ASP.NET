<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebBanXeMay.Order1" %>
<asp:Content ID="OrderContent" ContentPlaceHolderID="Content" runat="server">
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

        <div class="products_order_info">
            <div class="title"><p>THÔNG TIN ĐƠN HÀNG</p></div>

            <div class="image_left"><img src="images/p10.png" class="img-responsive" alt=""/></div>
            <div class="text_right">
                <p style="color:red; font-size:20px">Tên sản phẩm</p>
                <p>Giá: 1000$</p>
                <p>Số lượng: 1</p>
                <a href="#"><i style="color:blue">Xem chi tiết</i></a>
            </div>
            <div class="clearfix"></div>

            <div class="image_left"><img src="images/p10.png" class="img-responsive" alt=""/></div>
            <div class="text_right">
                <p style="color:red; font-size:20px">Tên sản phẩm</p>
                <p>Giá: 1000$</p>
                <p>Số lượng: 1</p>
                <a href="#"><i style="color:blue">Xem chi tiết</i></a>
            </div>
            <div class="clearfix"></div>

        </div>
    
        <div class="clearfix"></div>

	   	<div class="products_order" style="margin-top:20px">
            <div class="title"><p>ĐẶT HÀNG</p></div>
        </div>
          
	    
	    
	     
	    
	     <div class="clearfix"> </div>
        </div>
      </div> 
	</div>
</div>
</asp:Content>
