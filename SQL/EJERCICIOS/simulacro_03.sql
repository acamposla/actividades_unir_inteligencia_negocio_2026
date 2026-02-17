/* ===========================================================
   SIMULACRO DE EXAMEN 03 — Preparación examen SQL
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-15

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo del enunciado.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas (como en el examen real).
   =========================================================== */

USE ExamenUnir;



/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   El departamento financiero necesita conocer el margen
   bruto de cada producto. Muestra el Nombre del producto,
   su Precio de Compra, su Precio de Venta y una columna
   calculada llamada "Margen" que sea la diferencia entre
   el Precio de Venta y el Precio de Compra. Ordena por
   margen de mayor a menor.
   ----------------------------------------------------------- */

-- MI RESPUESTA (funciona pero sobrecomplicada):
SELECT Nombre, Precio_Compra , Precio_Venta , SUM(Precio_Venta - Precio_Compra) as Margen
FROM ExamenUnir.Tienda_Productos
GROUP BY Nombre, Precio_Compra, Precio_Venta
ORDER BY Margen DESC;

-- CORRECCION: No hay nada que agregar, cada producto tiene un precio fijo.
-- Una resta en el SELECT basta. Sin SUM, sin GROUP BY.
SELECT
    Nombre,
    Precio_Compra,
    Precio_Venta,
    (Precio_Venta - Precio_Compra) AS Margen
FROM ExamenUnir.Tienda_Productos
ORDER BY Margen DESC;

/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Comercial quiere contactar con todos los clientes de tipo
   "Empresa" que se dieron de alta entre el año 2003 y el
   año 2005 (ambos incluidos). Muestra su IDCliente,
   Denominación, Fecha de Alta y Provincia.
   ----------------------------------------------------------- */

-- MI RESPUESTA (correcta):
SELECT IDCliente, Denominacion, FechaAlta, Provincia
FROM ExamenUnir.Tienda_Clientes
WHERE Tipo = 'Empresa' AND FechaAlta BETWEEN '2003-01-01' AND '2005-12-31';


/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Logística necesita localizar todas las facturas que
   tienen fecha de entrega registrada pero cuyo estado NO
   es "Entregado". Muestra IDFactura, Estado, Fecha de
   Entrega y Comentarios.
   ----------------------------------------------------------- */

-- MI RESPUESTA (correcta):
SELECT
	IDFactura,
	Estado,
	Fecha_Entrega,
	Comentarios
FROM ExamenUnir.Tienda_Facturas
WHERE Fecha_Entrega IS NOT NULL AND
Estado <> 'Entregado';

/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   Dirección quiere saber cuántas facturas ha gestionado
   cada empleado. Muestra el Nombre y Apellidos del empleado
   y el número total de facturas que ha gestionado. Incluye
   solo empleados con más de 3 facturas. Ordena por número
   de facturas de mayor a menor.
   ----------------------------------------------------------- */

-- MI RESPUESTA (correcta):
SELECT
	emp.Nombre,
	emp.Apellidos,
	COUNT(fac.IDFactura) as N_facturas
FROM ExamenUnir.Tienda_Empleados as emp
INNER JOIN ExamenUnir.Tienda_Facturas as fac
ON emp.IDEmpleado = fac.IDEmpleado
GROUP BY emp.IDEmpleado
HAVING N_facturas > 3
ORDER BY N_facturas DESC;

/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Se necesita un listado de todas las tiendas junto con la
   ciudad y comunidad autónoma donde se ubican. Para cada
   tienda, muestra también el número de empleados que
   trabajan en ella. Ordena por número de empleados
   descendente.
   ----------------------------------------------------------- */

-- MI RESPUESTA (funciona pero faltan columnas del enunciado):
SELECT
	tie.IDTienda,
	ter.Comunidad,
	COUNT(emp.IDEmpleado) as N_empleados
FROM ExamenUnir.Tienda_Tiendas as tie
LEFT JOIN ExamenUnir.Tienda_Territorio as ter -- Se pide TODAS
ON tie.IDTerritorio = ter.IDTerritorio
LEFT JOIN ExamenUnir.Tienda_Empleados as emp
ON tie.IDTienda = emp.IDTienda
GROUP BY tie.IDTienda
ORDER BY N_empleados DESC;

