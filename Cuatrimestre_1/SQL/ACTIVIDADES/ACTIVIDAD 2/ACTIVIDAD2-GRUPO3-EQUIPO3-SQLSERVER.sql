/* ===========================================================
   ACTIVIDAD 2: CONSULTAS SQL (Versión SQL Server)
   Asignatura: Fundamentos Tecnológicos
   Autores: [Vuestros Nombres]
   =========================================================== */

USE actividad_2; 

/* -----------------------------------------------------------
   1. Listado de productos (Precio > 20 y Talla XS-XL)
   ----------------------------------------------------------- */
SELECT Nombre,
       NumeroProducto,
       Color
FROM EC_Productos
WHERE Precio > 20 
  AND Talla_disponibles IN ('XS-XL');

/* -----------------------------------------------------------
   2. Clientes Individuos (1970-1980, no investigadores)
   ----------------------------------------------------------- */
SELECT IDCliente,
       Nombre,
       Apellidos,
       Genero
FROM EC_Clientes_IN
WHERE CONVERT(date, Fecha_Nacimiento, 103) BETWEEN '1970-01-01' AND '1980-12-31'
  AND Ocupacion <> 'Investigador'
ORDER BY Fecha_primera_compra DESC;

/* -----------------------------------------------------------
   3. Facturas con códigos 9658 y 4568 en observaciones
   ----------------------------------------------------------- */
SELECT IDFactura,
       FechaPedido,
       FechaEnvio,
       EstadoPedido
FROM EC_Facturas
WHERE Observaciones LIKE '%9658%'  
   OR Observaciones LIKE '%4568%';

/* -----------------------------------------------------------
   4. Facturas canceladas con total > 1000
   ----------------------------------------------------------- */
SELECT IDFactura,
       IDCliente,
       FechaPedido,
       Total_con_Impuestos
FROM EC_Facturas
WHERE EstadoPedido = 'Cancelado'
  AND Total_con_Impuestos > 1000;

/* -----------------------------------------------------------
   5. Subconsulta: Datos de clientes de las facturas anteriores
   ----------------------------------------------------------- */
SELECT DenominacionSocial,
       Telefono
FROM EC_Clientes_EM	
WHERE IDCliente IN (
    SELECT IDCliente
    FROM EC_Facturas
    WHERE EstadoPedido = 'Cancelado'
      AND Total_con_Impuestos > 1000
);

/* -----------------------------------------------------------
   6. Transacciones entre abril y septiembre de 2019
   ----------------------------------------------------------- */
SELECT Fr.IDFactura,
       Pr.Nombre AS NombreProducto,
       Pr.Color,
       Pr.Precio AS PrecioUnitario,
       Tr.Cantidad,
       Tr.Descuento AS PorcDescuento
FROM EC_Transacciones AS Tr
INNER JOIN EC_Facturas AS Fr
    ON Tr.IDFactura = Fr.IDFactura
INNER JOIN EC_Productos AS Pr
    ON Tr.IDProducto = Pr.IDProducto
-- Usamos < '2019-10-01' para incluir todo septiembre completo
WHERE CONVERT(date, Fr.FechaPedido, 103) >= '2019-04-01'
  AND CONVERT(date, Fr.FechaPedido, 103) < '2019-10-01';

/* -----------------------------------------------------------
   7. Estadísticas por categoría de producto
   ----------------------------------------------------------- */
SELECT Cat.Nombre AS Categoria,
       COUNT(Pr.IDProducto) AS ProductosPorCategoria,
       ROUND(MAX(Pr.Precio), 2) AS PrecioMaximo,
       ROUND(MIN(Pr.Precio), 2) AS PrecioMinimo,
       ROUND(AVG(Pr.Precio), 2) AS PrecioMedio
FROM EC_Cat_Productos AS Cat
INNER JOIN EC_Productos AS Pr
    ON Pr.GrupoProductoID = Cat.GrupoProductoID
GROUP BY Cat.GrupoProductoID, Cat.Nombre
ORDER BY ProductosPorCategoria DESC;

/* -----------------------------------------------------------
   8. Ventas totales por país y región (Sin cancelados)
   ----------------------------------------------------------- */
