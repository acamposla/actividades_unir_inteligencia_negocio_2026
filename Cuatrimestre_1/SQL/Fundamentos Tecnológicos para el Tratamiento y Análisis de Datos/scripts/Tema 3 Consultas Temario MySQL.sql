--  TEMA  3: CONSULTAS SQL
USE AdventureWorks2017;
-- select * from Matricula
/* 
LENGUAJE DE DEFINICION
*/

/*
DELETE FROM Alumno
WHERE DNI = 29555247;

UPDATE Alumno
SET fechaNac = '20020127'
WHERE nAI = 112;


DELETE FROM Computador
WHERE lugar = 'Aula 7' and nAI <> 'Ord008';

UPDATE Computador
SET Nombre = 'Ordenador Personal'
WHERE nAI = 'Ord040' and lugar = 'Aula 10';
*/

/* 
CONSULTAS
*/

-- SELECT <lista de atributos>
-- FROM <lista de tablas>
-- WHERE <condición>


--  Imaginemos que tenemos una BD con información de una universidad y 
-- se desea conocer el código, el nombre y la especialidad de las asignaturas de tercer curso que tengan más de 4.5 créditos. 
-- La consulta SQL que recogerá dicha información es la siguiente:

SELECT A.idAsig AS CodigoAsignatura, A.Nombre, A.Especialidad
FROM Asignatura as A
WHERE A.Curso = 3 and A.Creditos > 4.5;

-- SELECT * FROM Asignatura as A
--  Obtener toda la información de las asignaturas

SELECT * 
FROM Asignatura AS asi ;


-- SELECT * 
-- FROM Asignatura AS asi 
--  join Profesor AS pr on pr.ProfID=asi.ProfID 

--  Obtener los distintos tipos de computadores que existen

SELECT DISTINCT com.Nombre 
FROM Computador AS com;

-- SELECT * FROM Computador

--  Obtener el número de descuento a realizar por alumno, 
-- sabiendo que el descuento es de 300 € por número de hermanos. 
-- Ordenar el resultado de mayor a menor descuento y, 
-- en caso de igualdad, ordenarlo alfabéticamente.

SELECT al.nH * 300 as Descuento, al.NombreAlumno
FROM Alumno AS al
ORDER BY Descuento DESC, al.NombreAlumno ASC;



-- Obtener el DNI de los alumnos nacidos entre 1970 y 2000 cuya localidad de procedencia sea Murcia:

SELECT al.DNI
FROM Alumno AS al
WHERE al.fechaNac BETWEEN '19700101' and '20001231'
	AND al.lugar IN ('Murcia');



SELECT al.*
FROM Alumno AS al
WHERE Lugar NOT IN ('Huelva','Cadiz');


-- Obtener el DNI de los alumnos cuyo nombre comience por la letra A y
-- su procedencia sea de una ciudad que tenga al menos 6 caracteres, 
-- pero no comience por la letra M.


SELECT al.DNI, al.NombreAlumno
FROM Alumno AS al
WHERE NombreAlumno NOT LIKE 'A%' 
AND lugar LIKE '%______%'
AND lugar NOT LIKE 'M%';


SELECT * 
FROM Asignatura
WHERE Nombre LIKE '%Datos%';

-- Obtener el nombre de las asignaturas y profesores responsables:

SELECT asi.Nombre, pr.Nombre
FROM Asignatura AS asi 
	INNER JOIN Profesor AS pr ON pr.ProfID = asi.ProfID;


-- Obtener el número de alumnos que tiene la asignatura «Bases de Datos Relacionales» en 2019:

SELECT ma.nAI
FROM Matricula AS ma 
	INNER JOIN Asignatura AS asi ON asI.idAsig = ma.idAsig
WHERE asi.Nombre = 'Fundamentos Tecnológicos para el Tratamiento de Datos' AND ma.An=2019;

-- Obtener el nombre de los alumnos que procedan de la misma ciudad que Francisco Gallego y tengan el mismo número de hermanos que Beatriz Rico:

SELECT al.NombreAlumno
FROM Alumno AS al
WHERE al.lugar = (SELECT Lugar FROM Alumno WHERE NombreAlumno = 'Francisco Gallego Macias')
AND al.nH = (SELECT nH FROM Alumno WHERE NombreAlumno = 'Beatriz Rico Vazquez');


-- Ejemplo Extra
-- Asignaturas con de 6 creditos
SELECT idAsig
FROM Asignatura AS asi
WHERE asi.Creditos = 6;

SELECT * 
FROM Matricula AS ma
WHERE idAsig IN (SELECT idAsig
			     FROM Asignatura AS asi
				 WHERE asi.Creditos = 6);


--  Obtener el número de matriculados, la nota mínima 
-- y la nota media de la asignatura «Fundamentos Tecnológicos para el Tratamiento de Datos» en la convocatoria de diciembre de 2019.

SELECT COUNT(*) AS NumMatri, MIN(Calificacion) AS Minima, AVG(Calificacion) AS Media
FROM Asignatura AS asi INNER JOIN Matricula AS ma ON ma.idAsig = asi.idAsig
WHERE asi.Nombre = 'Fundamentos Tecnológicos para el Tratamiento de Datos' and ma.An=2019;

-- Para cada asignatura, mostrar el nombre de esta, el número de alumnos que se han presentado y la nota media obtenida en la convocatoria de junio

SELECT asi.Nombre, COUNT(*) AS Presentados, AVG(Calificacion) AS Media
FROM Asignatura AS asi 
INNER JOIN Matricula AS ma ON asi.idAsig = ma.idAsig
WHERE ma.Convocatoria = 'Junio' AND ma.An = 2020
GROUP BY asi.Nombre;



SELECT ma.Convocatoria, asi.Nombre, COUNT(*) as Presentados, AVG(Calificacion) AS Media
FROM Asignatura AS asi INNER JOIN Matricula AS ma ON asi.idAsig = ma.idAsig
GROUP BY ma.Convocatoria, asi.Nombre;

--  Nombre de los alumnos que hayan sacado más de un 5 de nota media en junio del 2018.

SELECT al.NombreAlumno, AVG(ma.Calificacion)
FROM Alumno AS al INNER JOIN Matricula AS ma ON ma.nAI = al.nAI
WHERE ma.An = 2019 AND ma.Convocatoria='Junio' 
GROUP BY al.NombreAlumno
HAVING AVG(ma.Calificacion) > 5;
