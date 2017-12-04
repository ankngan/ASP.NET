create proc LoadProductDetail
@id int
as
begin
	select Product.*, Main_detail.*
	from Product
	inner join Main_detail
	on Product.main_detail_id = Main_detail.main_detail_id and Product.product_id = @id
end