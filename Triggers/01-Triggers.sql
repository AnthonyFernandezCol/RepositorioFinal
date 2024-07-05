--Sintaxis
--Create Trigger [Nombre Trigger]
--On [Nombre Tabla]
--AFTER [Insert, Delete, Uptdate]
--AS
--Begin
--....
--END;

Create database PruebaTriggers
Go

use PruebaTriggers
Go

Create table tabla1
(id int not null primary key,
nombre Varchar(50) not null,)

--Trigger

--Trigger que verifica el evento que se ejecuto
Create trigger tg_verificar_insercion
on tabla1
after insert
as 
begin
Print('Se ejecuto el evento insert en la "tabla1"')
end;

Insert into PruebaTriggers.dbo.tabla1(id,nombre)
values(1,'Nombre1');

------------------------------------------------------------
Create trigger tg_verificar_delete
on tabla1
after delete
as 
begin
Print('Se ejecuto el evento delete en la "tabla1"')
end;

delete tabla1
where id = 1;

-----------------------------------------------------------
Create trigger tg_verificar_update
on tabla1
after update
as 
begin
Print('Se ejecuto el evento update en la "tabla1"')
end;

update tabla1
set nombre = 'Nombre1'
where id = 1;
--------------------------------------------------------------
Drop trigger tg_verificar_delete

Drop trigger tg_verificar_update

Drop trigger tg_verificar_insercion

-------------------------------------------------------------
Create trigger verificar_contenido_inserted
on tabla1
after insert
as 
begin
--Ver los datos de la tabla inserted
select * from inserted;
end;

insert into tabla1 values(2,'nombre2');

select*from tabla1

Insert into tabla1 values(3,'Nombre3'),
(4, 'Nombre4'), (5, 'Nombre5')

--------------------------------------------------------------
Use Northwind

Create or alter Trigger Verificar_inserted_categories
on Categories
after insert
as 
begin
select categoryid, categoryname, [description] from inserted;
end;

insert into categories(categoryname,[description]) values ('Categoria Nueva', 'Prueba de Triggers')
----------------------------------------------------------------------------------------------------
Create or alter Trigger Verificar_update_categories
on Categories
after update
as 
begin
select categoryid, categoryname, [description] from inserted;
select categoryid, categoryname, [description] from deleted;
end;

select * from categories

update Northwind.dbo.Categories
set categoryname = 'Categoriaprueba',
	[description] = 'Si esta bien'
where categoryid = 9;
--------------------------------------------------------------
Drop trigger Verificar_update_categories

Drop trigger Verificar_inserted_categories

-------------------------------------------------------------
Create or alter trigger Verificar_inserted_categories
on categories
after insert,update,delete
as begin
	if exists(select 1 from inserted) and not exists(Select 1 from deleted)
	begin
		print('Existen datos en la tabla Inserted, se ejecuto un insert')
	end
	if exists(Select 1 from deleted) and not exists(select 1 from inserted)
	begin
		Print('Existen datos en la tabla delete, se ejecuto un delete')
	end
	else if exists(select 1 from inserted) and exists(Select 1 from deleted)
	begin
		Print('Existen datos en las dos tablas, se ejecuto un update')
	end
end;

insert into categories(Categoryname, [description]) values ('categoria21', 'XD')

select*from categories

delete categories
where categoryid = 10;

update categories
set categoryname = 'PruebaCategoria',
	[Description] = 'Nmms'
where categoryid = 9;
------------------------------------------------------------------------------
--Hace un waypoint y si haces algo que no querias, con el rollback puedes deshacerlo
begin transaction
rollback

------------------------------------------------------------------------------
--Crear un trigger en la base de datos prueba triggers, para la tabla empleados, debe evitar que se inserten o modifiquen salarios mayores a 50,000
Use PruebaTriggers

create table Empleado(
empleadoid int not null primary key,
nombre varchar(50) not null,
salario money not null)

create or alter trigger verificar_salario
on Empleado
after update, insert
as begin
	if exists(select 1 from inserted) and not exists(Select 1 from deleted)
	begin
		declare @SalarioNuevo money
		set @SalarioNuevo = (Select salario from inserted);

		if @SalarioNuevo > 50000
		begin
			raiserror('El salario es mayor a 50000 y no esta permitido', 16,1);
			Rollback transaction;
		end
	end
end;

----------------------------------------------------------------------------------------------------------------------------------
