<%@ Page Title="" Language="C#" MasterPageFile="~/Layout_master.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebBanXeMay.Contact" %>
<asp:Content ID="ContactContent" ContentPlaceHolderID="Content" runat="server">

<div class="about">
 <div class="container">
  <div class="singel_right">
			     <div class="col-md-8">
				      <div class="contact-form">

					    	    <p class="comment-form-author"><label for="author">Họ tên:</label>
                                    <asp:TextBox ID="hoten" runat="server"></asp:TextBox>
						    	</p>
						        <p class="comment-form-author"><label for="author">Email:</label>
                                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
						        </p>
						        <p class="comment-form-author"><label for="author">Nội dung:</label>

                                <asp:TextBox ID="noidung" runat="server" TextMode="MultiLine"></asp:TextBox>
						        </p>
                                <asp:Button ID="send" runat="server" Text="GỬI" OnClick="send_Click" />
				       </div>
			     </div>
			    
		        <div class="clearfix"></div>
		</div>
		<div class="map">
           <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
     </div>
</div>
</asp:Content>
