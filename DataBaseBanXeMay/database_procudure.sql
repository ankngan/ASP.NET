create database DATABASE_XE_MAY

go
use DATABASE_XE_MAY

CREATE TABLE Categories(
	categories_id int IDENTITY(1,1) NOT NULL primary key,
	categories_name nvarchar(500)
)

create table Customer(
	customer_id int IDENTITY(1,1) NOT NULL primary key,
	customer_name nvarchar(50) ,
	customer_phone int ,
	customer_email nvarchar(50) ,
	customer_address nvarchar(200) 
)

CREATE TABLE Employer(
	employer_id int IDENTITY(1,1) NOT NULL primary key,
	employer_name nvarchar(500) ,
	employer_email varchar(500) ,
	employer_phone int ,
	avatar nvarchar(100) 
)

CREATE TABLE Main_detail(
	main_detail_id int IDENTITY(1,1) NOT NULL primary key,
	model nvarchar(500) NULL,
	weight float NULL,
	size nvarchar(200) NULL,
	tank_capacity float NULL,
	warranty_period nvarchar(50) 
)

CREATE TABLE Moto_model(
	moto_model_id int IDENTITY(1,1) NOT NULL primary key,
	moto_model_name nvarchar(500)
)


CREATE TABLE Producer(
	producer_id int IDENTITY(1,1) NOT NULL primary key,
	producer_name nvarchar(500) NULL
)

create table Product (
	product_id int IDENTITY(1,1) NOT NULL primary key,
	categories_id int NULL,
	producer_id int NULL,
	main_detail_id int NULL,
	moto_model_id int NULL,
	product_name nvarchar(500) NULL,
	product_image nvarchar(500) NULL,
	product_price int NULL,
	product_quantity int NULL,
	product_description nvarchar(1000) NULL,
	product_review nvarchar(1000) NULL,
	FOREIGN KEY (categories_id) REFERENCES Categories(categories_id),
	FOREIGN KEY (producer_id) REFERENCES Producer(producer_id),
	FOREIGN KEY (main_detail_id) REFERENCES Main_detail(main_detail_id),
	FOREIGN KEY (moto_model_id) REFERENCES Moto_model(moto_model_id)

)

CREATE TABLE Users(
	user_id int IDENTITY(1,1) NOT NULL primary key,
	name nvarchar(50)not null,
	user_name nvarchar(100) not NULL,
	user_address nvarchar(500) NULL,
	user_phone int NULL,
	user_email nvarchar(100) NULL,
	user_password varchar(32) not NULL,
	user_permission int NULL
)

CREATE TABLE Orders(
	orders_id int IDENTITY(1,1) NOT NULL primary key,
	customer_id int NULL,
	user_id int NULL,
	total_money int NULL,
	quantity int NULL,
	orders_date datetime,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
)

create table Orders_detail(
	orders_detail_id int IDENTITY(1,1) not null primary key,
	orders_id int,
	product_id int,	
	FOREIGN KEY (product_id) REFERENCES Product(product_id),
	FOREIGN KEY (orders_id) REFERENCES Orders(orders_id)	
)

--procedure
go
create proc LoadProducts
as
select * from Product
go
create proc LoadCategories
as
select * from Categories
go
create proc LoadProducer
as
select * from Producer
go
create proc LoadMoto_Model
as
select * from Moto_model
go


create proc LoadEmployer
as
select * from Employer
go
create proc LoadByCategories
@cateID int
as
SELECT * FROM Product where categories_id = @cateID

go

create proc LoadDongXe
@motoId int
as
SELECT *FROM  Product where moto_model_id = @motoId
go
create proc LoadThuongHieu
@producer_Id int
as
SELECT *FROM  Product where producer_id = @producer_Id
// Phân Trang
Create PROCEDURE [dbo].[spPhanTrangSQL]
@Total int,
@currPage int ,
@PageSize int,
@rowperpage int  
AS
BEGIN
DECLARE  @PageNumber int SET @PageNumber=1
DECLARE @i int
SET @i=1
DECLARE @TotalPage int
IF @Total%@rowperpage>0
SET @TotalPage=(@Total/@rowperpage)+1
ELSE
SET @TotalPage=@Total/@rowperpage 
DECLARE @Start int SET @Start=0
DECLARE @SQL nvarchar(4000)
SET @SQL=''
IF @currPage<=@TotalPage
BEGIN
 -- X? lý tru?ng h?p @currPage=1
 IF @currPage=1
 BEGIN
  SET @SQL=@SQL+ N'Trang '
  SET @PageNumber=@PageSize
  IF @PageNumber>@TotalPage SET @PageNumber=@TotalPage
  SET @Start=1
 END
 ELSE
 BEGIN
  SET @SQL=@SQL+ N' <a href="?page=1">Trang d?u</a>'
  SET @SQL=@SQL+ ' <a href="?page='+ 
   Cast((@currPage-1) AS nvarchar(4))+N'"> << </a>'
  -- X? lý tru?ng h?p (@TotalPage-@currPage)<@PageSize/2
  IF(@TotalPage-@currPage)<@PageSize/2
     BEGIN
     SET @Start=(@TotalPage-@PageSize)+1
     IF @Start<=0 SET @Start=1 
     SET @PageNumber = @TotalPage
     END
  ELSE
  BEGIN
   IF (@currPage-(@PageSize/2))=0
   BEGIN
    SET @Start=1
    SET @PageNumber=@currPage+(@PageSize/2)+1
    IF @TotalPage<@PageNumber
     SET @PageNumber=@TotalPage
   END
   ELSE
      BEGIN
      SET @Start=@currPage-(@PageSize/2)
      IF @Start<=0 SET @Start=1 
      SET @PageNumber=@currPage+(@PageSize/2)
      IF @TotalPage<@PageNumber
          SET @PageNumber=@TotalPage
      ELSE
      IF @PageNumber <@PageSize 
          SET @PageNumber=@PageSize
      END
  END
  END 
  
 SET @i=@Start
 WHILE @i<=@PageNumber
 BEGIN
  IF @i=@currPage
   SET @SQL=@SQL+'
    ['+Cast(Cast(@i AS int) AS nvarchar(4))+'] '
  ELSE
   SET @SQL=@SQL+'
    <a href="?page='+Cast(@i AS nvarchar(4))+'">'
    +Cast(@i AS nvarchar(4))+'</a> '
  SET @i=@i+1 
 END
 IF @currPage<@TotalPage
 BEGIN
  SET @SQL=@SQL+ N'
   <a href="?page='+Cast((@currPage+1) 
   AS nvarchar(4))+N'"> >> </a>'
   SET @SQL=@SQL+ N' 
    <a href="?page='+cast(@TotalPage AS nvarchar(6))+
     N'">Trang cu?i</a>'
 END
 SELECT @SQL AS PhanTrang 
 -- PRINT @SQL
END
END

CREATE proc PhanTrang
@currPage int,
@recodperpage int,
@Pagesize int
AS
Begin
    Begin
    WITH s AS
    (
        SELECT ROW_NUMBER() 
   OVER(ORDER BY product_id ,
   product_name) AS RowNum, 
   product_id, 
   product_name,
   product_price,
   product_image  
        FROM Product  
    )
    Select * From s 
    Where RowNum Between 
  (@currPage - 1)*@recodperpage+1 
   AND @currPage*@recodperpage
    END
    -- Tính t?ng s? b?n ghi
    DECLARE @Tolal int
    SELECT @Tolal=Count(*) FROM Product
    
    EXEC spPhanTrangSQL
   @Tolal, 
   @currPage, 
   @Pagesize, 
   @recodperpage
END
exec PhanTrang 9,6,30