-- SCRIPT PARA CREAR LA BASE DE DATOS ALUMNOS

USE AdventureWorks2017

-- Ejecutar las instruciones DROP TABLE para eliminar las tablas

/*
 DROP TABLE Alumnos
 DROP TABLE Profesores
 DROP TABLE Asignaturas
 DROP TABLE Expediente
 DROP TABLE Examenes
*/

-- Alumnos
--DROP TABLE Alumnos
CREATE TABLE Alumnos(
	IDAlumno INT PRIMARY KEY,
	NombreAlumno VARCHAR(100),
	DNI INT,
	CiudadNacimiento VARCHAR(100),
	IDExpediente INT)

	
INSERT INTO Alumnos (IDAlumno, NombreAlumno, DNI, CiudadNacimiento, IDExpediente)
VALUES (10,'David',345678,'Madrid',20)
,(11,'Manuel',123476,'Barcelona',21)
,(12,'Antonio',763456,'Badajoz',22)
,(13,'Javier',987065,'Girona',23)
,(14,'Esteban',785236,'Barcelona',24)
,(15,'Pedro',324896,'Sevilla',25)
,(16,'Vicente',612378,'Madrid',26)
,(17,'Jesus',963485,'Madrid',27)


--SELECT * FROM Alumnos

-- Profesores

--DROP TABLE Profesores
CREATE TABLE Profesores(
	IDProfesor INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellido VARCHAR(100),
	FechaNacimiento DATE,
	IDAsignatura INT)

INSERT INTO Profesores (IDProfesor,Nombre,Apellido, FechaNacimiento, IDAsignatura)
VALUES 
(45,'Manuel','Ruiz','19700425',3214),
(89,'Daniel','Ramirez','19610307',3568),
(56,'Juan','Santana','19640706',8965),
(31,'José','Roldan','19590127',4785)

--SELECT * FROM Profesores


-- Asignaturas

--DROP TABLE Asignaturas
CREATE TABLE Asignaturas(
	IDAsignatura INT PRIMARY KEY,
	Asignatura VARCHAR(100),
	Cuatrimestre INT,
	Creditos INT)

INSERT INTO Asignaturas (IDAsignatura, Asignatura, Cuatrimestre, Creditos)
VALUES 
(3214,'Visualizacion de Datos', 1, 6),
(3568,'Bases de Datos Relacionales', 2, 9),
(8965,'Introducción Bases de Datos',2, 6),
(4785,'Econometria', 1, 12)

--SELECT * FROM Asignaturas

-- Expediente

--DROP TABLE Expediente
CREATE TABLE Expediente(
	IDMatricula INT PRIMARY KEY,
	IDAsignatura INT,
	AnMatricula INT,
	IDExpediente INT)

INSERT INTO Expediente (IDMatricula, IDAsignatura, AnMatricula, IDExpediente)
VALUES 
(101,3214,2018,20),
(102,3568,2018,20),
(103,8965,2018,20),
(104,4785,2018,20),
(105,3214,2018,21),
(106,3568,2018,21),
(107,8965,2018,21),
(108,4785,2018,21),
(109,3214,2018,22),
(110,3568,2018,22),
(111,8965,2018,22),
(112,4785,2018,22),
(113,3214,2018,23),
(114,3568,2018,23),
(115,8965,2018,23),
(116,4785,2018,23),
(117,3214,2019,24),
(118,3568,2019,24),
(119,8965,2019,24),
(120,4785,2019,24),
(121,3214,2019,25),
(122,3568,2019,25),
(123,8965,2019,25),
(124,4785,2019,25),
(125,3214,2019,26),
(126,3568,2019,26),
(127,8965,2019,26),
(128,4785,2019,26),
(129,3214,2019,27),
(130,3568,2019,27),
(131,8965,2019,27),
(132,4785,2019,27)

--SELECT * FROM Expediente


-- Examenes

--DROP TABLE Examenes
CREATE TABLE Examenes(
	IDExamen INT PRIMARY KEY,
	AnMatricula INT,
	Convocatoria VARCHAR(100),
	RealizacionExamen VARCHAR(2),
	IDAsignatura INT,
	IDProfesor INT,
	IDAlumno INT,
	Calificación DECIMAL(3,1))

INSERT INTO Examenes (IDExamen, AnMatricula, Convocatoria, RealizacionExamen, IDAsignatura, IDProfesor, IDAlumno, Calificación)
VALUES
(489554,2018,'Junio','SI',3214,45,10,10),
(489555,2018,'Junio','SI',3214,45,11,9.2),
(489556,2018,'Junio','SI',3214,45,12,4),
(489557,2018,'Junio','SI',3214,45,13,2),
(489558,2018,'Junio','SI',3568,89,10,5),
(489559,2018,'Junio','SI',3568,89,11,5),
(489560,2018,'Junio','SI',3568,89,12,6.5),
(489561,2018,'Junio','SI',3568,89,13,8),
(489562,2018,'Junio','SI',8965,56,10,6.7),
(489563,2018,'Junio','NO',8965,56,11,0),
(489564,2018,'Junio','SI',8965,56,12,10),
(489565,2018,'Junio','SI',8965,56,13,9.2),
(489566,2018,'Junio','NO',4785,31,10,0),
(489567,2018,'Junio','SI',4785,31,11,6),
(489568,2018,'Junio','SI',4785,31,12,8),
(489569,2018,'Junio','SI',4785,31,13,3),
(489570,2018,'Septiembre','SI',3214,45,12,6),
(489571,2018,'Septiembre','SI',3214,45,13,8),
(489572,2018,'Septiembre','SI',8965,56,11,10),
(489573,2018,'Septiembre','SI',4785,31,10,5.5),
(489574,2018,'Septiembre','SI',4785,31,13,5),
(489575,2019,'Junio','SI',3214,45,14,8),
(489576,2019,'Junio','SI',3214,45,15,5),
(489577,2019,'Junio','SI',3214,45,16,6.5),
(489578,2019,'Junio','SI',3214,45,17,2),
(489579,2019,'Junio','SI',3568,89,14,7),
(489580,2019,'Junio','SI',3568,89,15,3),
(489581,2019,'Junio','SI',3568,89,16,4),
(489582,2019,'Junio','SI',3568,89,17,5),
(489583,2019,'Junio','SI',8965,56,14,4.5),
(489584,2019,'Junio','SI',8965,56,15,10),
(489585,2019,'Junio','SI',8965,56,16,9),
(489586,2019,'Junio','SI',8965,56,17,7.5),
(489587,2019,'Junio','SI',4785,31,14,5),
(489588,2019,'Junio','NO',4785,31,15,0),
(489589,2019,'Junio','NO',4785,31,16,0),
(489590,2019,'Junio','SI',4785,31,17,8.5),
(489591,2019,'Septiembre','SI',3214,45,17,10),
(489592,2019,'Septiembre','SI',3568,89,15,8),
(489593,2019,'Septiembre','SI',3568,89,16,4),
(489594,2019,'Septiembre','SI',8965,56,14,2),
(489595,2019,'Septiembre','SI',4785,31,15,6),
(489596,2019,'Septiembre','SI',4785,31,16,8)

---- SELECT * FROM Examenes
