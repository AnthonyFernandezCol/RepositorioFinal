use Northwind

create or alter proc Registrar_Stock
@_OrderID Int,
@_ProductID int,
@_Quantity smallint,
@_Discount real
As
Begin
Declare @Existencia_Prod INT

	select @Existencia_Prod = UnitPrice from Products
	Where ProductID = @_ProductID
	
	if Exists(Select 1 From Products Where ProductID = @_ProductID ) 
	Begin
	Insert into [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount) 
	Values(@_OrderID,@_ProductID, @Existencia_Prod, @_Quantity, @_Discount)
	End
	else if
	Exists(Select 0 From Products Where ProductID = @_ProductID)
	Begin
	Print('El Producto no existe')
	end
END;

Create or alter trigger TGGR_GesVenta
On [Orders Details]
after insert
As 
Begin
	Declare 
	@GVOrderID Int,
	@GVProductID Int,
	@Existencia INT,
	@GVQuantity smallint
	select @GVOrderID = OrderID, @GVProductID = ProductID, @GVQuantity = Quantity From inserted
		
		Select @Existencia = p.UnitsInStock from Products as p where ProductID = @GVProductID 

	If @Existencia >= @GVQuantity
	Begin
		
	end
End;
