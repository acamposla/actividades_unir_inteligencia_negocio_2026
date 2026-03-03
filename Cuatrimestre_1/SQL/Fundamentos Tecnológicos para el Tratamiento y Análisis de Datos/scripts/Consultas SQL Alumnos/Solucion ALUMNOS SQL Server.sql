
SELECT * FROM Alumnos
SELECT * FROM Profesores
SELECT * FROM Asignaturas
SELECT * FROM Expediente
SELECT * FROM Examenes



-- Obtener el nombre de todos los alumnos cuyo nombre empiece por la letra E y hayan nacido en una ciudad cuyo nombre tenga, al menos, 5 caracteres.

SELECT *, LEN(CiudadNacimiento)
FROM Alumnos
WHERE NombreAlumno LIKE 'E%'
	AND LEN(CiudadNacimiento) >= 5

--	Obtener el nombre de los alumnos que comiencen por la letra A y hayan nacido en Madrid o Barcelona.

SELECT *
FROM Alumnos
WHERE NombreAlumno NOT LIKE 'A%'
	AND CiudadNacimiento NOT IN ('Madrid','Barcelona')

--	Obtener el DNI de todos los alumnos del profesor Manuel Ruiz.

SELECT DISTINCT AL.DNI, AL.NombreAlumno, PR.Nombre, PR.Apellido
FROM Examenes AS EX
INNER JOIN Alumnos AS AL
	ON EX.IDAlumno = AL.IDAlumno
INNER JOIN Profesores AS PR
	ON PR.IDProfesor = EX.IDProfesor
WHERE  PR.Nombre = 'Manuel' AND PR.Apellido = 'Ruiz'
-- WHERE EX.IDProfesor = (SELECT IDProfesor FROM Profesores WHERE Nombre = 'Manuel' AND Apellido = 'Ruiz')

SELECT * FROM Profesores WHERE Nombre = 'Manuel' AND Apellido = 'Ruiz'


--	Obtener los DNI de los alumnos que se han matriculado en Visualización Avanzada de datos en el curso 2019.

SELECT Al.DNI, Al.NombreAlumno, ASI.Asignatura, EX.AnMatricula
FROM Expediente AS EX
INNER JOIN Alumnos AS AL
	ON EX.IDExpediente = AL.IDExpediente
INNER JOIN Asignaturas AS ASI
	ON ASI.IDAsignatura = EX.IDAsignatura
WHERE ASI.Asignatura = 'Visualizacion de Datos' AND EX.AnMatricula = 2019


--	Obtener una lista con los nombres de los alumnos que hayan sacado una nota más alta en septiembre que la más alta de las notas de junio,
--en el año 2018 y en la asignatura Bases de Datos Relacional.

SELECT Al.NombreAlumno, Ex.Calificación
FROM Alumnos AS AL
INNER JOIN Examenes AS EX
	ON AL.IDAlumno = EX.IDAlumno
INNER JOIN Asignaturas AS ASI
	ON asi.IDAsignatura = EX.IDAsignatura
WHERE Ex.Convocatoria = 'Septiembre' 
	AND AnMatricula = 2019 
	AND ASI.Asignatura = 'Bases de Datos Relacionales'
	AND Ex.Calificación >=  (   SELECT MAX(Calificación) 
								FROM Examenes AS EX
								INNER JOIN Asignaturas AS ASI
									ON EX.IDAsignatura = ASI.IDAsignatura
								WHERE Convocatoria = 'Junio' 
									AND AnMatricula = 2018 
									AND ASI.Asignatura = 'Bases de Datos Relacionales')

--	Obtener el nombre de los profesores que impartan clase a alumnos que tengan aprobada (más de un 5) 
-- la asignatura de Introducción a las Bases de Datos en junio de 2019.

SELECT DISTINCT PR.Nombre
FROM Profesores AS PR
INNER JOIN Examenes AS EX
	ON EX.IDProfesor = PR.IDProfesor
WHERE EX.IDAlumno IN (SELECT Al.IDAlumno
						FROM Examenes AS EX
						INNER JOIN Asignaturas AS ASI
							ON ex.IDAsignatura = asi.IDAsignatura
						INNER JOIN Alumnos AS AL
							ON EX.IDAlumno = AL.IDAlumno
						INNER JOIN Profesores AS PR
							ON pr.IDProfesor = EX.IDProfesor
						WHERE EX.Calificación >= 5
							AND Ex.Convocatoria = 'Junio'
							AND EX.AnMatricula = 2019
							AND ASI.Asignatura = 'Introducción Bases de Datos')


--	Para cada asignatura y año académico, mostrar el nombre de la asignatura, el año, el número de alumnos que se han presentado 
-- y la nota media obtenida en la convocatoria de junio.

SELECT ASI.Asignatura, EX.AnMatricula, COUNT(EX.IDExamen) AS NumeroAlumnos, AVG(Ex.Calificación) AS Media
FROM Examenes AS EX
INNER JOIN Asignaturas AS ASI
	ON ASI.IDAsignatura = EX.IDAsignatura
WHERE EX.Convocatoria = 'Junio' AND EX.RealizacionExamen = 'SI'
GROUP BY ASI.Asignatura, EX.AnMatricula

--	DNI de los alumnos que hayan sacado más de un 9 de nota media en septiembre del 2019.

SELECT AL.NombreAlumno, AVG(EX.Calificación)
FROM Examenes AS EX
INNER JOIN Alumnos AS AL
	ON EX.IDAlumno = AL.IDAlumno
WHERE EX.Convocatoria = 'Septiembre' AND Ex.AnMatricula = 2019
GROUP BY AL.NombreAlumno
HAVING AVG(EX.Calificación) > 9











