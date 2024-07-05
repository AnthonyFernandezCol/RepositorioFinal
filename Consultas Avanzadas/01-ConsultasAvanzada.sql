--Consulta Simples(Consultas a una sola tabla)
use Northwind;

--Seleccionar todos los customers(Clientes)
Select * from Customers

--Proyección
Select CustomerID, CompanyName, City, Country 
from Customers

Select Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country 
from Customers

--Selecciona 10 registros de los clientes
Select top 10 CustomerID, CompanyName, City, Country 
from Customers

--Alias de columna
--Country as Pais
--country pais
--country 'pais'
--country as 'pais'
--country as 'pais de las maravillas'
Select CustomerID as 'Numero Cliente', CompanyName NombreEmpresa, City as 'Ciudad', Country 'País'  
from Customers

select * from Customers

--Alias de tabla
Select c.CustomerID, c.CompanyName, c.City, c.Country 
from Customers as c

Select c.CustomerID, c.CompanyName, c.City, c.Country 
from Customers c

--Campo calclado
select *,(p.UnitPrice * p.UnitsInStock) as 'Costo inventario' from Products as p

select ProductName 'Nombre producto', UnitsInStock 'Existencia', UnitPrice 'Precio unitario',
(p.UnitPrice * p.UnitsInStock) as 'Costo inventario' from Products as p

--Filtrar datos
--Clausula where y operadores relacionales 
/*
  <  ->Menor que
  >  ->Mayor que
  <=  ->Menor o igual
  >=  ->Mayor o igual
  <>  ->Diferente
  !=  ->Diferente
  =   ->Igual a
*/

select * from Customers

--Seleccionar todos los clientes de alemania 

select * from Customers where Country = 'Germany'

--Seleccionar todos los productos que tengan un stock mayor a 20 mostrando solamente el nombre del producto, el precio y la existencia
select p.ProductName 'Nombre del producto', p.UnitPrice 'Precio', p.UnitsInStock 'Existencia' from Products as p where UnitsInStock > 20;

-- Lo ordenamos de mayor a menor
select p.ProductName 'Nombre del producto', p.UnitPrice 'Precio', p.UnitsInStock 'Existencia' from Products as p where UnitsInStock > 20 
order by p.UnitsInStock desc;

select p.ProductName 'Nombre del producto', p.UnitPrice 'Precio', p.UnitsInStock 'Existencia' from Products as p where UnitsInStock > 20 
order by 1 desc;

select p.ProductName 'Nombre del producto', p.UnitPrice 'Precio', p.UnitsInStock 'Existencia' from Products as p where UnitsInStock > 20 
order by p.UnitPrice desc;

--Seleccionar todos los clientes ordenados de forma ascendente por país y dentro del país ordenados de forma descendente por ciudad
select C.CompanyName, C.ContactName,c.Country, c.City from Customers AS c order by c.Country asc, c.City desc

--seleccionar los paises
select distinct country from Customers
order by 1 asc

select count (distinct country) from Customers

--Selecciona todos los productos donde el precio es mayor o igual a 18
select * from Products as p
where p.UnitPrice >= 18.0

--Todos los que son diferentes a 18
select * from Products as p
where p.UnitPrice <> 18.0

--seleccionar todos los productos que tengan un precio que tengan entre 18 y 25
select * from Products as p 
where p.UnitPrice >= 18 and p.UnitPrice<=25

select * from Products as p 
where p.UnitPrice between 18 and 25

--seleccionar todos los productos que no tengan un precio que tengan entre 18 y 25
select * from Products as p 
where not p.UnitPrice>= 18 and p.UnitPrice<=25

select * from Products as p 
where p.UnitPrice not between 18 and 25

--Seleccionar todos los productos donde el precio sea mayor a 38 y su existencia sea mayor he igual a 22
select * from Products as p 
where p.UnitPrice > 38 and p.UnitsInStock>=22

--seleccionar todos los clientes de alemania, méxico y francia
select * from Customers

