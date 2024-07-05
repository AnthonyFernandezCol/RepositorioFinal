use [bdventas]

select * from [Northwind].dbo.customers;
go

-- Consulta los datos de la tabla cliente
select * from  Cliente;
go

-- Elimina los datos de la tabla cliente
delete from Cliente
go

-- Comando para reiniciar el identity de una tabla
DBCC CHECKIDENT (cliente, RESEED, 0)
go

-- Crea una tabla apartir de una consulta
select top 0 EmployeeID as 'EmpleadoId', LastName as 'Apellido', FirstName as 'PrimerNombre', BirthDate as 'FechaNacimieto', HireDate as 'FechaContratacion', [address] as 'Direccion', city as 'Ciudad', region, PostalCode as 'CodigoPostal', Country as 'Pais' 
into Empleado2 from [Northwind].dbo.Employees
go

-- Consulta la tabla 
select *from Empleado2
go

-- Agraga la llave primaria la tabla empleado
alter table Empleado2 add Constraint pk_empleadoId primary key(EmpleadoId)
go

-- Consulta los ultimos 5 registros 
select top 5 * from [Northwind].dbo.[Order Details]
order by OrderID desc
go

-- Insertar datos
insert into Empleado2(EmpleadoId, Apellido, PrimerNombre, FechaNacimieto, FechaContratacion, Direccion, Ciudad, region, CodigoPostal, Pais)
select EmployeeID as 'EmpleadoId', 
LastName as 'Apellido', 
FirstName as 'PrimerNombre', 
BirthDate as 'FechaNacimieto', 
HireDate as 'FechaContratacion', 
[address] as 'Direccion', 
city as 'Ciudad', 
PostalCode as 'CodigoPostal', 
Country as 'Pais' 
from [Northwind].dbo.Employees
go

Select * from Empleado2;
Select * from Cliente;
Select * from Empleado;

insert into Empleado(Nombre, Apellido1, Apellido2,CURP,RFC, NumeroExterno, Calle, Salario, NumeroNomina) 
values ('Alan', 'Santiago', 'Molina', '91jwo2912nd', 'ALDJN91212w', 23, 'Calle del infierno', 6890.9,12345),
('Kazumi','Barrera', 'Avila', 'QINS18201', 'ADN19SMDI', null, 'Calle de la vida', 8938.93, 32223),
('Julian','Hernandez', 'Hernandez', 'QIN23201', 'ADN19sdqwDI', null, 'Calle del hambre', 8998.93, 32323),
('Lorena','Lopez', 'Sanchez', 'QI121201', 'ADwwsdaMDI', null, 'Calle de la gordura', 7123.93, 30192);

insert into OrdenCompra
--getdate te da la fecha actual del sistema
values (getdate(), '2024-06-10', 1, 3),
(getdate(), '2024-06-10', 1, 4)

select * from Producto

select * from OrdenCompra

select * from Northwind.dbo.Suppliers

insert into Proveedor
select supplierId, CompanyName,PostalCode,'Calle de la soledad',City,2345  as cp, 
'www.prueba.com.mx' as 'paginaweb' from Northwind.dbo.Suppliers
select*from Proveedor

insert into Producto(NumeroControl, Descripcion, Precio, [Status], Existencia, Proveedorid)
select ProductID, ProductName, UnitPrice, Discontinued ,UnitsInStock, SupplierID from Northwind.dbo.Products

select * from OrdenCompra
insert into DetalleCompra 
values(2,2,10,(select precio from Producto where NumeroControl = 1))
select * from DetalleCompra

update Producto
set Precio = 20.2
where NumeroControl = 1

select * from Producto
where NumeroControl =1

insert into DetalleCompra 
values(2,3,30,(select precio from Producto where NumeroControl = 1))
select * from DetalleCompra

select *, (cantidad * preciocompra) as importe from DetalleCompra 
where ProductoId=1

--Seleccionar el total a pagar de las ordenes que contienen el producto 1
select *, sum(cantidad*preciocompra) as 'total' from DetalleCompra
where ProductoId=2




