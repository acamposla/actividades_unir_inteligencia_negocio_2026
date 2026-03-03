/* ===========================================================
   ACTIVIDAD 2: CONSULTAS SQL
   Grupo 3 - Lote 3
   Alejandro Campos
   Leticia Florido
   MYSQL
   =========================================================== */

/* -----------------------------------------------------------
   EJERCICIO 1: Listado de productos (Precio > 20 y Talla XS-XL)
   ----------------------------------------------------------- */
SELECT 
    pr.Nombre, 
    pr.NumeroProducto, 
    pr.Color 
FROM actividad_2.EC_Productos AS pr 
WHERE pr.Precio > 20 
  AND pr.Talla_disponibles IN ('XS-XL');

/* -----------------------------------------------------------
   EJERCICIO 2: Clientes Individuos (1970-1980, no investigadores)
   ----------------------------------------------------------- */
SELECT 
    cli.IDCliente,     
    cli.Nombre, 
    cli.Apellidos, 
    cli.Genero 
FROM actividad_2.EC_Clientes_IN AS cli
WHERE cli.Fecha_Nacimiento BETWEEN '1970-01-01' AND '1980-12-31'
  AND cli.Ocupacion <> 'investigador' 
ORDER BY cli.Fecha_Primera_Compra DESC;

/* -----------------------------------------------------------
   EJERCICIO 3: Facturas con códigos específicos en observaciones
   ----------------------------------------------------------- */
SELECT 
    fact.IDFactura, 
    fact.FechaPedido, 
    fact.FechaEnvio, 
    fact.EstadoPedido 
FROM actividad_2.EC_Facturas AS fact 
WHERE fact.Observaciones LIKE '%9658%' 
   OR fact.Observaciones LIKE '%4568%';

/* -----------------------------------------------------------
   EJERCICIO 4: Facturas canceladas con importe > 1000
   ----------------------------------------------------------- */
SELECT 
    fact.IDFactura,
    fact.IDCliente,
    fact.FechaPedido,
    fact.Total_con_Impuestos  
FROM actividad_2.EC_Facturas AS fact
WHERE fact.EstadoPedido IN ('Cancelado')
  AND fact.Total_con_Impuestos > 1000;

/* -----------------------------------------------------------
   EJERCICIO 5: Subconsulta para datos de cliente (basado en Ej. 4)
   ----------------------------------------------------------- */
SELECT 
    cli.Telefono,
    cli.DenominacionSocial 
FROM actividad_2.EC_Clientes_EM AS cli
WHERE cli.IDCliente IN (
    SELECT fact.IDCliente
    FROM actividad_2.EC_Facturas AS fact
    WHERE fact.EstadoPedido IN ('Cancelado')
      AND fact.Total_con_Impuestos > 1000
);

/* -----------------------------------------------------------
   EJERCICIO 6: Detalle de transacciones (Abril-Septiembre 2019)
   ----------------------------------------------------------- */
SELECT 
    fr.IDFactura,
    pr.Nombre AS NombreProducto,
    pr.Color,
    pr.Precio,
    tra.Cantidad,
    tra.Descuento
FROM actividad_2.EC_Facturas AS fr   
INNER JOIN actividad_2.EC_Transacciones AS tra 
    ON fr.IDFactura = tra.IDFactura 
LEFT JOIN actividad_2.EC_Productos AS pr
    ON tra.IDProducto = pr.IDProducto
WHERE fr.FechaPedido BETWEEN '2019-04-01' AND '2019-09-30';

/* -----------------------------------------------------------
   EJERCICIO 7: Estadísticas por Categoría de Producto
   ----------------------------------------------------------- */
SELECT 
    cat.Nombre AS Categoria,
    COUNT(pr.Nombre) AS cantidad_pr,
    MAX(pr.Precio) AS precio_max,
    MIN(pr.Precio) AS precio_min,
    AVG(pr.Precio) AS precio_medio
FROM actividad_2.EC_Cat_Productos AS cat 
LEFT JOIN actividad_2.EC_Productos AS pr 
    ON cat.GrupoProductoID = pr.GrupoProductoID 
GROUP BY cat.Nombre 
ORDER BY cantidad_pr DESC;

