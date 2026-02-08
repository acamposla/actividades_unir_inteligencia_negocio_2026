/* 
PARTE I: SERIES TEMPORALES
Obtener las series temporales de las ventas globales de la empresa para el periodo comprendido entre 2011 y 2014. 
Debemos identificar donde se almacenan los datos 
y crear una consulta para agrupar los valores de las ventas por periodo temporal 
(días, semanas, meses, etc…). Las tablas necesarias son:

•	SalesOrderDetail: los detalles de las transacciones de una factura.
•	SalesOrderHeader: las facturas y su información relevante.

1.	Primera consulta:
Debemos combinar ambas tablas a través del 
SalesOrderID, establecer la función de agregación (Sumatorio) en SELECT y utilizar GROUP BY 
para especificar el modo de agrupar. Para su óptima visualización, lo ideal es ordenar los registros por fecha.
*/



SELECT
SH.OrderDate, 
SUM(so.LineTotal) as Sales
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID 
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC


/*
 2. Adicionalmente, nos solicitan obtener las ventas por región (EEUU, Europa y Pacifico), 
 incluyendo, un dataset final que contenga las mencionadas variables. Siendo 3 consultas en totaL OJO CTE!!!!!!
 */



SELECT
SH.OrderDate, 
SUM(so.LineTotal) as Sales
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID 

GROUP BY SH.OrderDate
ORDER BY OrderDate DESC





SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_USA
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "North America"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC



SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_EU
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "Europe"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC

SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_Pac
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "Pacific"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC



/*
3. Para poder combinar las consultas anteriores debemos utilizar 
la primera como consulta base y las otras 3 como subconsultas. 
Para ello debemos identificar la clave que nos permite combinarlas (Pista: Inteligencia Temporal). 
Debemos elegir adecuadamente entre INNER JOIN y LEFT JOIN teniendo en cuanta que pueden existir días 
con ventas en ciertas regiones y en otras no

   WITH                                                                                                                                            
      cte1 AS (...),                                                                                                                              
      cte2 AS (...),                                                                                                                              
      cte3 AS (...)                                                                                                                               
  SELECT ... FROM cte1 JOIN cte2 ...   
 
 *  */






-- Crear Primera
WITH TOTAL_SALES AS(
SELECT
SH.OrderDate, 
SUM(so.LineTotal) as Sales
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID 
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC), 
-- Crear segunda
SALES_NA AS (
SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_USA
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "North America"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC
),
--  Crear tercera
SALES_EUROPE AS(
SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_EU
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "Europe"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC),
--  Crear cuarta
SALES_PAC AS(
SELECT 
SH.OrderDate, 
SUM(so.LineTotal) as Sales_Pac
FROM  adventureworks.salesorderheader AS SH
INNER JOIN adventureworks.salesorderdetail as SO
ON SH.SalesOrderID  = SO.SalesOrderID
LEFT JOIN adventureworks.salesterritory as ST
ON SH.TerritoryID = ST.TerritoryID 
WHERE ST.GROUP =  "Pacific"
GROUP BY SH.OrderDate
ORDER BY OrderDate DESC)


-- ahora las juntamos todo

SELECT TOTAL_SALES.*,
SALES_NA.Sales_USA,
SALES_EUROPE.Sales_EU,
SALES_PAC.Sales_Pac
FROM TOTAL_SALES
LEFT JOIN SALES_NA ON TOTAL_SALES.OrderDate = SALES_NA.OrderDate
LEFT JOIN SALES_EUROPE ON TOTAL_SALES.OrderDate = SALES_EUROPE.OrderDate
LEFT JOIN SALES_PAC ON TOTAL_SALES.OrderDate = SALES_PAC.OrderDate

/* 
PARTE II: DATASET DE CLIENTES PARA REGRESION LINEAL
Obtener el gasto acumulado de todos los clientes (personas y no tiendas) 
y sus diferentes variables demográficas (edad, país, ingresos, educación, etc…). 
Las tablas que necesitamos son:
	

- SalesOrderHeader: donde podemos obtener los pedidos de los clientes y su montante total. 
Así mismo tenemos la clave ajena de CostumerID para poder combinar otras tablas.
*/


SELECT SO.SalesOrderID,
SO.CustomerID, 
SO.TotalDue 
FROM adventureworks.salesorderheader as SO 



/*
•	Person: debemos 
combinar esta tabla para filtrar los clientes individuos (PersonType = IN). 
La clave primaria de la última tabla es BusinessEntityID 
la cual engloba a cualquier persona física; combinándola con la clave PersonID de la tabla de SalesOrderHeader.
*/

SELECT SO.SalesOrderID,
SO.CustomerID, 
SO.TotalDue,
CU.CustomerType 
FROM adventureworks.salesorderheader as SO 
LEFT JOIN  adventureworks.customer as CU ON SO.CustomerID  = CU.CustomerID 
WHERE CU.CustomerType = 'I'



/*
SalesTerritory: mediante la clave TerritoryID podemos ver donde compra cada cliente.
•	vPersonDemographics: contiene toda la información demográfica de los individuos. La clave primaria de la última tabla es BusinessEntityID la cual engloba a cualquier persona física; combinándola con la clave PersonID de la tabla de Person. 
•	La función DATEDIFF en SQL Server o TIMESTAMPDIFF en MySQL permite calcular las diferencias entre fechas. Os sugiero echarle un vistazo en la página de Microsoft o Oracle. 
*/