-- CORRECCION: El enunciado pide "ciudad y comunidad". Faltaba Ciudad.
-- LEFT JOIN correcto para no perder tiendas sin empleados.
SELECT
    tie.RazonSocial,
    ter.Ciudad,
    ter.Comunidad,
    COUNT(emp.IDEmpleado) AS N_empleados
FROM Tienda_Tiendas tie
LEFT JOIN Tienda_Territorio ter ON tie.IDTerritorio = ter.IDTerritorio
LEFT JOIN Tienda_Empleados emp ON tie.IDTienda = emp.IDTienda
GROUP BY tie.IDTienda
ORDER BY N_empleados DESC;

/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   Se quiere conocer el ticket medio (importe medio por
   factura, sin impuestos) de cada tienda, pero solo para
   facturas no canceladas. Muestra la Razón Social de la
   tienda, la Ciudad donde está ubicada y el ticket medio
   redondeado a 2 decimales. Muestra solo tiendas con un
   ticket medio superior a 5.000€. Ordena por ticket medio
   descendente.
   ----------------------------------------------------------- */

-- MI RESPUESTA (funciona pero sobrecomplicada y faltan columnas):
-- El IN con subconsulta es innecesario. Faltan RazonSocial, Ciudad y ROUND.
SELECT
	tie.IDTienda,
	AVG(fac.Total_sin_impuestos) as T_Medio
FROM ExamenUnir.Tienda_Tiendas as tie
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
ON tie.IDTienda = fac.IDTienda
WHERE fac.Estado IN (
	SELECT fac.Estado
	FROM ExamenUnir.Tienda_Facturas as fac
	WHERE fac.Estado <> 'Cancelado'
	)
GROUP BY tie.IDTienda
HAVING T_Medio > 5000
ORDER BY T_Medio DESC;

-- CORRECCION: "facturas no canceladas" = filtrar FILAS, no entidades.
-- Un simple WHERE <> basta. No hace falta subconsulta.
-- Regla: si el enunciado dice "excluye X" o "solo las que sean Y"
-- es un WHERE directo. Solo se usa NOT IN cuando dice "NUNCA".
SELECT
    tie.RazonSocial,
    ter.Ciudad,
    ROUND(AVG(fac.Total_sin_impuestos), 2) AS Ticket_Medio
FROM Tienda_Tiendas tie
INNER JOIN Tienda_Territorio ter ON tie.IDTerritorio = ter.IDTerritorio
INNER JOIN Tienda_Facturas fac ON tie.IDTienda = fac.IDTienda
WHERE fac.Estado <> 'Cancelado'
GROUP BY tie.IDTienda
HAVING Ticket_Medio > 5000
ORDER BY Ticket_Medio DESC;

/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El departamento comercial quiere identificar a los
   clientes que NUNCA han comprado en una tienda ubicada
   en Andalucía. Muestra el IDCliente y la Denominación
   de esos clientes.
   ----------------------------------------------------------- */

-- MI RESPUESTA (correcta):
-- Patrón "NUNCA hizo X": NOT IN con subconsulta que busca
-- los que SÍ lo hicieron.
SELECT
	cli.IDCliente,
	cli.Denominacion
FROM ExamenUnir.Tienda_Clientes as cli
WHERE cli.IDCliente NOT IN (
    SELECT cli.IDCliente
    FROM ExamenUnir.Tienda_Clientes as cli
    LEFT JOIN ExamenUnir.Tienda_Facturas as fac
    ON cli.IDCliente = fac.IDCliente
    LEFT JOIN ExamenUnir.Tienda_Tiendas as tie
    ON fac.IDTienda = tie.IDTienda
    LEFT JOIN ExamenUnir.Tienda_Territorio as ter
    ON tie.IDTerritorio = ter.IDTerritorio
    WHERE ter.Comunidad = 'Andalucia'
);

-- ALTERNATIVA MAS LIMPIA: la subconsulta no necesita empezar
-- desde Clientes. Basta con ir desde Facturas hacia Territorio.
SELECT cli.IDCliente, 
cli.Denominacion
FROM Tienda_Clientes cli
WHERE cli.IDCliente NOT IN (
    SELECT DISTINCT fac.IDCliente
    FROM Tienda_Facturas fac
    INNER JOIN Tienda_Tiendas tie ON fac.IDTienda = tie.IDTienda
    INNER JOIN Tienda_Territorio ter ON tie.IDTerritorio = ter.IDTerritorio
    WHERE ter.Comunidad = 'Andalucia'
);
