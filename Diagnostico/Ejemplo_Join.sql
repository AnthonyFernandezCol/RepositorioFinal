Create database DB_Ejemplo_Join

CREATE TABLE Carrera(
ID_carrera int primary key,
Nombre_Carrera Varchar (50)not null,
)

Create table Alumnos(
Id_Alumnos int Primary key,
Nombre varchar (50)not null,
Apellidos varchar (50)not null,
ID_carrera int,
foreign key (ID_carrera) references Carrera(ID_carrera),
)

insert into Carrera values(1, 'Quimica'),
(2, 'Mecatronica'),
(3, 'Programaci�n'),
(4, 'Desarrollo de negocos');

Insert into Alumnos values
(01, 'Jos� Juli�n', 'Hern�ndez', 3),
(02, 'Jos� Guillermo', 'Rangel', 4),
(03, 'Jonathan', 'Garcia', 3),
(04,'Leonardo', 'Gomez', 2 ),
(05, 'Saori', 'Ledezma', 1),
(06, 'Carol Alelhi', 'Cornejo', 4),
(07, 'Luis �ngel', 'Trejo', 2),
(08, 'Ces�r', 'Lop�z ', 2),
(09, 'Kazumi', 'Barrera ', 3),
(10, 'Sharon', 'Monta�o', 4);

Select Alumnos.Nombre, Carrera.Nombre_Carrera
from Alumnos
full JOIN Carrera
on Alumnos.ID_carrera = Carrera.ID_carrera
where Carrera.Nombre_Carrera = 'Programaci�n'


Select Alumnos.Nombre, Carrera.Nombre_Carrera
from Alumnos
full JOIN Carrera
on Alumnos.ID_carrera = Carrera.ID_carrera
order by Alumnos.Nombre Asc;