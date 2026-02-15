-- Actividad 3
---PARTE I: SERIES TEMPORALES

SELECT  SH.SalesOrderID,
        SH.OrderDate,
        SUM(SO.LineTotal) AS Subtotal
FROM AdventureWorks2017.Sales.SalesOrderHeader AS SH
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail AS SO
    ON SH.SalesOrderID = SO.SalesOrderID
GROUP BY SH.SalesOrderID, SH.OrderDate
ORDER BY SH.OrderDate DESC;

select *
from AdventureWorks2017.Sales.SalesOrderDetail

SELECT  SH.SalesOrderID,
        SH.OrderDate,
        SUM(SO.LineTotal) AS Subtotal
FROM AdventureWorks2017.Sales.SalesOrderHeader AS SH
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail AS SO
    ON SH.SalesOrderID = SO.SalesOrderID
LEFT JOIN AdventureWorks2017.Sales.SalesTerritory AS ST
    ON SH.TerritoryID = ST.TerritoryID
WHERE ST.[Group] IN ('North America', 'Europe', 'Pacific')
GROUP BY SH.SalesOrderID, SH.OrderDate
ORDER BY SH.OrderDate DESC




SELECT
    CAST(H.OrderDate AS DATE) AS Fecha,
    SUM(D.LineTotal) AS VentasGlobales
FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
    ON H.SalesOrderID = D.SalesOrderID
WHERE YEAR(H.OrderDate) BETWEEN 2011 AND 2014
GROUP BY CAST(H.OrderDate AS DATE)
ORDER BY Fecha



SELECT
    CAST(H.OrderDate AS DATE) AS Fecha,
    SUM(D.LineTotal) AS Ventas_USA
FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
    ON H.SalesOrderID = D.SalesOrderID
INNER JOIN AdventureWorks2017.Sales.SalesTerritory T
    ON H.TerritoryID = T.TerritoryID
WHERE YEAR(H.OrderDate) BETWEEN 2011 AND 2014
  AND T.[Group] = 'North America'
GROUP BY CAST(H.OrderDate AS DATE)

SELECT
    CAST(H.OrderDate AS DATE) AS Fecha,
    SUM(D.LineTotal) AS Ventas_Europa
FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
    ON H.SalesOrderID = D.SalesOrderID
INNER JOIN AdventureWorks2017.Sales.SalesTerritory T
    ON H.TerritoryID = T.TerritoryID
WHERE YEAR(H.OrderDate) BETWEEN 2011 AND 2014
  AND T.[Group] = 'Europe'
GROUP BY CAST(H.OrderDate AS DATE);



SELECT
    CAST(H.OrderDate AS DATE) AS Fecha,
    SUM(D.LineTotal) AS Ventas_Pacifico
FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
    ON H.SalesOrderID = D.SalesOrderID
INNER JOIN AdventureWorks2017.Sales.SalesTerritory T
    ON H.TerritoryID = T.TerritoryID
WHERE YEAR(H.OrderDate) BETWEEN 2011 AND 2014
  AND T.[Group] = 'Pacific'
GROUP BY CAST(H.OrderDate AS DATE)

--FINAL


SELECT
    G.Fecha,
    G.VentasGlobales,
    ISNULL(USA.Ventas_USA, 0) AS Ventas_USA,
    ISNULL(EU.Ventas_Europa, 0) AS Ventas_Europa,
    ISNULL(PA.Ventas_Pacifico, 0) AS Ventas_Pacifico
