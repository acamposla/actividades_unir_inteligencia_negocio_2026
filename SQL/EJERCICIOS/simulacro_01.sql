/* ===========================================================
   SIMULACRO DE EXAMEN 01 — Preparación examen SQL
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-14

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo del enunciado.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas (como en el examen real).
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   La dirección quiere revisar el catálogo de productos de
   precio bajo. Obtén un listado con el Nombre, Color y
   Precio de Venta de todos los productos cuyo intervalo de
   precio sea "Bajo", ordenados por Precio de Venta de mayor
   a menor.
   ----------------------------------------------------------- */


SELECT Nombre, Color, Precio_Venta 
FROM ExamenUnir.Tienda_Productos
WHERE Intervalo_Precio = 'Bajo'
ORDER BY Precio_Venta DESC; 



/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Recursos Humanos necesita un listado de los empleados que
   se incorporaron a la empresa entre el 1 de enero de 2010
   y el 31 de diciembre de 2015. Muestra su Nombre, Apellidos,
   Fecha de Incorporación y Salario Base. Ordénalos por fecha
   de incorporación ascendente.
   ----------------------------------------------------------- */

SELECT Nombre, Apellidos, FechaIncorporacion, SalarioBase 
FROM ExamenUnir.Tienda_Empleados
WHERE FechaIncorporacion BETWEEN '2010-01-01' AND '2015-12-31'
ORDER BY FechaIncorporacion ASC;



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   El departamento de atención al cliente necesita localizar
   todas las facturas cuyo campo de Comentarios contenga la
   palabra "contacto". Muestra el IDFactura, la Fecha de
   Compra, el Estado y los Comentarios de dichas facturas.
   ----------------------------------------------------------- */


SELECT IDFactura, Fecha_Compra, Estado, Comentarios 
FROM ExamenUnir.Tienda_Facturas
WHERE Comentarios LIKE '%contacto%';


/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   El departamento comercial quiere saber en qué tiendas
   trabajan los empleados a media jornada. Muestra el Nombre
   y Apellidos del empleado, su Salario Base, y la Razón
   Social de la tienda donde trabaja.
   (Necesitarás combinar dos tablas.)
   ----------------------------------------------------------- */


SELECT te.Nombre , te.Apellidos , te.SalarioBase , tt.RazonSocial 
FROM ExamenUnir.Tienda_Empleados as te
INNER JOIN ExamenUnir.Tienda_Tiendas as tt 
ON te.IDTienda = tt.IDTienda;



/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Se necesita un informe con el nombre de cada categoría de
   producto y cuántos productos tiene cada una. Muestra
   también el precio de venta máximo y el precio de venta
   medio de cada categoría. Ordena por número de productos
   de mayor a menor.
   (Ojo: puede haber categorías sin nombre.)
   ----------------------------------------------------------- */



SELECT cp.Nombre_Categoria, 
COUNT(pp.IDProducto) as NúmerodeProductos, 
MAX(pp.Precio_Venta) as PrecioVentaMax,
AVG(pp.Precio_Venta) as PrecioVentaAVG
FROM ExamenUnir.Tienda_Categoria_Productos as cp
INNER JOIN ExamenUnir.Tienda_Productos as pp
ON cp.IDCategoria = pp.IDCategoria 
GROUP BY cp.Nombre_Categoria , pp.IDCategoria;

/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   La dirección comercial quiere analizar las ventas por
   comunidad autónoma. Para cada comunidad, obtén: el número
   total de facturas y la suma total de ventas (sin impuestos).
   Muestra SOLO las comunidades que hayan facturado más de
   5.000€ en total. Excluye las facturas canceladas.
   Ordena por total de ventas descendente.
   (Necesitarás combinar varias tablas: facturas, tiendas y
   territorio.)
   ----------------------------------------------------------- */

# Lo comenzé a hacer así, pero a la hora de hacer el groupby me di cuenta
# de que facturas no tiene ID terriotorio
-- SELECT *
-- FROM ExamenUnir.Tienda_Facturas as fact
-- LEFT JOIN ExamenUnir.Tienda_Tiendas as tien
-- 	ON fact.IDTienda = tien.IDTienda 
-- INNER JOIN ExamenUnir.Tienda_Territorio as ter
-- 	ON tien.IDTerritorio  = ter.IDTerritorio 
-- GROUP BY ter.IDTerritorio, 

# Ahora he intentado esto, pero no me sale, volveré a intentarlo como antes
-- SELECT ter.Comunidad, COUNT(fac.IDFactura), SUM(fac.Total_sin_impuestos)
-- FROM ExamenUnir.Tienda_Territorio as ter
-- INNER JOIN ExamenUnir.Tienda_Tiendas as tie
-- ON ter.IDTerritorio = tie.IDTerritorio 
-- RIGHT JOIN ExamenUnir.Tienda_Facturas as fac
-- ON tie.IDTienda = fac.IDTienda 
-- GROUP BY ter.Comunidad, fac.IDFactura, fac.Total_sin_impuestos  

