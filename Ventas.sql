create database BD_Ventas
use BD_Ventas

	CREATE TABLE Proveedores(
	ID_Proveedor INT identity PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
	Calle VARCHAR (30) NOT NULL,
	Número VARCHAR (10)NOT NULL,
	Colonia VARCHAR (30)NOT NULL,
	Ciudad VARCHAR (30)NOT NULL,
	Estado	VARCHAR (30) NOT NULL,
    País VARCHAR (30)NOT NULL,
	Teléfono VARCHAR (10)NOT NULL,
	Páginaweb VARCHAR (30)NOT NULL,
   )

    CREATE TABLE Clientes(
	ID_Cliente INT identity PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
    Calle VARCHAR (30)NOT NULL,
	Número VARCHAR (10)NOT NULL,
	Colonia VARCHAR (30)NOT NULL,
	Ciudad VARCHAR (30)NOT NULL,
	Estado VARCHAR (30)NOT NULL,
	País VARCHAR (30)NOT NULL,
	)

	CREATE TABLE Categorías(
	ID_Categoría INT identity PRIMARY KEY,
	Nombre VARCHAR (30)NOT NULL,
	Descripción VARCHAR (30)NOT NULL,
	)

	CREATE TABLE Productos(
	ID_Producto INT identity PRIMARY KEY,
	Nombre VARCHAR (30)NOT NULL,
	PrecioActual float NOT NULL,
	Stock float NOT NULL,
	ID_Proveedor INT foreign key references Proveedores(ID_Proveedor),
	ID_Categoría INT FOREIGN KEY REFERENCES Categorías(ID_Categoría),
	)

	CREATE TABLE Ventas(
	NúmeroDeFactura INT identity PRIMARY KEY,
	Fecha varchar (30) NOT NULL,
	ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente),
	Descuento float NOT NULL,
	MontoFinal float NOT NULL,
	)

	Create table DetallesDeVenta(
	ID_Detalle INT identity PRIMARY KEY,
	NúmeroDeFactura INT FOREIGN KEY REFERENCES Ventas(NúmeroDeFactura),
	ID_Producto INT FOREIGN KEY REFERENCES Productos(ID_Producto),
	PrecioAlMomentoDeLaVenta float NOT NULL,
	CantidadVendida int NOT NULL,
	MontoTotalPorProducto float NOT NULL,
	)


	Insert into BD_Ventas.dbo.Proveedores(Nombre,Calle,Número,Colonia,Ciudad,Estado,País,Teléfono,Páginaweb) 
	VALUES
	('Eduardo Peréz Villegas', 'Vicente Guerrero', '17', 'Cerro colorado', 'Tula de Allende', 'Hidalgo', 'México', '7721497809', 'www.MercadoLibre.com'),
	('Ana López Carbajal', 'Paseo de la Reforma','245', 'Centro', 'Ciudad de México', 'Ciudad de México', 'México', '5555555555', 'www.Panaderia.com'),
	('Juan García','Avenida Juárez','123','La Condesa','Ciudad de México','Ciudad de México','México','5555555556','www.Cemento.com'),
	('María Pérez','Calle Mayor','456','San Miguel Chapultepec','Ciudad de México','Ciudad de México','México','5555555557','www.Cementocruzazul.com'),
	('Pedro Rodríguez','Calle del Sol', '789','Roma Norte', 'Ciudad de México','Ciudad de México', 'México','5555555558','www.amzaon.com'),
	('Ana Martínez', 'Calle de la Luna', '1011', 'Oriente', 'Puebla', 'Puebla', 'México', '5555555558','www.Objetosraros.com'),
	('Roberto González', 'Calle del Bosque', '1213', 'Poniente', 'Tijuana', 'Baja California', 'México', '5555555559','www.Dejapon.com'),
	('Laura Rodríguez', 'Calle Real', '1415', 'Centro', 'Veracruz', 'Veracruz', 'México', '5555555560','www.CosasChilenas.com'),
	('Carlos Flores', 'Calle Constitución', '1617', 'Norte', 'Hermosillo', 'Sonora', 'México', '5555555561','www.Shein.com'),
	('Sandra Ramírez', 'Calle Independencia', '1819', 'Sur', 'Mérida', 'Yucatán', 'México', '5555555562','www.Coppel.com');

	Insert into BD_Ventas.dbo.Clientes(Nombre,Calle,Número,Colonia,Ciudad,Estado,País) 
	VALUES
	('Jose Eduardo Peréz', 'Juan de la barrera', '47', 'Jorobas', 'Tula de Allende', 'Hidalgo', 'México'),
	('Rodrigo Juarez', '13 de Marzo','45', 'Centro', 'Jarabe', 'Jalisco', 'México'),
	('Ana García','Calle Mayor','123','Centro','Ciudad de México','CDMX','México'),
	('Juan Pérez','Avenida Juárez','456','Norte','Monterrey','Nuevo León','México'),
	('María López','Calle del Sol','789','Sur','Guadalajara','Jalisco','México'),
	('Pedro Martínez','Calle de la Luna','1011','Este','Puebla','Puebla','México'),
	('Sofía González','Calle de las Flores','1213','Centro Histórico','Veracruz','Veracruz','México'),
	('Diego Rodríguez','Callejón del Ángel','1415','Noroeste','Tijuana','Baja California','México'),
	('Camila Hernández','Avenida Independencia','1617','Sureste','Hermosillo','Sonora','México'),
	('Santiago Flores','Callejón de la Virgen','1819','Noreste','Chihuahua','Chihuahua','México');

	Insert into BD_Ventas.dbo.Categorías(Nombre,Descripción) 
	VALUES
	('Ropa', 'Ropa para todo tipo de personas'),
	('Electrodomesticos', 'Productos para el hogar'),
	('Tecnología', 'Productos tecnologicos'),
	('Escolares', 'Productos para estudiar');

	Insert into BD_Ventas.dbo.Productos(Nombre,PrecioActual,Stock, ID_Proveedor, ID_Categoría) 
	VALUES
	('Camiseta básica', '15.99', '100','3','1'),
	('Zapatos deportivos', '49.99', '50', '2', '1'),
	('Mochila escolar', '29.99', '75', '1', '4'),
	('Auriculares inalámbricos', '89.99', '25', '5','3'),
	('Libro de cocina', '24.99', '30', '1', '4'),
	('Smartphone', '399.99', '15','5','3'),
	('Smartwatch', '249.99', '20','1','3'),
	('Televisor LED', '499.99', '10','5','3'),
	('Lavadora', '599.99', '5','1','2'),
	('Refrigerador', '1299.99', '3','5','2');

	Insert into BD_Ventas.dbo.Ventas(Fecha,ID_Cliente,Descuento,MontoFinal) 
	VALUES
	('20/04/2023', '1', '0','15.99'),
	('04/06/2023', '2', '0','29.99'),
	('14/11/2023', '5', '0','624.98'),
	('25/05/2023', '4', '0','1299.99'),
	('19/12/2023', '9', '0','89.99');

	Insert into BD_Ventas.dbo.DetallesDeVenta(NúmeroDeFactura, ID_Producto,PrecioAlMomentoDeLaVenta, CantidadVendida,MontoTotalPorProducto) 
	VALUES
	('1', '1', '15.99','1','15.99'),
	('2', '3', '29.99','1','29.99'),
	('3', '9', '599.99','1','599.99'),
	('4', '5', '24.99','1','24.99'),
	('5', '10', '1299.99','1','1299.99'),
	('6', '4', '89.99','1','89.99');

	-- Mostrar todos los clientes de Hidalgo
	select * from Clientes
	Where Estado='Hidalgo'

	--Buscar proveedor por nombre 
	select * from Proveedores
	where Nombre = 'Eduardo Peréz Villegas'

	--Buscar categoría "Ropa"
	select * from Categorías where Nombre = 'Ropa'

	--Clcular cantidad final de productos vendidos
	Select ID_Producto, SUM(CantidadVendida) as Cantidad_Vendida, SUM(MontoTotalPorProducto) as Cantidad_Final from DetallesDeVenta group by ID_Producto
	select SUM(MontoTotalPorProducto) as Cantidad_Vendida_Total from DetallesDeVenta


	

