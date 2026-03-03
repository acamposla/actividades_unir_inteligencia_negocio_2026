-- TEMA 5: CONSULTAS SQL
USE AdventureWorks2017

/*
DROP TABLE dbo.Alumno
DROP TABLE dbo.Asignatura
DROP TABLE dbo.Computador
DROP TABLE dbo.Profesor
DROP TABLE dbo.Matricula
*/


/* 
CREACIÓN DE TABLAS
*/


USE AdventureWorks2017
-- Alumnos
--DROP TABLE Alumno
CREATE TABLE dbo.Alumno(
	nAI INT PRIMARY KEY,
	DNI INT,
	NombreAlumno VARCHAR(100),
	fechaNac DATE,
	lugar VARCHAR(100),
	nH INT,
	computador VARCHAR(100))

INSERT INTO dbo.Alumno (nAI, DNI, NombreAlumno, fechaNac, lugar,nH, computador)
VALUES (145, 29254123, 'Manuel Lopez Gonzalez', '19750315', 'Huelva', 0, 'Ord009'),
		(214, 29147158, 'Mercedes Gomez Martin','19760620','Huelva', 1, 'Ord010'),
		(112, 44125325, 'Francisco Gallego Macias','19750101','Cadiz', 2, 'Ord009'),
		(88, 29214856, 'Teresa Diaz Camacho','19711025','Madrid', 4, 'Ord010'),
		(210, 29555247, 'Beatriz Rico Vazquez', '19741112', 'Cadiz', 2, 'Ord025')

-- Computador
--DROP TABLE Computador
CREATE TABLE dbo.Computador(
	Ordenador VARCHAR(100),
	Nombre VARCHAR(100),
	lugar VARCHAR(100))

INSERT INTO dbo.Computador (Ordenador, Nombre, lugar)
VALUES ('Ord025', 'Servidor NT', 'Control'),
		('Ord008' , 'PC Practicas', 'Aula 7'),
		('Ord009' , 'PC Practicas', 'Aula 7'),
		('Ord010' , 'PC Practicas', 'Aula 8'),
		('Ord040' , 'Beatriz Rico Vazquez', 'Aula 10');

--SELECT * FROM Computador

--DROP TABLE Asignatura
CREATE TABLE dbo.Asignatura(
	idAsig INT PRIMARY KEY,
	Nombre VARCHAR(100),
	An INT,
	Trimestre INT,
	ProfID INT,
	Especialidad VARCHAR(100),
	Curso INT,
	Creditos NUMERIC(3,1))

INSERT INTO dbo.Asignatura (idAsig, Nombre, An, Trimestre, ProfID, Especialidad, Curso, Creditos)
VALUES (97,'Estrategia y Gestión Empresarial Basada en Datos',2019,1,245,'Analytics',2,4.5),
		(98,'Inteligencia de Cliente (CRM)',2019,2,356,'Bases de datos',3,4.5),
		(99,'Visualización Avanzada de Datos',2019,2,478,'Analytics',3,6),
		(100,'Análisis de Datos Masivos para el Negocio',2019,2,665,'Data Science',3,6),
		(101,'Fundamentos Tecnológicos para el Tratamiento de Datos',2019,1,766,'Bases de datos',1,6),
		(102,'Prácticas Externas',2020,4,NULL,'Otros',4,10),
		(103,'Gestión de Proyectos de Inteligencia de Negocio',2020,3,888,'Adminstracion',3,6),
		(104,'Inteligencia de Negocio Aplicada',2020,3,100,'Analytics',3,6),
		(105,'Trabajo Fin de Máster',2020,4,NULL,'Otros',4,12)

--SELECT * FROM Asignatura

--DROP TABLE Profesor
CREATE TABLE dbo.Profesor(
	ProfID INT PRIMARY KEY NOT NULL,
	DNI INT,
	Nombre VARCHAR(100),
	Nacionalidad VARCHAR(100))

INSERT INTO dbo.Profesor (ProfID, DNI, Nombre, Nacionalidad)
VALUES (100,124568,'Antonio','Espana'),
		(245,325684,'Javier','EEUU'),
		(356,458963,'Vicente','Portugal'),
		(478,325896,'Jesus','Venezuela'),
		(665,789563,'Leticia','Australia'),
		(766,658741,'Serhiy','Rusia'),
		(888,364185,'Rocio','Reino Unido')

