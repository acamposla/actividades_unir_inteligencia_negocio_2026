//
Ejercicio 1: Calentamiento
Basándonos en la tabla Alumno, necesito una lista sencilla.

El Reto: Obtén el Nombre del Alumno y su Lugar de procedencia para aquellos estudiantes que NO sean de 'Madrid'. Además, quiero que los resultados aparezcan ordenados alfabéticamente por su nombre.


Pista: Recuerda los operadores de comparación != o <> y la cláusula ORDER BY que vimos en tus apuntes.

Tu turno: Escribe la consulta SQL.
//

Select NombreAlumno, lugar
FROM GestionAlumnos.Alumno 
WHERE lugar <> 'Madrid'
ORDER BY NombreAlumno ASC; 


//
Ejercicio 2: Patrones de texto (LIKE) y Operadores Lógicos
Subimos un pequeño escalón. A veces no buscamos una coincidencia exacta (como "Madrid"), sino que una palabra contenga cierto texto.

El Reto: Necesito que busques en la tabla Asignatura. Queremos el Nombre y los Creditos de aquellas asignaturas que contengan la palabra "Datos" en cualquier parte de su nombre Y que además pertenezcan al Curso 1.


Pista: Recuerda el uso de los comodines % con el operador LIKE.

Tu turno: Escribe la consulta.
//

Select Nombre, Creditos
FROM GestionAlumnos.Asignatura  
WHERE Nombre LIKE '%Datos%'
AND Curso = 1


//
Ejercicio 3: Uniendo mundos (INNER JOIN)
En una base de datos relacional, la información rara vez está en una sola tabla. Ahora queremos saber quién da clase a qué.

El Escenario: Tienes la tabla Asignatura y la tabla Profesor. Ambas tienen una columna en común (clave foránea) llamada ProfID.

El Reto: Obtén un listado con dos columnas:

El Nombre de la Asignatura.

El Nombre del Profesor responsable.


Consejo Vital: Como ambas tablas tienen una columna llamada Nombre, es obligatorio usar "alias" (apodos) o el nombre de la tabla para decirle a SQL cuál de los dos "Nombres" quieres en cada caso (ej: A.Nombre o P.Nombre).

Tu turno: Escribe la consulta para unir estas tablas.
//


select 
a.Nombre,
p.Nombre
from Asignatura as a
inner join Profesor as p
on a.ProfID  = p.ProfID


//
Ejercicio 4: Agrupando datos (GROUP BY + Funciones de Agregación)
Ahora vamos a comprimir la información. No queremos ver cada fila individual, sino resúmenes.

El Escenario: Queremos saber qué asignaturas son las más populares (tienen más matriculados). Para ello necesitamos unir Asignatura con Matricula y contar.

El Reto: Muestra dos columnas:

El Nombre de la Asignatura.

El Número total de alumnos matriculados en ella (llámalo TotalAlumnos).


Pista: Necesitarás INNER JOIN para unir las tablas, la función COUNT(*) para contar filas, y obligatoriamente GROUP BY para agrupar por el nombre de la asignatura. 

Tu turno: Escribe la consulta.
//

//
¿Por qué es brillante? Si hubieras usado INNER JOIN y una asignatura tuviera cero alumnos, esa asignatura habría desaparecido del listado. Con LEFT JOIN aparecería con 0 matriculados.

Detalle técnico: Al hacer COUNT(m.idAsig), cuentas solo cuando hay un ID en la tabla de la derecha (Matricula). Si hubieras puesto COUNT(*), las asignaturas sin alumnos te saldrían con un "1" falso (por la fila vacía que genera el LEFT JOIN). ¡Lo has hecho perfecto!
//

Select 
a.Nombre, 
COUNT(m.idAsig) as TotalMatriculados
From Asignatura as a
LEFT JOIN matricula as m
ON a.idAsig = m.idAsig 
Group by a.Nombre 
Order by TotalMatriculados DESC;

//
Nivel 5: La "Zona Crítica" (Subconsultas en WHERE)
Llegamos a lo que te preocupaba. Vamos a usar una Subconsulta en el WHERE.

Esto se usa cuando la condición del filtro no es un valor fijo (como 'Madrid'), sino un dato que primero tienes que ir a buscar a la base de datos.

El Escenario: Queremos encontrar compañeros de ciudad. Te pido que busques alumnos, pero no te digo la ciudad explícitamente.

