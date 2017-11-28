<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebBanXeMay.Search" %>
<asp:Content ID="SearchContent" ContentPlaceHolderID="Content" runat="server">
<div class="slider">
	  <div class="callbacks_container">
	      <ul class="rslides" id="slider">
            <li><img src="images/banner1.png" class="img-responsive" alt=""/>
	         <%--<div class="banner_desc">
				<h1>Duis autem vel eum iriure dolor in hendrerit.</h1>
				<h2>Claritas est etiam processus dynamicus, qui sequitur .</h2>
			 </div>--%>
	        </li>
	        <li><img src="images/banner2.png" class="img-responsive" alt=""/>
	         <%--<div class="banner_desc">
				<h1>Duis autem vel eum iriure dolor in hendrerit.</h1>
				<h2>Claritas est etiam processus dynamicus, qui sequitur .</h2>
			 </div>--%>
	        </li>
	        <li><img src="images/banner3.png" class="img-responsive" alt=""/>
	         <%-- <div class="banner_desc">
				<h1>Ut wisi enim ad minim veniam, quis nostrud.</h1>
				<h2>Mirum est notare quam littera gothica, quam nunc putamus.</h2>
			  </div>--%>
	        </li>
	      </ul>
	  </div>
</div>

<div class="column_center">
  <div class="container">
	<div class="search">
	  <div class="stay_right">
		  <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
		  <input type="submit" value="">
	  </div>
	  <div class="clearfix"> </div>
	</div>
    <div class="clearfix"> </div>
  </div>
</div>
<div class="main">
  <div class="content_top">
  	<div class="container">
	   <div class="col-md-3 sidebar_box">
	   	<div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>Thương hiệu</strong></h3>
			  <ul class="menu">
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Honda</a></li>
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Yamaha </a></li>
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Suzuki </a></li>
                <li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>SYM </a></li>
			</ul>
		</div>	
       </div>

        <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>Dòng xe</strong></h3>
			  <ul class="menu">
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Exciter </a></li>
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Nouvo </a></li>
				<li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Sirius </a></li>
                <li class="item1"><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Luvias </a></li>
			</ul>
		</div>	
       </div>

        <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head"><strong>NHÂN VIÊN HỖ TRỢ</strong></h3>
			  <ul class="menu">

				<li class="item1 support_employer">
                     <div class="info_left" >
                        <img src="images/nv1.jpg" class="img-responsive" alt=""/>
                     </div>
                     <div class="info_right">
                         <p><strong><i class="fa fa-user" aria-hidden="true"></i>NGUYỄN VĂN A</strong></p>
                         <p><i class="fa fa-phone" aria-hidden="true"></i>0909090909</p>
                         <p><i class="fa fa-envelope" aria-hidden="true"></i>tdc.hoangduy@gmail.com</p>
                     </div>
                     <div class="clearfix"></div>
				</li>

                
				<li class="item1 support_employer">
                     <div class="info_left">
                        <img src="images/nv2.jpg" class="img-responsive" alt=""/>
                     </div>
                     <div class="info_right">
                         <p><strong><i class="fa fa-user" aria-hidden="true"></i>NGUYỄN VĂN B</strong></p>
                         <p><i class="fa fa-phone" aria-hidden="true"></i>0909090909</p>
                         <p><i class="fa fa-envelope" aria-hidden="true"></i>tdc.hoangduy@gmail.com</p>
                     </div>
                     <div class="clearfix"></div>
				</li>
                
				<li class="item1 support_employer">
                     <div class="info_left"">
                        <img src="images/nv3.jpg" class="img-responsive" alt=""/>
                     </div>
                     <div class="info_right">
                         <p><strong><i class="fa fa-user" aria-hidden="true"></i>NGUYỄN VĂN C</strong></p>
                         <p><i class="fa fa-phone" aria-hidden="true"></i>0909090909</p>
                         <p><i class="fa fa-envelope" aria-hidden="true"></i>tdc.hoangduy@gmail.com</p>
                     </div>
                     <div class="clearfix"></div>
				</li>
                
				<li class="item1 support_employer">
                     <div class="info_left">
                        <img src="images/nv4.jpg" class="img-responsive" alt=""/>
                     </div>
                     <div class="info_right">
                         <p><strong><i class="fa fa-user" aria-hidden="true"></i>NGUYỄN VĂN D</strong></p>
                         <p><i class="fa fa-phone" aria-hidden="true"></i>0909090909</p>
                         <p><i class="fa fa-envelope" aria-hidden="true"></i>tdc.hoangduy@gmail.com</p>
                     </div>
                     <div class="clearfix"></div>
				</li>
				
			</ul>
		</div>	
       </div>

       <div class="sidebar">
			<div class="menu_box">
            <h3 class="menu_head"><strong>Bản đồ trung tâm</strong></h3>
			 <div class="gmap-content">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1003454.1751206238!2d106.1347058958351!3d10.754289357288188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529292e8d3dd1%3A0xf15f5aad773c112b!2zSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2sin!4v1502429973386" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
		</div>	
       </div>
	
	   </div> 
	   <div class="col-md-9 content_right">

	   	<h4 class="head"><span class="m_2">Kết quả tìm kiếm: </span> Xe tay ga</h4>
	    <div class="top_grid2">
	      <div class="col-md-4 top_grid1-box1"><a href="order.aspx">
	     	<div class="grid_1">
	     	  <div class="hover_product">
		        <img src="images/p3.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p4.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p5.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	    </a> </div>
	     <div class="clearfix"> </div>
	    </div> 
	    <div class="top_grid2">
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	 <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p6.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p7.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p8.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 

	    <div class="top_grid2">
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p9.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
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
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
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
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 
	    <div class="top_grid2">
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="images/p12.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
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
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
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
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
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