# tampoco me sale. Pruebo de otra manera

SELECT ter.Comunidad, COUNT(fact.IDFactura) as Facturas, SUM(fact.Total_sin_impuestos) as ventas
FROM ExamenUnir.Tienda_Facturas as fact
LEFT JOIN ExamenUnir.Tienda_Tiendas as tien
ON fact.IDTienda = tien.IDTienda 
INNER JOIN ExamenUnir.Tienda_Territorio as ter
ON tien.IDTerritorio  = ter.IDTerritorio 
WHERE fact.Estado <> 'Cancelado' 
GROUP BY ter.Comunidad 
HAVING Ventas > 5000
ORDER BY ventas DESC;




/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   Marketing quiere identificar a los clientes de tipo
   "Particular" que NUNCA han comprado un producto de la
   categoría "Bicicletas". Muestra el IDCliente y la
   Denominación de estos clientes.
   (Piensa en qué clientes SÍ han comprado bicicletas y
   cómo excluirlos.)
   ----------------------------------------------------------- */

# Esto estaría mal: dame las transacciones que NO sean 
# de bicicletas". Pero eso no es lo mismo que 
#"clientes que NUNCA compraron  bicicletas".                                                                                                                                                                             
                                                                           


SELECT fac.IDCliente, cli.Denominacion 
FROM ExamenUnir.Tienda_Detalles_Facturas as det
INNER JOIN ExamenUnir.Tienda_Facturas AS fac
ON det.IDFactura = fac.IDFactura 
LEFT JOIN ExamenUnir.Tienda_Productos as pro
ON det.IDProducto = pro.IDProducto 
INNER JOIN ExamenUnir.Tienda_Categoria_Productos as cat
ON pro.IDCategoria = cat.IDCategoria 
LEFT JOIN ExamenUnir.Tienda_Clientes AS cli
ON fac.IDCliente = cli.IDCliente 
WHERE cat.Nombre_Categoria <> 'Bicicletas'
AND cli.Tipo = 'Particular'
GROUP BY fac.IDCliente 


# Lo vuelvo a intentar:

SELECT fac.IDCliente , cli.Denominacion   
FROM ExamenUnir.Tienda_Detalles_Facturas as det
INNER JOIN ExamenUnir.Tienda_Facturas as fac
ON det.IDFactura  = fac.IDFactura 
LEFT JOIN ExamenUnir.Tienda_Clientes as cli
ON fac.IDCliente = cli.IDCliente 
WHERE det.IDProducto IN (SELECT pr.IDProducto 
FROM ExamenUnir.Tienda_Productos AS pr
INNER JOIN  ExamenUnir.Tienda_Categoria_Productos as cat
ON pr.IDCategoria = cat.IDCategoria 
WHERE cat.Nombre_Categoria  <> 'Bicicletas') 
AND cli.Tipo = 'Particular'
GROUP BY fac.IDCliente, det.IDProducto 


# parece que vuelve a estar mal. 



  -- SELECT * 
  -- FROM ExamenUnir.Tienda_Clientes                                                                                                                                                            
  -- WHERE Tipo = 'Particular'                                                                                                                                                                
  -- AND IDCliente NOT IN (                                                                                                                                   
  --     SELECT fac.IDCliente FROM  
    --  ExamenUnir.Tienda_Facturas as fac
    --  INNER JOIN ExamenUnir.Tienda_Detalles_Facturas as det
    --  ON fac.IDFactura = det.IDFactura
     --  ExamenUnir.Tienda_Productos AS pr
-- INNER JOIN  ExamenUnir.Tienda_Categoria_Productos as cat
-- ON pr.IDCategoria = cat.IDCategoria 
-- WHERE cat.Nombre_Categoria  = 'Bicicletas'                                                                                                                           
 -- )                                                                                                                                                                                        
       
# la solucion

SELECT cli.IDCliente, cli.Denominacion
  FROM Tienda_Clientes cli
  WHERE cli.Tipo = 'Particular'
  AND cli.IDCliente NOT IN (
      SELECT DISTINCT fac.IDCliente
      FROM Tienda_Facturas fac
      INNER JOIN Tienda_Detalles_Facturas det ON fac.IDFactura = det.IDFactura
      INNER JOIN Tienda_Productos pro ON det.IDProducto = pro.IDProducto
      INNER JOIN Tienda_Categoria_Productos cat ON pro.IDCategoria = cat.IDCategoria
      WHERE cat.Nombre_Categoria = 'Bicicletas');
