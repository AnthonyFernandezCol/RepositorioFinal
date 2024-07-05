create database Ejemplo
Create TABLE Clientes(
Id INT identity PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
apellido Varchar (50) NOT NULL,
edad int constraint chk_edad check (edad >= 18 and edad<=70),
telefono VARCHAR(10) UNIQUE CHECK (telefono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
email VARCHAR(100) CHECK (email LIKE '%_@_%._%') not null
);

Insert into Clientes values('Eduardo', 'Jimenez', '20','7731907689','eduardo@gmail.com');

DROP TABLE Clientes

CREATE TABLE Proveedor(
ID_Proveedor INT IDENTITY PRIMARY KEY,
Nombre_Prov VARCHAR (100) UNIQUE not null,
Telefono_Prov VARCHAR (50) UNIQUE CHECK (Telefono_Prov LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
Página VARCHAR(100) CHECK (Página LIKE '%_._%._%') not null
);

CREATE TABLE Producto(
ID_Producto INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(50) not null,
Stock INT CONSTRAINT chk_Stock check (Stock > 0 ),
Precio Decimal CONSTRAINT chk_Precio check (Precio > 0),
Proveedores INT FOREIGN KEY REFERENCES Proveedor
);

Insert into Producto values('Celular', '4','150','4');