FROM
(
    SELECT
        CAST(H.OrderDate AS DATE) AS Fecha,
        SUM(D.LineTotal) AS VentasGlobales
    FROM AdventureWorks2017.Sales.SalesOrderHeader H
    INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
        ON H.SalesOrderID = D.SalesOrderID
    WHERE YEAR(H.OrderDate) BETWEEN 2011 AND 2014
    GROUP BY CAST(H.OrderDate AS DATE)
) G
LEFT JOIN
(
    SELECT CAST(H.OrderDate AS DATE) AS Fecha, SUM(D.LineTotal) AS Ventas_USA
    FROM AdventureWorks2017.Sales.SalesOrderHeader H
    INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D ON H.SalesOrderID = D.SalesOrderID
    INNER JOIN AdventureWorks2017.Sales.SalesTerritory T ON H.TerritoryID = T.TerritoryID
    WHERE T.[Group] = 'North America'
    GROUP BY CAST(H.OrderDate AS DATE)
) USA ON G.Fecha = USA.Fecha
LEFT JOIN
(
    SELECT CAST(H.OrderDate AS DATE) AS Fecha, SUM(D.LineTotal) AS Ventas_Europa
    FROM AdventureWorks2017.Sales.SalesOrderHeader H
    INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D ON H.SalesOrderID = D.SalesOrderID
    INNER JOIN AdventureWorks2017.Sales.SalesTerritory T ON H.TerritoryID = T.TerritoryID
    WHERE T.[Group] = 'Europe'
    GROUP BY CAST(H.OrderDate AS DATE)
) EU ON G.Fecha = EU.Fecha
LEFT JOIN
(
    SELECT CAST(H.OrderDate AS DATE) AS Fecha, SUM(D.LineTotal) AS Ventas_Pacifico
    FROM AdventureWorks2017.Sales.SalesOrderHeader H
    INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D ON H.SalesOrderID = D.SalesOrderID
    INNER JOIN AdventureWorks2017.Sales.SalesTerritory T ON H.TerritoryID = T.TerritoryID
    WHERE T.[Group] = 'Pacific'
    GROUP BY CAST(H.OrderDate AS DATE)
) PA ON G.Fecha = PA.Fecha
ORDER BY G.Fecha;



---PARTE II: REGRESIÓN LINEAL


SELECT
    C.CustomerID,

    /* Demográficas (no disponibles en tu BD → NULL) */
    NULL AS Edad,
    NULL AS YearlyIncome,
    NULL AS Education,

    /* Territorio */
    T.CountryRegionCode AS Pais,

    /* Variables de gasto */
    COUNT(DISTINCT H.SalesOrderID) AS NumPedidos,
    SUM(H.TotalDue) AS GastoTotal,
    AVG(H.TotalDue) AS TicketMedio

FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.Customer C
    ON H.CustomerID = C.CustomerID
INNER JOIN AdventureWorks2017.Sales.SalesTerritory T
    ON H.TerritoryID = T.TerritoryID

/* Clientes persona (no tiendas) */
WHERE C.PersonID IS NOT NULL

GROUP BY
    C.CustomerID,
    T.CountryRegionCode;

---PARTE III: REGRESIÓN LOGÍSTICA

SELECT
    H.CustomerID,
    1 AS BikePurchase
FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
    ON H.SalesOrderID = D.SalesOrderID
INNER JOIN AdventureWorks2017.Production.Product P
    ON D.ProductID = P.ProductID
INNER JOIN AdventureWorks2017.Production.ProductSubcategory PS
    ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN AdventureWorks2017.Production.ProductCategory PC
    ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PC.Name = 'Bikes'
GROUP BY H.CustomerID




SELECT
    C.CustomerID,

    /* Demográficas (no disponibles en tu BD → NULL) */
    NULL AS Edad,
    NULL AS YearlyIncome,
    NULL AS Education,

    /* Territorio */
    T.CountryRegionCode AS Pais,

    /* Variables de gasto */
    COUNT(DISTINCT H.SalesOrderID) AS NumPedidos,
    SUM(H.TotalDue) AS GastoTotal,
    AVG(H.TotalDue) AS TicketMedio,

    /* Target */
    ISNULL(BP.BikePurchase, 0) AS BikePurchase

FROM AdventureWorks2017.Sales.SalesOrderHeader H
INNER JOIN AdventureWorks2017.Sales.Customer C
    ON H.CustomerID = C.CustomerID
INNER JOIN AdventureWorks2017.Sales.SalesTerritory T
    ON H.TerritoryID = T.TerritoryID

LEFT JOIN
(
    SELECT
        H.CustomerID,
        1 AS BikePurchase
    FROM AdventureWorks2017.Sales.SalesOrderHeader H
    INNER JOIN AdventureWorks2017.Sales.SalesOrderDetail D
        ON H.SalesOrderID = D.SalesOrderID
    INNER JOIN AdventureWorks2017.Production.Product P
        ON D.ProductID = P.ProductID
    INNER JOIN AdventureWorks2017.Production.ProductSubcategory PS
        ON P.ProductSubcategoryID = PS.ProductSubcategoryID
    INNER JOIN AdventureWorks2017.Production.ProductCategory PC
        ON PS.ProductCategoryID = PC.ProductCategoryID
    WHERE PC.Name = 'Bikes'
    GROUP BY H.CustomerID
) BP
    ON C.CustomerID = BP.CustomerID

/* Clientes persona (no tiendas) */
WHERE C.PersonID IS NOT NULL

GROUP BY
    C.CustomerID,
    T.CountryRegionCode,
    BP.BikePurchase;