/* ===========================================================
   SIMULACRO DE EXAMEN 06 — Examen tipo completo
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-18

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas.
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   El departamento de producto necesita revisar los artículos
   dados de alta durante el año 2023 cuya descripción
   mencione la palabra "rendimiento". Muestra el IDProducto,
   Nombre, Descripción y Fecha de Alta del Producto.
   ----------------------------------------------------------- */


-- MI RESPUESTA (falta Descripcion en el SELECT):
SELECT pro.IDProducto , pro.Nombre, pro.Fecha_Alta_Producto
FROM ExamenUnir.Tienda_Productos as pro
WHERE pro.Fecha_Alta_Producto BETWEEN "2023-01-01" AND "2023-12-31"
AND pro.Descripcion LIKE "%rendimiento%";

-- CORRECCION: Añadir pro.Descripcion que pide el enunciado.
SELECT pro.IDProducto, pro.Nombre, pro.Descripcion, pro.Fecha_Alta_Producto
FROM Tienda_Productos pro
WHERE pro.Fecha_Alta_Producto BETWEEN '2023-01-01' AND '2023-12-31'
AND pro.Descripcion LIKE '%rendimiento%';

/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Logística quiere localizar las facturas que están en
   estado "Enviado" pero que todavía NO tienen fecha de
   entrega registrada. Muestra el IDFactura, la Fecha de
   Compra, el Estado y la Fecha de Envío Estimada.
   Ordena por Fecha de Compra ascendente.
   ----------------------------------------------------------- */


SELECT fac.IDFactura, 
fac.Fecha_Compra,
fac.Estado, 
fac.Fecha_Envio_Estimada 
FROM ExamenUnir.Tienda_Facturas as fac
WHERE fac.Estado = "Enviado" AND fac.Fecha_Entrega IS NULL
ORDER BY fac.Fecha_Compra DESC;
-- CORRECCION: El enunciado dice "ascendente", no DESC.
-- ORDER BY fac.Fecha_Compra ASC;
-- Ademas, borrar el "Select * FROM" suelto (error de sintaxis).

/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Dirección quiere un listado de clientes de tipo
   "Particular" cuyo gasto acumulado esté entre 500€ y
   50.000€. Muestra 
   el IDCliente, la Denominación, la
   Provincia y el Gasto Acumulado. Ordena por gasto
   acumulado descendente.
   ----------------------------------------------------------- */


SELECT 
cli.IDCliente, 
cli.Denominacion, cli.Provincia, cli.GastoAcumulado 
FROM ExamenUnir.Tienda_Clientes as cli
WHERE cli.Tipo = "Particular" AND cli.GastoAcumulado BETWEEN 500 AND 50000 
ORDER BY cli.GastoAcumulado DESC; 


/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   El responsable de RRHH quiere ver a los empleados cuya
   comisión por venta sea superior al 2% y que hayan
   gestionado al menos una factura entregada. Muestra el
   Nombre, Apellidos, Comisión por Venta y el número de
   facturas con estado "Entregado". Ordena por número de
   facturas descendente.
   ----------------------------------------------------------- */


-- MI RESPUESTA (falta filtro de comision > 0.02):
SELECT  emp.Nombre , emp.Apellidos , emp.ComisionPorVenta, COUNT(fac.Estado) as N_Facturas
FROM ExamenUnir.Tienda_Empleados as emp
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
ON emp.IDEmpleado = fac.IDEmpleado
WHERE fac.Estado = "Entregado"
GROUP BY emp.IDEmpleado
ORDER BY N_Facturas DESC;

-- CORRECCION: Añadir filtro de comision que pide el enunciado.
SELECT emp.Nombre, emp.Apellidos, emp.ComisionPorVenta, COUNT(fac.IDFactura) AS N_Facturas
FROM Tienda_Empleados emp
INNER JOIN Tienda_Facturas fac ON emp.IDEmpleado = fac.IDEmpleado
WHERE emp.ComisionPorVenta > 0.02 AND fac.Estado = 'Entregado'
GROUP BY emp.IDEmpleado
ORDER BY N_Facturas DESC;


/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Se necesita un informe del gasto medio por factura de
   cada cliente de tipo "Particular", excluyendo facturas
   canceladas. Muestra el IDCliente, la Denominación y el
   importe medio (sin impuestos) redondeado a 2 decimales.
   Incluye solo los que tengan un importe medio superior
   a 500€. Ordena por importe medio descendente.
   ----------------------------------------------------------- */


