--Parametros de Salida

--Crear Store Procedure que calcule el area de un circulo
Create or alter proc sp_area_circulo
@radio float, --Parametro de entrada
@area float output --Parametro de salida
AS
BEGIN
	SET @area = PI() * @radio * @radio;
END;

Declare @resultado float
exec sp_area_circulo 22.3, @area = @resultado output
Print 'El valor del area es= ' + cast(@resultado as varchar);
GO

--Obtener el nombre de un empleado dado
CREATE OR ALTER PROCEDURE sp_obtenerinfo_empleado
    @employeeid INT = -1,
    @apellido NVARCHAR(20) OUTPUT,
    @nombre NVARCHAR(10) OUTPUT
AS
BEGIN
    IF @employeeid <> -1
    BEGIN
        SELECT @nombre = FirstName, @apellido = LastName 
        FROM Employees
        WHERE EmployeeID = @employeeid;
    END
    ELSE
    BEGIN
        PRINT('El valor del empleado no es válido');
    END
END;

Declare @firstname as nvarchar(10),
@lastname as nvarchar(20)

exec sp_obtenerinfo_empleado @employeeid= 1, @apellido = @lastname output, @nombre = @firstname output;
Print('El nombre es: ' + @firstname)
print('El apellido es: ' + @lastname);

----------------------------------------------------------------------------------------------------------------------
Declare @firstname as nvarchar(10),
@lastname as nvarchar(20)

exec sp_obtenerinfo_empleado @apellido = @lastname output, @nombre = @firstname output;
Print('El nombre es: ' + @firstname)
print('El apellido es: ' + @lastname);

---------------------------------------------------------------------------------------------------------------------
create or alter proc sp_obtener_informacion_empleado2
@employeeid int = -1,
@apellido nvarchar(20) output,
@nombre as nvarchar(10) output
AS
begin

   DECLARE @existe int
   set @existe=(select count(*) from Employees where EmployeeID =@employeeid)
   -- select @existe = count(*) from Employees where EmployeeID =@employeeid
   

   IF @existe > 0
   begin
    Select @nombre = FirstName, @apellido=lastname
    from Employees
    where EmployeeID = @employeeid
   end
   else
   begin
   if @existe = 0
   begin
      print 'El id del empleado no existe'
   end
  end
end;

declare @firstname as nvarchar(10),
@lastname nvarchar(20)

exec sp_obtener_informacion_empleado2 @employeeid = 2,
@nombre=@firstname output, @apellido = @lastname output

print ('El nombre es: ' + @firstname)
print ('El apellido es: ' + @lastname)

------------------------------------------------------------------------------------------------
--Realizar un store procedure que guarde en una variable de salida el total de compras que ha realizado un cliente dado en un rango de fechas
Create or alter proc sp_totalcompras_cliente
@totalCompras decimal(10,2) output,
@ClienteID nvarchar(5),
@fechainicial date,
@fechafinal date
AS
Begin
Select @totalCompras = SUM(od.Quantity*od.UnitPrice) from [Order Details] as od
inner join orders as o
on od.OrderID = o.OrderID
where CustomerID = @ClienteID AND
O.OrderDate Between @fechainicial AND @fechafinal
end;