El Reto: Obtén el Nombre y el Lugar de todos los alumnos que sean de la misma ciudad que la alumna 'Beatriz Rico Vazquez'. (Ojo: No vale mirar tú la ciudad y escribir 'Cadiz'. Tienes que "preguntarle" a la base de datos cuál es su ciudad dentro de la misma consulta).

Pista: La estructura mental es: "Muéstrame los alumnos cuyo lugar sea IGUAL A (selecciona el lugar de Beatriz)".
//



// todas las ciudades iguales a las de la alumna beatriz

select NombreAlumno, lugar
from alumno as a 
where lugar = 
(select lugar
from alumno
where NombreAlumno = 'Beatriz Rico Vazquez' );


//El Escenario: Queremos premiar a los alumnos con mejor rendimiento académico. Necesitamos calcular su nota media, pero solo nos interesan los que tienen una media notable.

El Reto: Obtén el Nombre del Alumno y su Nota Media (promedio de Calificacion), pero SOLO de aquellos alumnos cuya nota media sea superior a 7.
//

select a.NombreAlumno,
round(AVG(m.Calificacion),2) as NotaMedia
from
alumno as a
inner join Matricula as m
ON m.nAI = a.nAi
GROUP BY a.NombreAlumno 
having NotaMedia > 7

//
Nivel Final: El "Boss" (Subconsulta en el SELECT)
a dominas el WHERE con subconsultas y el HAVING. Vamos a por la última pieza del rompecabezas: Una subconsulta en la columna de resultados (SELECT).

Esto sirve para comparar a un individuo contra un total global en la misma línea.

El Escenario: Queremos ver qué tal rinde cada asignatura en comparación con el promedio global de toda la universidad.

El Reto: Genera un listado con 3 columnas:

Nombre de la Asignatura.

Nota Media de esa asignatura (redondeada a 2 decimales).

Diferencia: Una columna calculada que sea (Nota Media de la Asignatura - Nota Media Global de TODA la universidad).

Pista:

Columna 1: a.Nombre

Columna 2: AVG(m.Calificacion)

Columna 3: Aquí necesitas restar la columna 2 menos una subconsulta que calcule el promedio de todas las notas de la tabla Matricula sin filtros.

Tu turno: (Este es difícil, tómate tu tiempo).

//

select a.Nombre, 
AVG(m.Calificacion), 
-- Aquí empieza la magia: RESTAMOS
    AVG(m.Calificacion) - (SELECT AVG(Calificacion) FROM Matricula) as Diferencia
from 
asignatura as a
left join Matricula as m
ON a.idAsig = m.idAsig 
GROUP BY a.Nombre;

//


El Escenario: Queremos saber qué profesores son los más "duros" (ponen notas más bajas) y cuáles los más "blandos".

La información de la nota está en Matricula, pero el nombre del profesor está en Profesor. 

No están conectadas directamente; la tabla Asignatura hace de puente.

El Objetivo: Obtén un listado con:

El Nombre del Profesor.

La Nota Media que han sacado los alumnos en sus asignaturas.

Ordena el resultado de menor a mayor nota (para ver primero a los "duros").

Pista visual: Profesor --(ProfID)--> Asignatura --(idAsig)--> Matricula

Tu turno: Tienes que hacer dos INNER JOIN encadenados y luego agrupar. Adelante.

//


select p.Nombre  as NombreProfesor,
AVG(m.Calificacion) as NoataMedia
from Profesor as p
	inner join Asignatura as a on p.ProfID = a.ProfID 
	inner join Matricula as m on a.idAsig   = m.idAsig
group by NombreProfesor


//
Reto 1: La Lista Negra (NOT IN)
A veces es más fácil definir lo que NO queremos. 
Imagina que queremos detectar alumnos "inactivos" en un año concreto.

El Escenario: Queremos saber qué alumnos NO se matricularon en ninguna asignatura durante el año 2019.

La Lógica:

Primero, necesitas una lista de todos los IDs de alumnos que SÍ se matricularon en 2019 (Subconsulta a la tabla Matricula).

Luego, seleccionas a los alumnos cuyo ID NO ESTÉ en esa lista.

El Reto: Obtén el Nombre del Alumno para aquellos cuyo nAI no aparezca en las matrículas del año 2019.

Pista: Usa la estructura WHERE nAI NOT IN ( ...subconsulta... ).

Tu turno:
//

SELECT NombreAlumno
FROM Alumno
WHERE nAI NOT IN (
    SELECT nAI 
    FROM Matricula 
    WHERE An = 2019);


//
El Escenario: Queremos enviar un correo a los alumnos que estudian informática. 
No sabemos qué asignaturas son de informática exactamente, 
pero sabemos que la asignatura con ID 1 es "Informática Básica".

