use Northwind
go

select * from Orders
select * from [Order Details]

create or alter trigger verificar_salario
on [Order Details]
after insert
as 
begin
begin transaction
if exists(select 1 from inserted) or  not exists(select 1 from deleted)
begin
	declare
		@_Quantity smallint, 
		@_Stock smallint,
		@_ProductID int
		set @_Quantity = (select Quantity from inserted)
		set @_ProductID = (select ProductID from inserted)
		set @_Stock = (select UnitsInStock from Products where ProductID = @_ProductID)
	if @_Quantity <= @_Stock
		begin
			update Northwind.dbo.Products
			set UnitsInStock = (UnitsInStock-@_Quantity)
			where ProductID = @_ProductID
				print ('La compra se realizo exitosamente')
		commit
	end
else 
	begin
		raiserror('no se cuenta con la cantidad  de producto', 16,1)
		rollback transaction;
	end
end
end

create or alter procedure sp_insert_order_details
--Variables
@id as int,
@proid as int,
@Quant as smallint,
@Discount as real
as
begin
if exists (select 1 from Products where ProductID = @proid)
begin

declare
@Unitp money
select @Unitp = UnitPrice from Products where ProductID = @proid
insert into [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
values (@id,@proid,@Unitp,@Quant,@Discount)
end
else
begin
print ('Algo salio mal')
end
end

exec sp_insert_order_details @id = 10248, @proid = 11,@Quant = 2,@Discount = 0;

DELETE [Order Details] WHERE ProductID = 11  and OrderID = 10248