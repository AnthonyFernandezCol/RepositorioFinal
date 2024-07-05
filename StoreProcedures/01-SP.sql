Declare @x int
set @x = 10
print 'El valor de x es ' + CAST(@x as varchar)

If @x >= 0 
BEGIN
Print 'El número es positivo' END
else begin 
print 'El número es negativo'
end

declare @i as int
set @i=1
while(@i<=10)
BEGIN
print cast(@i as varchar)
set @i=@i+1
end

--Crear SP
Create PROCEDURE procedure_ciclo 
AS
    Declare @x int
        set @x = 10
        print 'El valor de x es ' + CAST(@x as varchar)
    If @x >= 0 
    BEGIN
        Print 'El número es positivo' END
        else begin 
            print 'El número es negativo'
        end
    declare @i as int
        set @i=1
            while(@i<=10)
        BEGIN
            print cast(@i as varchar)
            set @i=@i+1
    end

declare @ii int = 1
while @ii <= 2
BEGIN
    exec procedure_ciclo
    set @ii=@ii+1
end

--Realizar un sp que sume dos numeros cualquiera y que importe el resultado
Create PROCEDURE sp_suma1
AS
DECLARE @u INT = 3, @uu INT = 4
BEGIN
    DECLARE @suma INT
    SET @suma = @u + @uu
    PRINT 'La suma de los dos números es ' + CAST(@suma AS VARCHAR)
    END

drop PROCEDURE procedure_ciclo