/* -----------------------------------------------------------
   EJERCICIO 8: Ventas por País y Región (Sin cancelados)
   ----------------------------------------------------------- */
SELECT 
    ter.Pais,
    ter.Region,
    SUM(fact.Total_con_Impuestos) AS total_ventas
FROM actividad_2.EC_Facturas AS fact
LEFT JOIN actividad_2.EC_Clientes AS cl
    ON fact.IDCliente = cl.IDCliente 
LEFT JOIN actividad_2.EC_Territorio AS ter
    ON cl.TerritorioID = ter.TerritorioID
WHERE fact.EstadoPedido <> 'Cancelado'
GROUP BY ter.Pais, ter.Region
ORDER BY total_ventas ASC;

/* -----------------------------------------------------------
   EJERCICIO 9: Clientes Individuos VIP (>1500€ sin impuestos)
   ----------------------------------------------------------- */
SELECT 	
    clin.Nombre AS Nombre_cliente,                 
    COUNT(fact.IDFactura) AS Numero_de_pedidos, 
    SUM(fact.Total) AS montante_total, -- Total sin impuestos
    totalcli.NumeroCuenta
FROM actividad_2.EC_Facturas AS fact 
INNER JOIN actividad_2.EC_Clientes_IN AS clin
    ON fact.IDCliente = clin.IDCliente 
LEFT JOIN actividad_2.EC_Clientes AS totalcli
    ON fact.IDCliente = totalcli.IDCliente 
GROUP BY clin.Nombre, totalcli.NumeroCuenta
HAVING montante_total > 1500                
ORDER BY montante_total DESC;

/* ===========================================================
   SECCIÓN: PROPUESTAS DE CONSULTA PROPIAS
   =========================================================== */

/* -----------------------------------------------------------
   PROPUESTA 1 (Dificultad Baja)
   Obtener un listado de clientes (mujeres) ordenadas
   por apellido descendente.
   ----------------------------------------------------------- */
SELECT Nombre, Apellidos, Genero
FROM actividad_2.EC_Clientes_IN AS clin
WHERE clin.Genero = 'F' 
ORDER BY clin.Apellidos DESC;

/* -----------------------------------------------------------
   PROPUESTA 2 (Dificultad Media-Baja)
   Cantidad de facturas por cliente y fecha de su 
   último pedido, ordenado por fecha ascendente.
   ----------------------------------------------------------- */
SELECT
    fact.IDCliente,
    COUNT(fact.IDFactura) AS Cantidad_facturas,
    MAX(fact.FechaPedido) AS fecha_ultimo_pedido
FROM actividad_2.EC_Facturas AS fact
GROUP BY fact.IDCliente 
ORDER BY fecha_ultimo_pedido ASC;

/* -----------------------------------------------------------
   PROPUESTA 3 (Dificultad Media-Alta)
   Total de unidades vendidas por producto para la
   categoría 'Camisa', mostrando solo aquellos con más de 20 ventas.
   ----------------------------------------------------------- */
SELECT 
    cat.Nombre AS Categoria,
    prod.Nombre AS Producto,
    SUM(trans.Cantidad) AS Unidades_Vendidas
FROM actividad_2.EC_Cat_Productos AS cat
INNER JOIN actividad_2.EC_Productos AS prod 
    ON cat.GrupoProductoID = prod.GrupoProductoID
INNER JOIN actividad_2.EC_Transacciones AS trans 
    ON prod.IDProducto = trans.IDProducto
WHERE cat.Nombre = 'Camisa'
GROUP BY cat.Nombre, prod.Nombre
HAVING Unidades_Vendidas > 20;

/* -----------------------------------------------------------
   PROPUESTA 4 (Dificultad Alta)
   Enunciado: Clientes que NUNCA han comprado un producto de 
   color Rojo.
   ----------------------------------------------------------- */
SELECT Nombre, Apellidos
FROM actividad_2.EC_Clientes_IN
WHERE IDCliente NOT IN (
    SELECT DISTINCT f.IDCliente
    FROM actividad_2.EC_Facturas f
    JOIN actividad_2.EC_Transacciones t ON f.IDFactura = t.IDFactura
    JOIN actividad_2.EC_Productos p ON t.IDProducto = p.IDProducto
    WHERE p.Color = 'ROJO'
);