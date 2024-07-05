create database repasojoins;
use repasojoins;

create table proveedor(
    provid int not null identity(1,1),
    nombre varchar(50) not null, 
    limite_credito money not null,
    CONSTRAINT pk_proveedor
    primary key (provid)
);

create table producto(
    prodid int not null identity (1,1),
    nombre varchar (100) not null,
    existencia int not null,
    precio money not null,
    proveedor int,
    CONSTRAINT pk_producto
    primary key (prodid),
    CONSTRAINT fk_producto_proveedor
    FOREIGN KEY (proveedor)
    references proveedor(provid)
);

--Insertar datos en las tablas 
insert into proveedor (nombre, limite_credito)
values  ('proveedor1', 10000),
        ('proveedor2', 20000),
        ('proveedor3', 30000),
        ('proveedor4', 40000),
        ('proveedor5', 50000);

INSERT INTO producto(nombre, existencia, precio, proveedor)
VALUES  ('producto1', 34, 45.6, 1),
        ('producto2', 34, 45.6, 1),
        ('producto3', 34, 45.6, 1),
        ('producto4', 34, 45.6, 1),
        ('producto5', 34, 45.6, 1);

--Consultar inner join
SELECT pr.nombre as 'Nombre_Producto', pr.precio as 'Precio', pr.existencia as 'Existencia', p.provid, p.nombre as 'Proveedor' FROM proveedor as p
LEFT JOIN producto as pr
on pr.proveedor = p.provid;

update proveedor 
set nombre = 'proveedor6'
where provid = 5;

select * from proveedor

update proveedor 
set nombre = 'proveedor5'
where provid = 5;

insert into proveedor (nombre, limite_credito)
Values ('Proveedor6', 450000);

--Se elimina un registro
delete from proveedor 
where provid = 7

--Utilizando RIGTH JOIN
SELECT pr.prodid , pr.nombre as 'Nombre_Producto', pr.precio as [Precio],
pr.existencia as [Existencia], p.provid, p.nombre as 'Proveedor'
from proveedor as [p]
right join 
producto as [pr]
on p.provid = pr.proveedor;

insert into producto(nombre, precio,existencia,proveedor)
VALUES ('producto5', 78.8, 22, null);

--Full join
SELECT pr.prodid , pr.nombre as 'Nombre_Producto', pr.precio as [Precio],
pr.existencia as [Existencia], p.provid, p.nombre as 'Proveedor'
from proveedor as [p]
FULL join 
producto as [pr]
on p.provid = pr.proveedor;

--Seleccionar todos los proveedores que no tienen asigandos  productos
SELECT p.provid, p.nombre as 'Proveedor'
from proveedor as [p]
FULL join 
producto as [pr]
on p.provid = pr.proveedor
where prodid is null;

--Seleccionar todos los productos que no tienen proveedor
SELECT pr.prodid , pr.nombre as 'Nombre_Producto', pr.precio as [Precio],
pr.existencia as [Existencia]
from producto as [pr]
LEFT join 
proveedor as [p]
on p.provid = pr.proveedor
where p.provid is null;