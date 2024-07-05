--Funciones de fecha
use Northwind

select GETDATE()

select DATEPART(year, '2024-06-06') as 'Año',
DATEPART(month, '2024-06-06') AS 'Mes',
DATEPART(day, '2024-06-06') as 'Día',
DATEPART(quarter, '2024-06-06') as 'Trimestre',
DATEPART(week, '2024-06-06') as 'Semana',
DATEPART(weekday, '2024-06-06') as 'Día de la semana';

SELECT DATEPART(year, OrderDate) as 'Año',
DATEPART(month, OrderDate) AS 'Mes',
DATEPART(day, OrderDate) as 'Día',
DATEPART(quarter, OrderDate) as 'Trimestre',
DATEPART(weekday, OrderDate) as 'Día de la semana',
DATEPART(week, OrderDate) as 'Semana' FROM orders

--Funcion que regresa el nombre de un mes, semana, día
SELECT DATENAME(month, GETDATE()) as 'Mes', DATENAME(weekday, GETDATE()) as 'Día'

set LANGUAGE Spanish

--Funcion para obtener la diferencia entre años, dias, meses, etc
select DATEDIFF(year, '1983-04-06', GETDATE()) as 'Tiempo de vejez'
select * from orders 