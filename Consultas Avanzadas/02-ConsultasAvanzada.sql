use Northwind

select CategoryID, count(*) from Products

Select CategoryID from Categories

Select count (*) from Products

select CategoryID, count(*) from Products
group by CategoryID

select c.CategoryName, count (*) as 'Número de productos' 
from Categories as c 
Join Products as p 
on c.CategoryID = p.CategoryID
group by c.CategoryName;

--Consultar para mostrar todos los productos juntos con sus categorias y sus precios
Select p.ProductName, c.CategoryName, p.UnitPrice from Categories as c
JOIN Products as p 
on c.CategoryID = p.CategoryID

--Consultar para mostrar los nombres de los productos y los nombres de sus proveerdores
select p.ProductName, s.CompanyName from Suppliers as s
JOIN Products as p 
ON s.SupplierID = p.SupplierID
order by s.CompanyName

--Seleccionar las ordenes de compra mostrando los nombres de los productos y sus importes 
select o.OrderID, p.ProductName, (o.UnitPrice*o.Quantity) as 'Importe' from [Order Details] as o 
JOIN Products as p 
ON o.ProductID = p.ProductID
where (o.UnitPrice*o.Quantity) <= 15000
order by Importe;

--Mostrar las ordenes de compra y los nombres de los empleados que las realizaron 
Select o.OrderID, CONCAT( e.FirstName,' ', e.LastName) from Orders as o 
JOIN Employees as e
ON e.EmployeeID = o.EmployeeID
where year(OrderDate) in ('1996', '1998')

--Seleccionar las ordenes mostrando los clientes a las que se les hicieron las cantidades vendidas y los nombres de los productos

--Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado del representante de ventas de cada pedido.

--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.
Select p.ProductName as 'Nombre del producto', 
s.CompanyName as 'Nombre empresa', p.UnitPrice as 'Precio'
From Products as p 
JOIN Suppliers as s 
on p.SupplierID = s.SupplierID;

SELECT p.ProductName, p.UnitPrice FROM
(Select SupplierID, ProductName, UnitPrice FROM Products) as p 
JOIN Suppliers as s 
on p.SupplierID = s.SupplierID;

SELECT p.ProductName, p.UnitPrice FROM
(Select SupplierID, ProductName, UnitPrice FROM Products) as p 
JOIN (select SupplierID, CompanyName From Suppliers) as s 
on p.SupplierID = s.SupplierID;

--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.
SELECT o.OrderID as 'PedidoID', c.CompanyName as 'Nombre del cliente', 
o.OrderDate as 'Fecha de pedido', year(o.OrderDate) as 'Año de compra', 
month(o.OrderDate) as 'Mes de compra', 
day(o.OrderDate) as 'Día de compra' FROM Orders AS o
JOIN Customers as c 
ON o.CustomerID = c.CustomerID;

SELECT o.OrderID as 'PedidoID', c.CompanyName as 'Nombre del cliente', 
o.OrderDate as 'Fecha de pedido', year(o.OrderDate) as 'Año de compra', 
month(o.OrderDate) as 'Mes de compra', 
day(o.OrderDate) as 'Día de compra' FROM (select OrderID, CustomerID, OrderDate From Orders) AS o
JOIN (Select CompanyName, CustomerID from Customers) as c 
ON o.CustomerID = c.CustomerID;

--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el departamento del empleado para cada empleado.
select CONCAT(e.FirstName,' ', e.LastName) as 'Nombre Empleado', e.Title as 'Cargo', t.TerritoryDescription as 'Departamento'
from Employees as e
JOIN EmployeeTerritories as et 
ON et.EmployeeID = e.EmployeeID
INNER JOIN Territories as t 
On t.TerritoryID = et.TerritoryID

select CONCAT(e.FirstName,' ', e.LastName) as 'Nombre Empleado', e.Title as 'Cargo', t.TerritoryDescription as 'Departamento'
from (select FirstName, LastName, Title, EmployeeID from Employees) as e
JOIN (select EmployeeID, TerritoryID from EmployeeTerritories) as et 
ON et.EmployeeID = e.EmployeeID
INNER JOIN (select TerritoryID, TerritoryDescription from Territories) as t 
On t.TerritoryID = et.TerritoryID


--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.

SELECT s.CompanyName, s.ContactName, s.Phone FROM Suppliers as s

--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.

--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.

--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.

--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.

--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.

--Ejercicio de reto: seleccionar todas las ordenes mostrando el empleado que la realizo, el cliente al que se le vendio, el nombre de los productos, sus categorias, el precio que se vendio, las unidades vendidas y el importe
--de enero de 1997 a feb 1998

select CONCAT(FirstName, ' ', LastName) as 'Nombre del empleado',
 c.CompanyName as 'Nombre del cliente', 
 p.ProductName as 'Producto', 
 ca.CategoryName as 'Categoria', 
 od.UnitPrice as 'Precio', 
 od.Quantity as 'Cantidad', 
(od.UnitPrice*Quantity) as 'Importe'
from Employees as em
JOIN Orders as o
on em.EmployeeID = o.EmployeeID
Join Customers as c 
on c.CustomerID = o.CustomerID
JOIN [Order Details] as od 
on od.OrderID= o.OrderID
JOIN Products as p 
on p.ProductID=od.ProductID
JOIN Categories as ca 
on ca.CategoryID = p.CategoryID
where o.OrderDate between '1997-01-01' and '1998-02-28'
order by c.CompanyName

--cuanto he vendido de la categoria beverages
select CONCAT(FirstName, ' ', LastName) as 'Nombre del empleado',
 c.CompanyName as 'Nombre del cliente', 
 p.ProductName as 'Producto', 
 ca.CategoryName as 'Categoria', 
 od.UnitPrice as 'Precio', 
 od.Quantity as 'Cantidad', 
(od.UnitPrice*Quantity) as 'Importe'
from Employees as em
JOIN Orders as o
on em.EmployeeID = o.EmployeeID
Join Customers as c 
on c.CustomerID = o.CustomerID
JOIN [Order Details] as od 
on od.OrderID= o.OrderID
JOIN Products as p 
on p.ProductID=od.ProductID
JOIN Categories as ca 
on ca.CategoryID = p.CategoryID
where o.OrderDate between '1997-01-01' and '1998-02-28' and ca.CategoryName = 'Bevarages'




