go
create proc LoadOrder
as
select * from Orders

go
create proc LoadOrderByID
@ID int
as
select * from Orders where orders_id = @ID
select * from Product p, Main_detail m where p.main_detail_id=m.main_detail_id and  product_id =2