El Reto: Obtén el Nombre de todos los alumnos que se hayan matriculado alguna vez 
en la asignatura con idAsig = 1.

Tu proceso mental debe ser:

Subconsulta: Consigue la lista de IDs de alumnos (nAI) que están en la tabla Matricula con idAsig = 1.

Principal: Dame los nombres de la tabla Alumno cuyo ID ESTÉ EN esa lista.

Tu turno: Escribe la consulta usando IN.
//


Select *
from Alumno as a
Where a.nAI in (
select m.nAI from Matricula as m where m.nAI = 88)



//
El Escenario: Queremos identificar las asignaturas "pesadas" (las que tienen muchos créditos).

El Reto: Muestra el Nombre y los Créditos de las asignaturas que tengan más créditos
que la media de todas las asignaturas.

Tu proceso mental:

Subconsulta (Lado derecho): ¿Cuál es la media de créditos de toda la tabla Asignatura? (AVG).

Consulta Principal (Lado izquierdo): Filtra las asignaturas donde Creditos > (resultado de la subconsulta).

Tu turno: (Recuerda: nada de SELECT * dentro del paréntesis; solo el numerito de la media).

//


Select a.Nombre, a.Creditos 
from Asignatura as a
WHERE a.Creditos > (
select ROUND(AVG(a.Creditos), 2)
from  Asignatura a )


//

El Escenario: Queremos premiar a la excelencia docente. 

Buscamos a los profesores cuyos alumnos sacan, de media,
mejores notas que el promedio general de la universidad.

El Reto: Obtén el Nombre del Profesor y su Nota Media (de sus alumnos),
pero SOLO de aquellos profesores cuya media sea superior a la media global de todas las matrículas de la universidad.

Tu proceso mental (Paso a paso):

La Estructura Base (El "Quién"): 
Necesitas el Nombre del Profesor y su media. 
Esto implica unir Profesor + Asignatura + Matricula y agrupar por Profesor. 
(Esto ya lo hiciste en el "Triple Salto").

El Filtro (La Condición): 
No queremos a todos. Queremos filtrar el grupo (HAVING).

La Comparación (El "Contra qué"): 
En el HAVING, la condición será: AVG(Calificacion) > ( ...Subconsulta de la media global... ).

Pista: Es muy parecido a tu ejercicio anterior de créditos, pero en lugar de WHERE, 
usas HAVING porque estás comparando un promedio agrupado, no una fila suelta.

Tu turno: Escribe la consulta completa. Si te sale, estás listo para cualquier cosa.

//

Select p.Nombre, AVG(m.Calificacion) as calificacionmedia
from Profesor as p
inner join Asignatura as a on p.ProfID  = a.ProfID 
inner join Matricula as m ON a.idAsig = m.idAsig
GROUP BY  p.Nombre
having calificacionmedia > (select ROUND(AVG(Calificacion), 2) from matricula)

//
El Nuevo Reto: "El alumno estrella"
Ahora te toca a ti. Recuerda: Primero escríbeme tu proceso mental (Paso 1, 2, 3, 4) y luego la Query.

El Escenario: Queremos identificar a los alumnos que se esfuerzan más que la mayoría. Vamos a medir el esfuerzo por el número de asignaturas a las que se han matriculado.

El Enunciado: Obtén el Nombre de los alumnos que se han matriculado en más asignaturas que el alumno llamado 'Manuel Lopez Gonzalez'.

Requisitos para tu respuesta:

Desglose mental: Explícame paso a paso cómo lo razonas antes de escribir código.

La Query: El código SQL final.
//

// paso 1: el origen: ¿De qué taablas saco los datos: tabla de alumno, matricula 
//

SELECT a.NombreAlumno, COUNT(m.idAsig) as NumeroMatriculas
FROM Alumno AS a
INNER JOIN Matricula AS m ON a.nAI = m.nAI
GROUP BY a.NombreAlumno
HAVING COUNT(m.idAsig) > (
    -- Inicio de la Subconsulta para calcular el "Número Y"
    SELECT COUNT(m2.idAsig)
    FROM Alumno AS a2
    INNER JOIN Matricula AS m2 ON a2.nAI = m2.nAI
    WHERE a2.NombreAlumno = 'Manuel Lopez Gonzalez'
    -- Fin de la Subconsulta
);


//

// 🟢 Ejercicio 1: Calentamiento de JOINs y Agregación Simple


select * 
from TiendaEcommerce.