select * from Customers as c
where c.Country = 'Germaany' or c.Country = 'Mexico' or c.Country = 'French'

select * from Customers as c
where c.Country in ('Germany', 'Mexico', 'France')

--Seleccionar todos los clientes  que no tengan region
select * from Customers as c
where c.Region IS NULL

select * from Customers as c
where c.Region IS not NULL

--Seleccionar todas las ordenes enviadas de julio de 1996 a abril de 1998 para los empleados Buchanan, Leverling, y devolio
select * from Orders

select*from Employees

select * from Orders as o
where o.ShippedDate >= 1996-07-30 or o.ShippedDate <= 1998-04-30 and o.EmployeeID in (5, 3, 1)

select * from Orders as o
where o.ShippedDate between '1996-07-01' and '1998-04-30' and o.EmployeeID in (5, 3, 1)

select e.LastName from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
where o.ShippedDate between '1996-07-01' and '1998-04-30' and e.LastName in ('Buchanan', 'Leverling', 'Devolio')

--Funciones de agregado, group by, having.
/*
sum
count(*)
count(Campo)
avg()
max()
min()
*/

select * from Orders
--Selecciona el numero total de ordenes realizadas 
select count(*) as 'Total ordenes' from Orders

select count(ShipCountry) from Orders --No es cierto
select count (distinct ShipCountry) as 'Total de paises' from Orders

--Seleccionar el total de ordenes enviadas a Francia entre 1996 y 1998 
select count (*) as 'Numero de Ordenes' from Orders 
where ShipCountry='France'
and year(ShippedDate) between '1996' and '1998'

--Seleccionar el producto más barato
select min(UnitPrice) from Products

--Seleccionar el producto más caro
select max(UnitPrice) from Products

--Seleccionar el nombre del prodcuto y precio de aquel que sea más caro
Select Top 1 ProductName, UnitPrice from Products
order by UnitPrice desc 

--Seleccionar el monto total de todas las ordenes

--Primero se saca un importe
select (UnitPrice * Quantity) from [Order Details]

select SUM(UnitPrice * Quantity) as 'Total Vendido' from [Order Details]

--Seleccionar el total de ventas realizadas a los productos que no tienen descuento
select * from Products
Select Sum(Unitprice * Quantity ) From [Order Details] 
where Discount = 0

--Seleccionar el promedio de ventas para los productos
--Singaporean Hokkien Fried Mee y Mozzarella di Giovanni

select AVG(UnitPrice*Quantity) as 'Promedio Ventas' from [Order Details] 
where ProductID in (72,42)

select * from Products 
where ProductName in ('Singaporean Hokkien Fried Mee', 'Mozzarella di Giovanni')

--Seleccionar el total de ventas para el cliente Choup-suey Chinese de 1996 a 1998 ID= Chops
select Sum(UnitPrice * Quantity) as 'Total de ventas'
from [Order Details] as od
JOIN Orders as o
on od.OrderID = o.OrderID
where CustomerID = 'Chops' and OrderDate between '1996' and '1998' 

--Joins
Select *
From Categories as c
JOIN Products as p 
On c.CategoryID = p.CategoryID

Select c.CategoryName as 'Nombre Categoria', 
p.ProductName as 'Nombre de Productos', 
p.UnitPrice as 'Precio unitario', 
p.UnitsInStock as 'Existencia', 
(p.UnitPrice*UnitsInStock) as 'Precio inventario'
From Categories as c
JOIN Products as p 
On c.CategoryID = p.CategoryID

--Seleccionar los productos de la categoria Beverages
Select c.CategoryName as 'Nombre Categoria', 
p.ProductName as 'Nombre de Productos', 
p.UnitPrice as 'Precio unitario', 
p.UnitsInStock as 'Existencia', 
(p.UnitPrice*UnitsInStock) as 'Precio inventario'
From Categories as c
JOIN Products as p 
On c.CategoryID = p.CategoryID
where c.CategoryName = 'Beverages' and  p.UnitPrice > 20