SELECT Tr.Pais,
       Tr.Region,
       ROUND(SUM(Fr.Total_con_Impuestos), 2) AS VentasTotalesConImpuestos
FROM EC_Facturas AS Fr
INNER JOIN EC_Clientes AS Cl
    ON Fr.IDCliente = Cl.IDCliente
INNER JOIN EC_Territorio AS Tr
    ON Cl.TerritorioID = Tr.TerritorioID
WHERE Fr.EstadoPedido <> 'Cancelado'
GROUP BY Tr.Pais, Tr.Region
ORDER BY VentasTotalesConImpuestos ASC;

/* -----------------------------------------------------------
   9. Clientes Individuos VIP (>1500€ total sin impuestos)
   ----------------------------------------------------------- */
SELECT ClIn.Nombre,
       Cl.NumeroCuenta,
       COUNT(Fr.IDFactura) AS NumeroPedidos,
       ROUND(SUM(Fr.Total), 2) AS TotalSinImpuestos
FROM EC_Clientes_IN AS ClIn
INNER JOIN EC_Clientes AS Cl
    ON ClIn.IDCliente = Cl.IDCliente
INNER JOIN EC_Facturas AS Fr
    ON Cl.IDCliente = Fr.IDCliente
GROUP BY ClIn.Nombre, Cl.NumeroCuenta
HAVING SUM(Fr.Total) > 1500
ORDER BY TotalSinImpuestos DESC;

/* ===========================================================
   SECCIÓN: PROPUESTAS DE CONSULTA PROPIAS
   =========================================================== */

/* -----------------------------------------------------------
   Propuesta Baja: Productos baratos (<50€)
   ----------------------------------------------------------- */
SELECT Nombre,
       Color,
       Precio
FROM EC_Productos
WHERE Precio < 50
ORDER BY Precio ASC;

/* -----------------------------------------------------------
   Propuesta Media-Baja: Total pedidos por cliente individuo
   ----------------------------------------------------------- */
SELECT CIN.Nombre,
       CIN.Apellidos,
       CIN.Genero,
       COUNT(F.IDFactura) AS NumeroPedidos
FROM EC_Facturas AS F
INNER JOIN EC_Clientes_IN CIN
    ON F.IDCliente = CIN.IDCliente
GROUP BY CIN.Nombre, CIN.Apellidos, CIN.Genero
ORDER BY NumeroPedidos DESC;

/* -----------------------------------------------------------
   Propuesta Media-Alta: Ventas medias por territorio (>500€) 
   que no sean pedidos cancelados y ordenado de forma decreciente por Importe medio
   ----------------------------------------------------------- */
SELECT T.Pais,
       T.Region,
       AVG(Total_con_Impuestos) AS ImporteMedioVentasConImp
FROM EC_Territorio AS T
INNER JOIN EC_Clientes AS C
    ON T.TerritorioID = C.TerritorioID
INNER JOIN EC_Facturas AS F
    ON C.IDCliente = F.IDCliente
WHERE EstadoPedido <> 'Cancelado'
GROUP BY T.Pais, T.Region
HAVING AVG(F.Total_con_Impuestos) > 500
ORDER BY ImporteMedioVentasConImp DESC;

/* -----------------------------------------------------------
   Propuesta Alta: Territorios VIP (Min 2 pedidos y >500€ ventas)
   ----------------------------------------------------------- */
SELECT T.Pais,
       T.Region, 
       SUM(F.Total_con_Impuestos) AS TotalVentasConImpuestos,
       COUNT(F.IDFactura) AS TotalPedidos
FROM EC_Territorio AS T
INNER JOIN EC_Clientes AS C
    ON T.TerritorioID = C.TerritorioID
INNER JOIN EC_Facturas AS F
    ON C.IDCliente = F.IDCliente
WHERE EstadoPedido <> 'Cancelado'
GROUP BY T.Pais, T.Region
HAVING COUNT(F.IDFactura) >= 2
   AND SUM(F.Total_con_Impuestos) > 500
ORDER BY TotalVentasConImpuestos DESC;