SELECT cli.IDCliente, cli.Denominacion, ROUND(AVG(fac.Total_sin_impuestos ),2) as Importe_medio
FROM ExamenUnir.Tienda_Clientes as cli
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
	ON cli.IDCliente = fac.IDCliente 
WHERE cli.Tipo = "Particular" AND fac.Estado <> "Cancelado"
GROUP BY cli.IDCliente 
HAVING Importe_medio > 500
ORDER BY Importe_medio DESC; 

/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   Para cada empleado, la dirección quiere conocer su
   Nombre, Apellidos, el nombre de su supervisor directo,
   la Razón Social de la tienda donde trabaja y el número
   total de facturas no canceladas que ha gestionado.
   Muestra solo los empleados con más de 2 facturas no
   canceladas. Ordena por número de facturas descendente.
   ----------------------------------------------------------- */



SELECT 
	emp.Nombre,
	emp.Apellidos, 
	emp.SupervisorIDEmpleado,
	sup.Nombre,
	tie.RazonSocial,
	COUNT(fac.IDEmpleado) as N_Facturas
FROM ExamenUnir.Tienda_Empleados AS emp
INNER JOIN ExamenUnir.Tienda_Empleados AS sup 
ON emp.SupervisorIDEmpleado = sup.IDEmpleado  
INNER JOIN ExamenUnir.Tienda_Tiendas as tie
ON emp.IDTienda = tie.IDTienda 
LEFT JOIN ExamenUnir.Tienda_Facturas as fac 
ON emp.IDEmpleado = fac.IDEmpleado 
WHERE fac.Estado <> "Cancelado"
GROUP BY emp.IDEmpleado 
HAVING N_Facturas > 2
ORDER BY N_Facturas DESC;



/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   Comercial quiere identificar las tiendas en las que
   NUNCA se ha vendido un producto de la categoría
   "Suplementos Alimenticios". Muestra el IDTienda, la
   Razón Social y la Ciudad donde se ubica la tienda.
   ----------------------------------------------------------- */


-- MI RESPUESTA (ON incorrecto: pro.IDProducto = cat.IDCategoria):
SELECT tie.IDTienda, tie.RazonSocial, ter.Ciudad
FROM ExamenUnir.Tienda_Tiendas as tie
LEFT JOIN ExamenUnir.Tienda_Territorio as ter
ON tie.IDTerritorio = ter.IDTerritorio
WHERE tie.IDTienda NOT IN (
	SELECT fac.IDTienda
	FROM ExamenUnir.Tienda_Facturas as fac
	LEFT JOIN ExamenUnir.Tienda_Detalles_Facturas as det
	ON fac.IDFactura = det.IDFactura
	LEFT JOIN ExamenUnir.Tienda_Productos as pro
	ON det.IDProducto = pro.IDProducto
	LEFT JOIN ExamenUnir.Tienda_Categoria_Productos as cat
	ON pro.IDCategoria  = cat.IDCategoria   -- ERROR: columnas cruzadas
	WHERE cat.Nombre_Categoria = "Suplementos Alimenticios"
);

-- CORRECCION: pro.IDCategoria = cat.IDCategoria (FK de producto a categoría).
-- Truco para el examen: antes de escribir un ON, piensa "¿qué columna
-- de esta tabla REFERENCIA a la otra?" — siempre es la FK, no la PK propia.
SELECT tie.IDTienda, tie.RazonSocial, ter.Ciudad
FROM Tienda_Tiendas tie
INNER JOIN Tienda_Territorio ter ON tie.IDTerritorio = ter.IDTerritorio
WHERE tie.IDTienda NOT IN (
    SELECT DISTINCT fac.IDTienda
    FROM Tienda_Facturas fac
    INNER JOIN Tienda_Detalles_Facturas det ON fac.IDFactura = det.IDFactura
    INNER JOIN Tienda_Productos pro ON det.IDProducto = pro.IDProducto
    INNER JOIN Tienda_Categoria_Productos cat ON pro.IDCategoria = cat.IDCategoria
    WHERE cat.Nombre_Categoria = 'Suplementos Alimenticios'
);
