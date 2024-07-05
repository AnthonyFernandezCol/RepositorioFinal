use Northwind
create or alter Proc sp_ventas_proveedor
@year int,
@month Varchar(5),
@day int
As
Begin
select s.companyname as nombre,
sum(od.unitprice*od.quantity) as total 
from
Suppliers as s
inner join products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join orders as o
on o.OrderID=od.OrderID
where datepart(year,o.orderdate)=@year
and datepart(month,o.orderdate)=@month
and datepart(day,o.orderdate)=@day
group by s.CompanyName
order by s.CompanyName;
End;

--Formas de ejecutar un SP
exec sp_ventas_proveedor 1996, 07, 04
exec sp_ventas_proveedor @day = 07, @year=1996, @month = 07

--Crear un sp que permita vizualisar cuantas ordenes se han hecho por año y país
Alter PROCEDURE sp_AñosyCiudad
    @year INT,
    @Pais VARCHAR(50)
AS
BEGIN
    SELECT o.OrderID, o.OrderDate As 'Fecha', o.ShipCountry As 'País'
    FROM Orders AS o
    WHERE DATEPART(YEAR, o.OrderDate) = @year AND o.ShipCountry = @Pais
    ORDER BY o.ShipCountry;
END;

Exec sp_AñosyCiudad 1996, 'Germany'


