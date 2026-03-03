/* ===========================================================
   SIMULACRO DE EXAMEN 07 — Examen tipo completo
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-19

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas.
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   El equipo de compras necesita un listado de los productos
   de color "Gris" cuyo precio de venta supere los 100€.
   Muestra el IDProducto, Nombre, Color y Precio de Venta.
   Ordena por precio de venta descendente.
   ----------------------------------------------------------- */

SELECT pr.IDProducto, pr.Nombre , pr.Color, pr.Precio_Venta 
FROM ExamenUnir.Tienda_Productos as pr
WHERE pr.Color = "Gris" AND pr.Precio_Venta > 100
ORDER BY pr.Precio_Venta DESC;


/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   El departamento de atención al cliente quiere revisar
   todas las facturas cuyos comentarios mencionen la palabra
   "entrega". Muestra el IDFactura, la Fecha de Compra,
   el Estado y los Comentarios. Ordena por Fecha de Compra
   descendente.
   ----------------------------------------------------------- */

SELECT fac.IDFactura, fac.Fecha_Compra, fac.Estado, fac.Comentarios 
FROM ExamenUnir.Tienda_Facturas as fac
WHERE fac.Comentarios LIKE "%entrega%"
ORDER BY fac.Fecha_Compra DESC;



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Dirección quiere conocer qué tiendas se abrieron antes
   del año 2000. Muestra la Razón Social de la tienda, su
   Fecha de Apertura y la Ciudad donde se ubica. Ordena por
   fecha de apertura ascendente.
   ----------------------------------------------------------- */

SELECT tie.RazonSocial , tie.FechaApertura, ter.Ciudad 
FROM ExamenUnir.Tienda_Tiendas as tie
LEFT JOIN ExamenUnir.Tienda_Territorio as ter
ON tie.IDTerritorio = ter.IDTerritorio 
WHERE tie.FechaApertura < "2000-12-31"
ORDER BY tie.FechaApertura ASC;


/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   El departamento de ventas necesita un informe de
   facturación por color de producto. Para cada color,
   muestra el total de ventas (sin impuestos) y el número
   de facturas distintas asociadas. Incluye solo facturas
   no canceladas. Ordena por total de ventas descendente.
   ----------------------------------------------------------- */

SELECT pro.Color, SUM(fac.Total_sin_impuestos) as total, COUNT(fac.IDFactura) as Nfacturas
FROM ExamenUnir.Tienda_Productos as pro
LEFT JOIN ExamenUnir.Tienda_Detalles_Facturas as det
ON pro.IDProducto = det.IDProducto 
INNER JOIN ExamenUnir.Tienda_Facturas as fac
ON det.IDFactura = fac.IDFactura 
WHERE fac.Estado <> "Cancelado" -- AND pro.Color IS NOT NULL
GROUP BY pro.Color 
ORDER BY total DESC;

/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Se necesita un listado de clientes de tipo "Particular"
   que tengan al menos 2 facturas con estado "Entregado".
   Muestra el IDCliente, la Denominación y el número de
   facturas entregadas. Ordena por número de facturas
   descendente.
   ----------------------------------------------------------- */

SELECT cli.IDCliente, cli.Denominacion, COUNT(fac.IDFactura ) as recuento
FROM ExamenUnir.Tienda_Clientes as cli
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
ON cli.IDCliente = fac.IDCliente 
WHERE cli.Tipo = "Particular" AND fac.Estado = "Entregado"
GROUP BY cli.IDCliente 
HAVING recuento >= 2
ORDER BY recuento DESC; 

/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   La dirección quiere un informe cruzando empleados con
   sus supervisores y su actividad comercial. Para cada
   empleado, muestra su Nombre, Apellidos, el Nombre de
   su supervisor, la Ciudad de la tienda donde trabaja y
   la suma total de ventas (sin impuestos) de facturas no
   canceladas. Muestra solo empleados con ventas totales
   superiores a 10.000€. Ordena por ventas descendente.
   ----------------------------------------------------------- */





/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El director comercial quiere identificar a los empleados
   que NUNCA han vendido un producto de intervalo de precio
   "Alto". Muestra el IDEmpleado, Nombre y Apellidos de
   dichos empleados.
   ----------------------------------------------------------- */


