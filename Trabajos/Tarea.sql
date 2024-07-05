Use Northwind

ALTER PROCEDURE VentasAnio
    @Anio INT
AS
BEGIN
    SELECT 
        c.CompanyName AS NombreCliente,
		@Anio As Año,
        SUM(od.UnitPrice * od.Quantity) AS TotalVendido,
        COUNT(o.OrderID) AS NumeroDeVentas
    FROM 
        Customers AS c
    INNER JOIN 
        Orders AS o ON c.CustomerID = o.CustomerID
    INNER JOIN 
        [Order Details] AS od ON od.OrderID = o.OrderID
    WHERE 
        YEAR(o.OrderDate) = @Anio
    GROUP BY 
        c.CompanyName
    ORDER BY 
        TotalVendido DESC;
END;

exec VentasAnio @Anio = 1998


--Que inserte un producto
CREATE PROCEDURE AddProduct
	@ProductName VARCHAR(40),
	@SupplierID INT,
	@CategoryID INT,
	@QuantityPerUnit VARCHAR(20),
	@UnitPrice MONEY,
	@UnitsInStock SMALLINT,
	@UnitsOnOrder SMALLINT,
	@ReorderLevel SMALLINT,
	@Discontinued BIT
AS
BEGIN
	INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
	VALUES (@ProductName, @SupplierID, @CategoryID, @QuantityPerUnit, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued);
END;

Select * from Categories
select * from Suppliers

EXEC AddProduct 'Product C', 27, 4, '10 boxes', 123.20, 50, 10, 5, 0;

--Nueva base de datos
CREATE DATABASE AlmacenDeDatos;
USE AlmacenDeDatos;

Create TABLE Suppliers (
    SupplierId INT IDENTITY(1,1) PRIMARY KEY,
    SupplierDB int not null,
    CompanyName VARCHAR(40),
    Country VARCHAR(15),
    Address VARCHAR(60),
    City VARCHAR(15)
);


CREATE TABLE Customers (
    ClientId INT IDENTITY(1,1) PRIMARY KEY,
    ClientDB int not null,
    CompanyName VARCHAR(40),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    Country VARCHAR(15)
);

CREATE TABLE Employees (
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeDB Int not null,
    FullName VARCHAR(110),
    Title VARCHAR(30),
    HireDate DATE,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    Country VARCHAR(15)
);


CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductDB Int not null,
    ProductName VARCHAR(40),
    CategoryName VARCHAR(15)
);


