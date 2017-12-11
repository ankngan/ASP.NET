go
create proc LoadOrder
as
select * from Orders

go
create proc LoadOrderByID
@ID int
as
select * from Orders where orders_id = @ID

go
create proc LoadOrder_Detail
as
select * from Orders_detail

go
create proc LoadOrder_DetailByID
@ID int
as
select * from Orders_detail where orders_detail_id = @ID

