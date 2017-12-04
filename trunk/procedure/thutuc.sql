create proc LoadProducts
as
select * from Product

create proc LoadCategories
as
select * from Categories

create proc LoadProducer
as
select * from Producer

create proc LoadMoto_Model
as
select * from Moto_model

ALTER TABLE Employer ADD avatar nvarchar(100);

create proc LoadEmployer
as
select * from Employer