CREATE TABLE Ventas (
    VentaId INT IDENTITY(1,1) PRIMARY KEY,
    ClientId INT,
    ProductId INT,
    EmployeeId INT,
    SupplierId INT,
    Quantity INT,
    UnitPrice Money,
    FOREIGN KEY (ClientId) REFERENCES Customers(ClientId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);


CREATE PROCEDURE InsertSupplier
    @SupplierDB int,
    @CompanyName VARCHAR(40),
    @Country VARCHAR(15),
    @Address VARCHAR(60),
    @City VARCHAR(15)
AS
BEGIN
    INSERT INTO Suppliers (SupplierDB, CompanyName, Country, Address, City)
    VALUES (@SupplierDB, @CompanyName, @Country, @Address, @City);
END;

CREATE PROCEDURE InsertCustomer
    @ClientDB Int,
    @CompanyName VARCHAR(40),
    @Address VARCHAR(60),
    @City VARCHAR(15),
    @Region VARCHAR(15),
    @Country VARCHAR(15)
AS
BEGIN
    INSERT INTO Customers (ClientDB, CompanyName, Address, City, Region, Country)
    VALUES (@ClientDB, @CompanyName, @Address, @City, @Region, @Country);
END;

CREATE PROCEDURE InsertEmployee
    @EmployeeDB int,
    @FullName VARCHAR(110),
    @Title VARCHAR(30),
    @HireDate DATE,
    @Address VARCHAR(60),
    @City VARCHAR(15),
    @Region VARCHAR(15),
    @Country VARCHAR(15)
AS
BEGIN
    INSERT INTO Employees (EmployeeDB, FullName, Title, HireDate, Address, City, Region, Country)
    VALUES (@EmployeeDB, @FullName, @Title, @HireDate, @Address, @City, @Region, @Country);
END;

CREATE PROCEDURE InsertProduct
    @ProductDB Int,
    @ProductName VARCHAR(40),
    @CategoryName VARCHAR(15)
AS
BEGIN
    INSERT INTO Products (ProductDB, ProductName, CategoryName)
    VALUES (@ProductDB, @ProductName, @CategoryName);
END;

CREATE PROCEDURE InsertVenta
    @ClientId INT,
    @ProductId INT,
    @EmployeeId INT,
    @SupplierId INT,
    @Quantity INT,
    @UnitPrice money
AS
BEGIN
    INSERT INTO Ventas (ClientId, ProductId, EmployeeId, SupplierId, Quantity, UnitPrice)
    VALUES (@ClientId, @ProductId, @EmployeeId, @SupplierId, @Quantity, @UnitPrice);
END;


EXEC InsertSupplier 001, 'Supplier A', 'Country A', 'Address A', 'City A';
EXEC InsertSupplier 002, 'Supplier B', 'Country B', 'Address B', 'City B';
EXEC InsertCustomer 101, 'Customer A', 'Address A', 'City A', 'Region A', 'Country A';
EXEC InsertCustomer 102, 'Customer B', 'Address B', 'City B', 'Region B', 'Country B';
EXEC InsertEmployee 201, 'Employee A', 'Title A', '2023-01-01', 'Address A', 'City A', 'Region A', 'Country A';
EXEC InsertEmployee 202, 'Employee B', 'Title B', '2023-02-01', 'Address B', 'City B', 'Region B', 'Country B';
EXEC InsertProduct 301, 'Product A', 'Category A';
EXEC InsertProduct 302, 'Product B', 'Category B';
EXEC InsertVenta 1, 1, 1, 1, 10, 100.00;
EXEC InsertVenta 2, 2, 2, 2, 5, 200.00;


--SP Clientes
CREATE OR ALTER PROCEDURE sp_Actualiza_Inserta_Cliente
AS
BEGIN
UPDATE AlmacenDeDatos.dbo.Customers
	SET 
        ClientDB = n.CustomerID,
        CompanyName = ISNULL(n.CompanyName, 'no tiene CompanyName'),
        [Address] = ISNULL(n.[Address], 'no tiene Address'),
        City = ISNULL(n.City, 'no tiene City'),
        Region = ISNULL(n.Region, 'no tiene Region'),
        Country = ISNULL(n.Country, 'no tiene Country')
    FROM Northwind.dbo.Customers AS n
    INNER JOIN AlmacenDeDatos.dbo.Customers AS a
    ON n.CustomerID = a.ClientDB
    WHERE 
        a.ClientDB <> n.CustomerID OR
        a.CompanyName <> ISNULL(n.CompanyName, 'sin CompanyName') OR
        a.[Address] <> ISNULL(n.[Address], 'sin direccion') OR
        a.City <> ISNULL(n.City, 'sin ciudad') OR
        a.Region <> ISNULL(n.Region, 'sin region') OR
        a.Country <> ISNULL(n.Country, 'sin pais');

-- Insertar registros nuevos
INSERT INTO AlmacenDeDatos.dbo.Customers (ClientDB, CompanyName, [Address], City, Region, Country)
SELECT 
	n.CustomerID,
    ISNULL(n.CompanyName, 'sin CompanyName'),
    ISNULL(n.[Address], 'sin direccion'),
    ISNULL(n.City, 'sin ciudad'),
    ISNULL(n.Region, 'sin region'),
    ISNULL(n.Country, 'sin pais')
FROM Northwind.dbo.Customers AS n
LEFT JOIN AlmacenDeDatos.dbo.Customers AS a
ON n.CustomerID = a.ClientDB
WHERE a.ClientDB IS NULL;
END;


EXEC sp_Actualiza_Inserta_Cliente;

	select * from AlmacenDeDatos.dbo.Customers;
	select * from Northwind.dbo.Customers;

--Employes
CREATE OR ALTER PROCEDURE sp_Employee_insert
AS
BEGIN

-- Actualizar registros existentes
UPDATE AlmacenDeDatos.dbo.Employees
SET 
	EmployeeDB = n.EmployeeID,
    FullName = ISNULL(CONCAT(n.FirstName, ' ', n.LastName), 'sin nombre completo'),
    Title = ISNULL(n.Title, 'sin titulo'),
    HireDate = ISNULL(CONVERT(varchar, n.HireDate, 120), 'Sin fecha de contratación'),
    [Address] = ISNULL(n.[Address], 'Sin direccion'),
    City = ISNULL(n.City, 'sin ciudad'),
    Region = ISNULL(n.Region, 'sin Region'),
    Country = ISNULL(n.Country, 'sin país')
FROM Northwind.dbo.Employees AS n
INNER JOIN AlmacenDeDatos.dbo.Employees AS a
ON n.EmployeeID = a.EmployeeDB
WHERE 
        a.EmployeeDB <> n.EmployeeID OR
        a.FullName <> ISNULL(CONCAT(n.FirstName, ' ', n.LastName), 'sin nombre completo') OR
        a.Title <> ISNULL(n.Title, 'sin titulo') OR
        a.HireDate <> ISNULL(CONVERT(varchar, n.HireDate, 120), 'Sin fecha de contratación') OR
        a.[Address] <> ISNULL(n.[Address], 'Sin direccion') OR
        a.City <> ISNULL(n.City, 'sin ciudad') OR
        a.Region <> ISNULL(n.Region, 'sin Region') OR
        a.Country <> ISNULL(n.Country, 'sin país');

-- Insertar registros nuevos
INSERT INTO AlmacenDeDatos.dbo.Employees (EmployeeDB, FullName, Title, HireDate, [Address], City, Region, Country)
SELECT 
	n.EmployeeID,
    ISNULL(CONCAT(n.FirstName, ' ', n.LastName), 'sin nombre completo'),
    ISNULL(n.Title, 'sin titulo'),
    ISNULL(CONVERT(varchar, n.HireDate, 120), 'Sin fecha de contratación'),
    ISNULL(n.[Address], 'Sin direccion'),
    ISNULL(n.City, 'sin ciudad'),
    ISNULL(n.Region, 'sin Region'),
    ISNULL(n.Country, 'sin país')
FROM Northwind.dbo.Employees AS n
LEFT JOIN AlmacenDeDatos.dbo.Employees AS a
ON n.EmployeeID = a.EmployeeDB
WHERE a.EmployeeDB IS NULL;
END;


EXEC sp_Employee_insert;

	select * from AlmacenDeDatos.dbo.Employees;
	select * from Northwind.dbo.Employees;

--Suppliers
CREATE OR ALTER PROCEDURE sp_Suppliers_Update_Insert
AS
BEGIN
-- Actualizar registros existentes
UPDATE AlmacenDeDatos.dbo.Suppliers
SET 
	SupplierDB = n.SupplierID,
	CompanyName = ISNULL(n.CompanyName, 'Sin CompanyName'),
    Country = ISNULL(n.Country, 'Sin pais'),
    [Address] = ISNULL(n.[Address], 'Sin direccion'),
    City = ISNULL(n.City, 'sin ciudad')
FROM Northwind.dbo.Suppliers AS n
INNER JOIN AlmacenDeDatos.dbo.Suppliers AS a
ON n.SupplierID = a.SupplierDB
WHERE 
	a.SupplierDB <> n.SupplierID OR
    a.CompanyName <> ISNULL(n.CompanyName, 'Sin CompanyName') OR
    a.Country <> ISNULL(n.Country, 'Sin pais') OR
    a.[Address] <> ISNULL(n.[Address], 'Sin direccion') OR
    a.City <> ISNULL(n.City, 'sin ciudad');

-- Insertar registros nuevos
INSERT INTO AlmacenDeDatos.dbo.Suppliers(SupplierDB, CompanyName, Country, [Address], City)
SELECT 
	n.SupplierID,
    ISNULL(n.CompanyName, 'Sin CompanyName'),
    ISNULL(n.Country, 'Sin pais'),
    ISNULL(n.[Address], 'Sin direccion'),
    ISNULL(n.City, 'sin ciudad')
FROM Northwind.dbo.Suppliers AS n
LEFT JOIN AlmacenDeDatos.dbo.Suppliers AS a
ON n.SupplierID = a.SupplierDB
WHERE a.SupplierDB IS NULL;
END;

EXEC sp_Suppliers_Update_Insert;

	select * from AlmacenDeDatos.dbo.Suppliers;
	select * from Northwind.dbo.Suppliers;

--Product
CREATE OR ALTER PROCEDURE sp_Product_insert_update
AS
BEGIN
-- Actualizar registros existentes
UPDATE AlmacenDeDatos.dbo.Products
SET 
	ProductDB = n.ProductID,
	ProductName = ISNULL(n.ProductName, 'Sin nombre de producto'),
	CategoryName = ISNULL(na.CategoryName, 'sin Categoria')
FROM Northwind.dbo.Products AS n
INNER JOIN AlmacenDeDatos.dbo.Products AS a
ON n.ProductID = a.ProductDB
INNER JOIN Northwind.dbo.Categories AS na
ON n.CategoryID = na.CategoryID
WHERE 
	a.ProductDB <> n.ProductID OR
    a.ProductName <> ISNULL(n.ProductName, 'Sin nombre de producto') OR
	a.CategoryName <> ISNULL(na.CategoryName, 'sin Categoria');

-- Insertar registros nuevos
INSERT INTO AlmacenDeDatos.dbo.Products(ProductDB, ProductName, CategoryName)
SELECT 
	n.ProductID,
    ISNULL(n.ProductName, 'Sin nombre de producto'),
    ISNULL(na.CategoryName, 'sin Categoria')
        
FROM Northwind.dbo.Products AS n
LEFT JOIN AlmacenDeDatos.dbo.Products AS a
ON n.ProductID = a.ProductDB
LEFT JOIN Northwind.dbo.Categories AS na
ON n.CategoryID = na.CategoryID
WHERE a.ProductDB IS NULL;
END;

EXEC sp_Product_insert_update;

select * from AlmacenDeDatos.dbo.Suppliers;
select * from Northwind.dbo.Suppliers;


