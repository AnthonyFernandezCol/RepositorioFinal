create database BD_Ventas
use BD_Ventas

	CREATE TABLE Proveedores(
	ID_Proveedor INT identity PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
	Calle VARCHAR (30) NOT NULL,
	N�mero VARCHAR (10)NOT NULL,
	Colonia VARCHAR (30)NOT NULL,
	Ciudad VARCHAR (30)NOT NULL,
	Estado	VARCHAR (30) NOT NULL,
    Pa�s VARCHAR (30)NOT NULL,
	Tel�fono VARCHAR (10)NOT NULL,
	P�ginaweb VARCHAR (30)NOT NULL,
   )

    CREATE TABLE Clientes(
	ID_Cliente INT identity PRIMARY KEY,
	Nombre VARCHAR (30) NOT NULL,
    Calle VARCHAR (30)NOT NULL,
	N�mero VARCHAR (10)NOT NULL,
	Colonia VARCHAR (30)NOT NULL,
	Ciudad VARCHAR (30)NOT NULL,
	Estado VARCHAR (30)NOT NULL,
	Pa�s VARCHAR (30)NOT NULL,
	)

	CREATE TABLE Categor�as(
	ID_Categor�a INT identity PRIMARY KEY,
	Nombre VARCHAR (30)NOT NULL,
	Descripci�n VARCHAR (30)NOT NULL,
	)

	CREATE TABLE Productos(
	ID_Producto INT identity PRIMARY KEY,
	Nombre VARCHAR (30)NOT NULL,
	PrecioActual float NOT NULL,
	Stock float NOT NULL,
	ID_Proveedor INT foreign key references Proveedores(ID_Proveedor),
	ID_Categor�a INT FOREIGN KEY REFERENCES Categor�as(ID_Categor�a),
	)

	CREATE TABLE Ventas(
	N�meroDeFactura INT identity PRIMARY KEY,
	Fecha varchar (30) NOT NULL,
	ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente),
	Descuento float NOT NULL,
	MontoFinal float NOT NULL,
	)

	Create table DetallesDeVenta(
	ID_Detalle INT identity PRIMARY KEY,
	N�meroDeFactura INT FOREIGN KEY REFERENCES Ventas(N�meroDeFactura),
	ID_Producto INT FOREIGN KEY REFERENCES Productos(ID_Producto),
	PrecioAlMomentoDeLaVenta float NOT NULL,
	CantidadVendida int NOT NULL,
	MontoTotalPorProducto float NOT NULL,
	)


	Insert into BD_Ventas.dbo.Proveedores(Nombre,Calle,N�mero,Colonia,Ciudad,Estado,Pa�s,Tel�fono,P�ginaweb) 
	VALUES
	('Eduardo Per�z Villegas', 'Vicente Guerrero', '17', 'Cerro colorado', 'Tula de Allende', 'Hidalgo', 'M�xico', '7721497809', 'www.MercadoLibre.com'),
	('Ana L�pez Carbajal', 'Paseo de la Reforma','245', 'Centro', 'Ciudad de M�xico', 'Ciudad de M�xico', 'M�xico', '5555555555', 'www.Panaderia.com'),
	('Juan Garc�a','Avenida Ju�rez','123','La Condesa','Ciudad de M�xico','Ciudad de M�xico','M�xico','5555555556','www.Cemento.com'),
	('Mar�a P�rez','Calle Mayor','456','San Miguel Chapultepec','Ciudad de M�xico','Ciudad de M�xico','M�xico','5555555557','www.Cementocruzazul.com'),
	('Pedro Rodr�guez','Calle del Sol', '789','Roma Norte', 'Ciudad de M�xico','Ciudad de M�xico', 'M�xico','5555555558','www.amzaon.com'),
	('Ana Mart�nez', 'Calle de la Luna', '1011', 'Oriente', 'Puebla', 'Puebla', 'M�xico', '5555555558','www.Objetosraros.com'),
	('Roberto Gonz�lez', 'Calle del Bosque', '1213', 'Poniente', 'Tijuana', 'Baja California', 'M�xico', '5555555559','www.Dejapon.com'),
	('Laura Rodr�guez', 'Calle Real', '1415', 'Centro', 'Veracruz', 'Veracruz', 'M�xico', '5555555560','www.CosasChilenas.com'),
	('Carlos Flores', 'Calle Constituci�n', '1617', 'Norte', 'Hermosillo', 'Sonora', 'M�xico', '5555555561','www.Shein.com'),
	('Sandra Ram�rez', 'Calle Independencia', '1819', 'Sur', 'M�rida', 'Yucat�n', 'M�xico', '5555555562','www.Coppel.com');

	Insert into BD_Ventas.dbo.Clientes(Nombre,Calle,N�mero,Colonia,Ciudad,Estado,Pa�s) 
	VALUES
	('Jose Eduardo Per�z', 'Juan de la barrera', '47', 'Jorobas', 'Tula de Allende', 'Hidalgo', 'M�xico'),
	('Rodrigo Juarez', '13 de Marzo','45', 'Centro', 'Jarabe', 'Jalisco', 'M�xico'),
	('Ana Garc�a','Calle Mayor','123','Centro','Ciudad de M�xico','CDMX','M�xico'),
	('Juan P�rez','Avenida Ju�rez','456','Norte','Monterrey','Nuevo Le�n','M�xico'),
	('Mar�a L�pez','Calle del Sol','789','Sur','Guadalajara','Jalisco','M�xico'),
	('Pedro Mart�nez','Calle de la Luna','1011','Este','Puebla','Puebla','M�xico'),
	('Sof�a Gonz�lez','Calle de las Flores','1213','Centro Hist�rico','Veracruz','Veracruz','M�xico'),
	('Diego Rodr�guez','Callej�n del �ngel','1415','Noroeste','Tijuana','Baja California','M�xico'),
	('Camila Hern�ndez','Avenida Independencia','1617','Sureste','Hermosillo','Sonora','M�xico'),
	('Santiago Flores','Callej�n de la Virgen','1819','Noreste','Chihuahua','Chihuahua','M�xico');

	Insert into BD_Ventas.dbo.Categor�as(Nombre,Descripci�n) 
	VALUES
	('Ropa', 'Ropa para todo tipo de personas'),
	('Electrodomesticos', 'Productos para el hogar'),
	('Tecnolog�a', 'Productos tecnologicos'),
	('Escolares', 'Productos para estudiar');

	Insert into BD_Ventas.dbo.Productos(Nombre,PrecioActual,Stock, ID_Proveedor, ID_Categor�a) 
	VALUES
	('Camiseta b�sica', '15.99', '100','3','1'),
	('Zapatos deportivos', '49.99', '50', '2', '1'),
	('Mochila escolar', '29.99', '75', '1', '4'),
	('Auriculares inal�mbricos', '89.99', '25', '5','3'),
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

	Insert into BD_Ventas.dbo.DetallesDeVenta(N�meroDeFactura, ID_Producto,PrecioAlMomentoDeLaVenta, CantidadVendida,MontoTotalPorProducto) 
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
	where Nombre = 'Eduardo Per�z Villegas'

	--Buscar categor�a "Ropa"
	select * from Categor�as where Nombre = 'Ropa'

	--Clcular cantidad final de productos vendidos
	Select ID_Producto, SUM(CantidadVendida) as Cantidad_Vendida, SUM(MontoTotalPorProducto) as Cantidad_Final from DetallesDeVenta group by ID_Producto
	select SUM(MontoTotalPorProducto) as Cantidad_Vendida_Total from DetallesDeVenta


	

