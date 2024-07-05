-- Crear base de datos para demostrar el uso del JOIN
create database PruebaJoins

use PruebaJoins

create table categoria(
    categoriaid int not null identity (1,1),
    nombre VARCHAR(50) not null DEFAULT 'No categoria', 
    CONSTRAINT pk_categoria
    PRIMARY key (categoriaid)
);

create table producto(
productoid int not null identity(1,1),
nombre varchar(50) not null,
existencia int not null,
precio money not null,
categoriaid int,
constraint pk_producto
primary key(productoid),
constraint unico_nombre
unique (nombre),
constraint fk_producto_categoria
FOREIGN key (categoriaid)
references categoria(categoriaid)
);

--Agregar registros a la tabla categoria
insert into categoria(nombre)
values ('LB'),
        ('LACTEOS'),
        ('ROPA'),
        ('BEBIDAS'),
        ('CARNES FRIAS');

SELECT * FROM categoria

insert into producto(nombre, existencia, precio, categoriaid)
VALUES ('REFRIGERADOR', 3 , 10000.0, 1),
        ('ESTUFA', 3, 9000.04, 1),
        ('CREMA', 2, 10.5, 2),
        ('YOGURT', 3, 13.45, 2);

SELECT * FROM producto

--Borrar identitys
DBCC CHECKIDENT (Tname, reseed, 0);

--Utilizando un Join
SELECT * FROM producto as p
JOIN categoria as c 
on p.categoriaid = c.categoriaid

--Utilizando un left join
SELECT * FROM categoria as p
LEFT JOIN producto as c 
on p.categoriaid = c.categoriaid

--Utilizando un RIGHT JOIN
SELECT * FROM producto as p
RIGHT JOIN categoria as c 
on p.categoriaid = c.categoriaid

--seleccionar todas las categorias que no tienen asignado productos
SELECT c.categoriaid, c.nombre FROM categoria as c 
LEFT JOIN producto as p
on p.categoriaid = c.categoriaid
where p.productoid is null;

--CON FULL JOIN
SELECT * FROM producto as p
FULL JOIN categoria as c 
on p.categoriaid = c.categoriaid

--Crear una base de datos llamada ejercicio join
create database EjercicioJoins

use EjercicioJoins

--Crear una tabla que se llame productos o empleados tomando como base la tabla employees de northwind no tomar todos los campos
select top 0 EmployeeID as 'EmpleadoId', 
CONCAT(firstname, ' ', lastname) as 'FullName', 
title AS 'Titulo',
hiredate as 'FechaDeContratación' 
into EjercicioJoins.dbo.Empleado from [Northwind].dbo.Employees

select * from EjercicioJoins.dbo.Empleado

--llenar la tabla con una consulta a la tabla employees


--agregar nuevos datos a la tabla empleados por lo menos 2
insert into Empleado(EmpleadoId, FullName, Titulo, FechaDeContratación )
select EmployeeID as 'EmpleadoId', 
CONCAT(firstname, ' ', lastname) as 'FullName', 
title AS 'Titulo',
hiredate as 'FechaDeContratación' 
from [Northwind].dbo.Employees

select top 0 * 
into EjercicioJoins.dbo.dimempleados
from EjercicioJoins.dbo.Empleado



--llenar o actualizar la tabla empleados co  los nuevos registros la cual se encontrara en una nueva tabla llamada dim_producto




