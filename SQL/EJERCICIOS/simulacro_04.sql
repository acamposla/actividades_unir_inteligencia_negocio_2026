/* ===========================================================
   SIMULACRO DE EXAMEN 04 — Preparación examen SQL
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-17

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo del enunciado.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas (como en el examen real).
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   El equipo de compras quiere revisar los productos de color
   "Rojo" o "Azul". Muestra el Nombre, Color, Precio de
   Compra y Precio de Venta. Ordena alfabéticamente por
   Nombre.
   ----------------------------------------------------------- */

SELECT Nombre, Color, Precio_Compra , Precio_Venta 
FROM ExamenUnir.Tienda_Productos
WHERE Color IN ("Rojo", "Azul")
ORDER BY Nombre ASC; 

/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Recursos Humanos necesita un listado de los empleados a
   jornada completa cuyo salario base supere los 30.000€.
   Muestra IDEmpleado, Nombre, Apellidos y Salario Base.
   Ordena por salario de mayor a menor.
   ----------------------------------------------------------- */

-- MI RESPUESTA (falta filtro de jornada):
SELECT IDEmpleado, Nombre , Apellidos , SalarioBase
FROM ExamenUnir.Tienda_Empleados
WHERE SalarioBase > 30000
ORDER BY SalarioBase DESC;

-- CORRECCION: El enunciado pide DOS condiciones: jornada completa Y salario > 30000.
-- Leer siempre el enunciado completo antes de escribir el WHERE.
SELECT IDEmpleado, Nombre, Apellidos, SalarioBase
FROM Tienda_Empleados
WHERE Jornada = 'Completa' AND SalarioBase > 30000
ORDER BY SalarioBase DESC;



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Finanzas quiere revisar las facturas de importe elevado.
   Muestra el IDFactura, la Fecha de Compra, el Total sin
   impuestos y la Denominación del cliente para todas las
   facturas cuyo total sin impuestos supere los 1.000€.
   Ordena por total descendente.
   ----------------------------------------------------------- */


SELECT fac.IDFactura, fac.Fecha_Compra , fac.Total_sin_impuestos, cli.Denominacion 
FROM ExamenUnir.Tienda_Facturas as fac
LEFT JOIN ExamenUnir.Tienda_Clientes as cli
ON fac.IDCliente = cli.IDCliente 
WHERE fac.Total_sin_impuestos > 1000
ORDER BY fac.Total_sin_impuestos DESC; 
 
/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   Se quiere saber cuántos productos hay de cada color.
   Muestra el color y el número de productos. Ten en cuenta
   que hay productos sin color registrado. Ordena por número
   de productos de mayor a menor.
   ----------------------------------------------------------- */


-- MI RESPUESTA (excluye NULLs cuando el enunciado pide incluirlos):
SELECT pro.Color, COUNT(pro.IDProducto) as N_Productos
FROM ExamenUnir.Tienda_Productos as pro
WHERE pro.Color IS NOT NULL
GROUP BY pro.Color
ORDER BY N_Productos DESC;

-- CORRECCION: "Ten en cuenta que hay productos sin color" = inclúyelos.
-- Sin WHERE, GROUP BY agrupa los NULL como un grupo más.
SELECT Color, COUNT(IDProducto) AS N_Productos
FROM Tienda_Productos
GROUP BY Color
ORDER BY N_Productos DESC;



/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Dirección quiere un informe de actividad por empleado.
   Para cada empleado, muestra su Nombre, Apellidos, la
   Ciudad de la tienda donde trabaja y el número de facturas
   que ha gestionado. Ordena por número de facturas
   descendente.
   ----------------------------------------------------------- */

SELECT emp.Nombre, emp.Apellidos, ter.Ciudad, count(fac.IDFactura ) as N_fac
FROM ExamenUnir.Tienda_Empleados as emp
LEFT JOIN ExamenUnir.Tienda_Tiendas as tie
ON emp.IDTienda = tie.IDTienda 
LEFT JOIN ExamenUnir.Tienda_Territorio as ter
ON tie.IDTerritorio = ter.IDTerritorio 
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
ON emp.IDEmpleado = fac.IDEmpleado 
GROUP BY emp.IDEmpleado 
ORDER BY N_fac DESC;


/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   El responsable de producto quiere saber qué artículos
   son los más vendidos. Para cada producto, muestra su
   Nombre, el nombre de su categoría y el total de unidades
   vendidas. Incluye solo productos con más de 30 unidades
   vendidas. Ordena por unidades vendidas de mayor a menor.
   ----------------------------------------------------------- */

SELECT pr.Nombre, cat.Nombre_Categoria , SUM(det.Cantidad) as C_Total 
FROM ExamenUnir.Tienda_Productos as pr
LEFT JOIN ExamenUnir.Tienda_Categoria_Productos as cat
ON pr.IDCategoria = cat.IDCategoria 
LEFT JOIN ExamenUnir.Tienda_Detalles_Facturas as det
ON pr.IDProducto = det.IDProducto 
-- WHERE cat.IDCategoria IS NOT NULL (en el caso que no se quiera traer productos sin categoría)
GROUP BY  Pr.IDProducto 
HAVING C_Total > 30
ORDER BY C_Total DESC

/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El departamento comercial quiere identificar a los
   clientes que NUNCA han sido atendidos por un empleado
   que trabaje a media jornada. Muestra el IDCliente y la
   Denominación de dichos clientes.
   ----------------------------------------------------------- */


-- MI RESPUESTA (error: WHERE <> filtra filas, no entidades):
-- Devuelve 34 filas con clientes repetidos. Un cliente atendido
-- por media jornada Y por completa aparece por sus facturas de completa.
SELECT cli.IDCliente, cli.Denominacion
FROM ExamenUnir.Tienda_Clientes as cli
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
ON cli.IDCliente = fac.IDCliente
LEFT JOIN ExamenUnir.Tienda_Empleados as emp
ON fac.IDEmpleado = emp.IDEmpleado
WHERE emp.Jornada <> "Media Jornada";

-- CORRECCION: "NUNCA" = NOT IN. Buscar quién SÍ fue atendido
-- por media jornada, y luego excluir ESOS CLIENTES.
SELECT cli.IDCliente, cli.Denominacion
FROM Tienda_Clientes cli
WHERE cli.IDCliente NOT IN (
    SELECT DISTINCT fac.IDCliente
    FROM Tienda_Facturas fac
    INNER JOIN Tienda_Empleados emp ON fac.IDEmpleado = emp.IDEmpleado
    WHERE emp.Jornada = 'Media Jornada'
);