--SELECT * FROM Profesor


--DROP TABLE Matricula
CREATE TABLE dbo.Matricula(
	nAI INT,
	idAsig INT,
	An INT,
	Trimestre INT,
	ProfID INT,
	Curso INT,
	Convocatoria VARCHAR(100),
	Calificacion DECIMAL(4,2))

INSERT INTO dbo.Matricula (nAI, idAsig, An, Trimestre, ProfID, Curso, Convocatoria, Calificacion)
VALUES (88,97,2019,1,245,2,'Junio',4.5),
		(88,98,2019,2,356,3,'Junio',6),
		(88,99,2019,2,478,3,'Junio',8),
		(88,100,2019,2,665,3,'Junio',2),
		(88,101,2019,1,766,1,'Junio',4),
		(88,102,2020,4,0,4,'Junio',3.5),
		(88,103,2020,3,888,3,'Junio',10),
		(88,104,2020,3,100,3,'Junio',9),
		(88,105,2020,4,0,4,'Junio',10),
		(112,97,2019,1,245,2,'Junio',8),
		(112,98,2019,2,356,3,'Junio',7.6),
		(112,99,2019,2,478,3,'Junio',9.75),
		(112,100,2019,2,665,3,'Junio',9),
		(112,101,2019,1,766,1,'Junio',2),
		(112,102,2020,4,0,4,'Junio',3),
		(112,103,2020,3,888,3,'Junio',6),
		(112,104,2020,3,100,3,'Junio',8),
		(112,105,2020,4,0,4,'Junio',5),
		(145,97,2019,1,245,2,'Junio',5),
		(145,98,2019,2,356,3,'Junio',5),
		(145,99,2019,2,478,3,'Junio',8),
		(145,100,2019,2,665,3,'Junio',10),
		(145,101,2019,1,766,1,'Junio',5.5),
		(145,102,2020,4,0,4,'Junio',4.5),
		(145,103,2020,3,888,3,'Junio',3.25),
		(145,104,2020,3,100,3,'Junio',6),
		(145,105,2020,4,0,4,'Junio',7),
		(210,97,2019,1,245,2,'Junio',8),
		(210,98,2019,2,356,3,'Junio',10),
		(210,99,2019,2,478,3,'Junio',3),
		(210,100,2019,2,665,3,'Junio',2),
		(210,101,2019,1,766,1,'Junio',1),
		(210,102,2020,4,0,4,'Junio',1),
		(210,103,2020,3,888,3,'Junio',5.5),
		(210,104,2020,3,100,3,'Junio',8),
		(210,105,2020,4,0,4,'Junio',8.75),
		(214,97,2019,1,245,2,'Junio',5),
		(214,98,2019,2,356,3,'Junio',7),
		(214,99,2019,2,478,3,'Junio',9),
		(214,100,2019,2,665,3,'Junio',10),
		(214,101,2019,1,766,1,'Junio',10),
		(214,102,2020,4,0,4,'Junio',3),
		(214,103,2020,3,888,3,'Junio',6),
		(214,104,2020,3,100,3,'Junio',8),
		(214,105,2020,4,0,4,'Junio',10),
		(88,100,2019,2,665,3,'Septiembre',5),
		(88,101,2019,1,766,1,'Septiembre',7),
		(112,101,2019,1,766,1,'Septiembre',8),
		(112,102,2020,4,0,4,'Septiembre',6),
		(210,99,2019,2,478,3,'Septiembre',5),
		(210,100,2019,2,665,3,'Septiembre',4),
		(210,101,2019,1,766,1,'Septiembre',2),
		(210,102,2020,4,0,4,'Septiembre',7),
		(214,102,2020,4,0,4,'Septiembre',5),
		(225,100,2020,2,665,3,'Septiembre',7),
		(225,101,2020,1,766,4,'Septiembre',5.5),
		(225,102,2020,4,0,4,'Septiembre',3.5),
		(225,99,2020,2,478,3,'Septiembre',8)



