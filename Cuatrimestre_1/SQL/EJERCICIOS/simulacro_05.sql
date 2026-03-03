/* ===========================================================
   SIMULACRO DE EXAMEN 05 — Especial NOT IN
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-18

   Este simulacro es monotemático: TODAS las preguntas
   requieren el patrón "NUNCA hizo X" (NOT IN con subconsulta).

   Para cada pregunta se incluye el enfoque INCORRECTO
   (cómo lo resolverías MAL con WHERE <>) para que veas
   la trampa y escribas la solución correcta debajo.
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (Dificultad: BAJA)

   El responsable de logística quiere saber qué tiendas NO
   han tenido NUNCA una factura cancelada. Muestra el
   IDTienda y la Razón Social de esas tiendas.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL (filtra filas, no tiendas):
-- SELECT DISTINCT ti.IDTienda, ti.RazonSocial
-- FROM Tienda_Tiendas ti
-- INNER JOIN Tienda_Facturas fac ON ti.IDTienda = fac.IDTienda
-- WHERE fac.Estado <> 'Cancelado';
-- ^ Esto devuelve tiendas que tienen ALGUNA factura no cancelada.
--   Una tienda con 5 entregadas y 1 cancelada APARECE, pero no debería.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:


SELECT tie.IDTienda, tie.RazonSocial 
FROM ExamenUnir.Tienda_Tiendas as tie
WHERE tie.IDTienda NOT IN (
	SELECT fac.IDTienda 
	FROM ExamenUnir.Tienda_Facturas as fac
	WHERE fac.Estado = "Cancelado"
	)


/* -----------------------------------------------------------
   PREGUNTA 2 (Dificultad: BAJA)

   Marketing quiere identificar a los clientes que NUNCA
   han comprado un producto de intervalo de precio "Alto".
   Muestra el IDCliente y la Denominación.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT fac.IDCliente, cli.Denominacion
-- FROM Tienda_Facturas fac
-- INNER JOIN Tienda_Detalles_Facturas det ON fac.IDFactura = det.IDFactura
-- INNER JOIN Tienda_Productos pr ON det.IDProducto = pr.IDProducto
-- INNER JOIN Tienda_Clientes cli ON fac.IDCliente = cli.IDCliente
-- WHERE pr.Intervalo_Precio <> 'Alto';
-- ^ Esto devuelve clientes que compraron ALGO que no es Alto.
--   Un cliente que compró 1 bici (Alto) y 1 camiseta (Bajo) APARECE.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:

SELECT cli.IDCliente , cli.Denominacion 
FROM ExamenUnir.Tienda_Clientes as cli
WHERE cli.IDCliente NOT IN (
	SELECT fac.IDCliente
	FROM ExamenUnir.Tienda_Facturas as fac
	INNER JOIN ExamenUnir.Tienda_Detalles_Facturas as det
	ON fac.IDFactura = det.IDFactura 
	LEFT JOIN ExamenUnir.Tienda_Productos as pro
	ON det.IDProducto = pro.IDProducto 
	WHERE pro.Intervalo_Precio  = "Alto"
)
	

/* -----------------------------------------------------------
   PREGUNTA 3 (Dificultad: MEDIA)

   Recursos Humanos quiere saber qué empleados NO han
   atendido NUNCA a un cliente de tipo "Empresa". Muestra
   el IDEmpleado, Nombre y Apellidos.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT emp.IDEmpleado, emp.Nombre, emp.Apellidos
-- FROM Tienda_Empleados emp
-- INNER JOIN Tienda_Facturas fac ON emp.IDEmpleado = fac.IDEmpleado
-- INNER JOIN Tienda_Clientes cli ON fac.IDCliente = cli.IDCliente
-- WHERE cli.Tipo <> 'Empresa';
-- ^ Un empleado que atendió a Particular Y Empresa aparece
--   (por sus facturas de Particular). Pero SÍ atendió a Empresa.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:





/* -----------------------------------------------------------
   PREGUNTA 4 (Dificultad: MEDIA)

   Control de calidad quiere identificar qué productos NO
   han aparecido NUNCA en una factura que acabase cancelada.
   Muestra el IDProducto y el Nombre del producto.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT pr.IDProducto, pr.Nombre
-- FROM Tienda_Productos pr
-- INNER JOIN Tienda_Detalles_Facturas det ON pr.IDProducto = det.IDProducto
-- INNER JOIN Tienda_Facturas fac ON det.IDFactura = fac.IDFactura
-- WHERE fac.Estado <> 'Cancelado';
-- ^ Devuelve productos vendidos en facturas no canceladas.
--   Un producto vendido en 1 cancelada y 3 entregadas APARECE.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:



/* -----------------------------------------------------------
   PREGUNTA 5 (Dificultad: MEDIA-ALTA)

   El departamento comercial quiere identificar a los
   clientes que NUNCA han comprado en una tienda ubicada
   en el País Vasco. Muestra el IDCliente y la Denominación.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT cli.IDCliente, cli.Denominacion
-- FROM Tienda_Clientes cli
-- INNER JOIN Tienda_Facturas fac ON cli.IDCliente = fac.IDCliente
-- INNER JOIN Tienda_Tiendas ti ON fac.IDTienda = ti.IDTienda
-- INNER JOIN Tienda_Territorio ter ON ti.IDTerritorio = ter.IDTerritorio
-- WHERE ter.Comunidad <> 'Pais Vasco';
-- ^ Un cliente que compró en Bilbao Y en Sevilla aparece
--   (por su compra de Sevilla). Pero SÍ compró en País Vasco.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:



/* -----------------------------------------------------------
   PREGUNTA 6 (Dificultad: ALTA)

   Dirección quiere saber en qué tiendas NO se ha vendido
   NUNCA un producto de la categoría "Bicicletas". Muestra
   el IDTienda y la Razón Social.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT ti.IDTienda, ti.RazonSocial
-- FROM Tienda_Tiendas ti
-- INNER JOIN Tienda_Facturas fac ON ti.IDTienda = fac.IDTienda
-- INNER JOIN Tienda_Detalles_Facturas det ON fac.IDFactura = det.IDFactura
-- INNER JOIN Tienda_Productos pr ON det.IDProducto = pr.IDProducto
-- INNER JOIN Tienda_Categoria_Productos cat ON pr.IDCategoria = cat.IDCategoria
-- WHERE cat.Nombre_Categoria <> 'Bicicletas';
-- ^ Devuelve tiendas que vendieron ALGO que no es bici.
--   Una tienda que vendió bicis Y ropa APARECE (por la ropa).

-- ESCRIBE AQUI LA SOLUCION CORRECTA:



/* -----------------------------------------------------------
   PREGUNTA 7 (Dificultad: ALTA)

   El jefe de ventas quiere saber qué empleados NO han
   vendido NUNCA un producto de la categoría "Ropa".
   Muestra el IDEmpleado, Nombre y Apellidos.
   ----------------------------------------------------------- */

-- ASI LO HARIAS MAL:
-- SELECT DISTINCT emp.IDEmpleado, emp.Nombre, emp.Apellidos
-- FROM Tienda_Empleados emp
-- INNER JOIN Tienda_Facturas fac ON emp.IDEmpleado = fac.IDEmpleado
-- INNER JOIN Tienda_Detalles_Facturas det ON fac.IDFactura = det.IDFactura
-- INNER JOIN Tienda_Productos pr ON det.IDProducto = pr.IDProducto
-- INNER JOIN Tienda_Categoria_Productos cat ON pr.IDCategoria = cat.IDCategoria
-- WHERE cat.Nombre_Categoria <> 'Ropa';
-- ^ Un empleado que vendió Ropa Y Equipamiento aparece
--   (por el Equipamiento). Pero SÍ vendió Ropa.

-- ESCRIBE AQUI LA SOLUCION CORRECTA:


