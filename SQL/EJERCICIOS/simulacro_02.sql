/* ===========================================================
   SIMULACRO DE EXAMEN 02 — Preparación examen SQL
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

   El equipo de catálogo ha detectado que algunos productos
   no tienen color registrado. Obtén un listado con el
   Nombre, Precio de Compra y Precio de Venta de todos los
   productos que NO tengan color asignado. Ordénalos por
   Precio de Venta descendente.
   ----------------------------------------------------------- */

SELECT Nombre, Precio_Compra , Precio_Venta 
FROM ExamenUnir.Tienda_Productos
WHERE color is NULL
ORDER BY Precio_Venta DESC; 




/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Dirección quiere identificar a los grandes clientes.
   Obtén el IDCliente, Denominación, Tipo y Gasto Acumulado
   de todos los clientes cuyo gasto acumulado supere los
   100.000€. Ordénalos por gasto acumulado de mayor a menor.
   ----------------------------------------------------------- */


SELECT IDCliente , Denominacion , Tipo , GastoAcumulado 
FROM ExamenUnir.Tienda_Clientes
WHERE GastoAcumulado > 100000
ORDER BY GastoAcumulado DESC; 



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Logística necesita un informe de las entregas completadas
   durante el año 2022. Muestra el IDFactura, la Fecha de
   Compra, la Fecha de Entrega y la Denominación del cliente.
   Solo incluye facturas con estado "Entregado".
   Ordena por Fecha de Entrega ascendente.
   (Necesitarás combinar dos tablas.)
   ----------------------------------------------------------- */


SELECT IDFactura , Fecha_Compra , Fecha_Entrega, Denominacion 
FROM ExamenUnir.Tienda_Facturas
INNER JOIN ExamenUnir.Tienda_Clientes 
ON ExamenUnir.Tienda_Facturas.IDCliente = ExamenUnir.Tienda_Clientes.IDCliente 
WHERE Estado  = 'Entregado' AND Fecha_Compra BETWEEN '2022-01-01' AND '2022-12-31'
ORDER BY Fecha_Entrega ASC; 


/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   Recursos Humanos quiere un organigrama básico. Para cada
   empleado, muestra su Nombre, Apellidos, y el Nombre y
   Apellidos de su supervisor directo. Ordena por apellidos
   del empleado.
   
   ----------------------------------------------------------- */


SELECT emp.Nombre as nombreempleado ,
emp.Apellidos as apellidoempleado, 
jef.Nombre, 
jef.Apellidos 
FROM ExamenUnir.Tienda_Empleados as emp 
INNER JOIN ExamenUnir.Tienda_Empleados as jef 
ON emp.SupervisorIDEmpleado   = jef.IDEmpleado   
ORDER BY emp.Apellidos 



/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Comercial necesita saber cuántas unidades se han vendido
   en total 
   de cada categoría de producto. Muestra el nombre
   de la categoría y el total de unidades vendidas. Ordena
   por unidades vendidas de mayor a menor.

   ----------------------------------------------------------- */


Select ca.Nombre_Categoria, SUM(de.Cantidad) as Cantidad
FROM ExamenUnir.Tienda_Detalles_Facturas as de
LEFT JOIN ExamenUnir.Tienda_Productos as pr
ON de.IDProducto = pr.IDProducto 
INNER JOIN ExamenUnir.Tienda_Categoria_Productos as ca
ON pr.IDCategoria = ca.IDCategoria 
GROUP BY ca.IDCategoria
ORDER BY Cantidad DESC; 



/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   La dirección quiere evaluar el rendimiento de cada
   empleado. Para cada empleado que haya gestionado facturas
   NO canceladas, muestra: su Nombre, Apellidos, la Razón
   Social de la tienda donde trabaja, la Comunidad Autónoma
   de esa tienda, y la suma total de ventas (sin impuestos).
   Muestra SOLO los empleados cuyo total de ventas supere
   los 15.000€. Ordena por total de ventas descendente.
   ----------------------------------------------------------- */


SELECT emp.Nombre, emp.Apellidos, tie.RazonSocial, ter.Comunidad, SUM(fac.Total_sin_impuestos) as total_sin_impuestos
FROM Exatanto menUnir.Tienda_Empleados as emp
INNER JOIN ExamenUnir.Tienda_Tiendas as tie 
ON emp.IDTienda = tie.IDTienda 
INNER JOIN ExamenUnir.Tienda_Territorio as ter
ON tie.IDTerritorio = ter.IDTerritorio 
INNER JOIN ExamenUnir.Tienda_Facturas as fac
ON emp.IDEmpleado = fac.IDEmpleado 
WHERE fac.Estado <> 'Cancelado'
GROUP BY emp.IDEmpleado 
HAVING total_sin_impuestos > 15000
ORDER BY total_sin_impuestos DESC; 


/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El departamento de calidad quiere revisar qué empleados
   NO han gestionado NUNCA una factura que haya acabado
   cancelada. Muestra el IDEmpleado, Nombre y Apellidos
   de dichos empleados.
  
   ----------------------------------------------------------- */

SELECT emp.IDEmpleado , emp.Nombre , emp.Apellidos 
FROM ExamenUnir.Tienda_Empleados as emp
WHERE emp.IDEmpleado NOT IN (
SELECT fac.IDEmpleado
FROM ExamenUnir.Tienda_Facturas as fac
WHERE fac.Estado = 'Cancelado'
)



