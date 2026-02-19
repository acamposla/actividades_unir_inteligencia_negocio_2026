
SELECT * FROM dbo.Pedidos
SELECT * FROM dbo.Clientes
SELECT * FROM dbo.Articulos
SELECT * FROM dbo.Almacenes
SELECT * FROM dbo.Facturas

-- 1. 	Proporcionar los nombres y las fecha de altas de los clientes de tipo empresa 
-- ordenados de forma ascendente.

SELECT Nombre, FechaAlta, Tipo
FROM Clientes
WHERE Tipo = 'Empresa'
-- WHERE CIF IS NOT NULL
--WHERE NIF IS NULL
ORDER BY FechaAlta ASC

--2 .	Proporcionar el CIF y la sede social de las empresas que contengan la denominación «SL» en sus nombres
-- y con fecha de alta entre los años 2005 y 2017.

SELECT CIF, SedeSocial --, Nombre, FechaAlta
FROM Clientes
WHERE Nombre LIKE '%SL%'
	--AND FechaAlta BETWEEN '20050101' AND '20171231'
	--AND FechaAlta >= '20050101' AND FechaAlta <= '20171231'
	AND YEAR(FechaAlta) BETWEEN 2005 AND 2017 

-- 3. 	Proporcionar el código de artículo, subtipo, precio unitario y precio con el impuesto aplicado de 
-- artículos de color verde, gris y negro. 

SELECT IDArticulo AS CodArticulos
      ,Subtipo
	  ,PrecioUnitario
	  ,PrecioUnitario * (1+Impuesto) AS PrecioImpuesto
FROM Articulos
WHERE Color IN ('Verde','Gris','Negro')
--WHERE (Color = 'Verde' OR Color = 'Gris' OR Color = 'Negro')

-- 4. 	Proporcionar el precio medio unitario, precio máximo y precio mínimo 
-- de los artículos del tipo zapatilla.

SELECT AVG(PrecioUnitario) AS PrecioMedio
      ,MAX(PrecioUnitario) AS Maximo
	  ,MIN(PrecioUnitario) AS Minimo
FROM Articulos
WHERE Tipo = 'Zapatilla'


-- 5. 	Proporcionar el número de facturas realizadas por cada cliente,
-- incluso el de aquellos que no han realizado ningún pedido, además de ordenarlos de forma descendente.

SELECT CL.Nombre,
	   COUNT(Factura) AS NumeroFacturas
FROM Facturas AS FAC
RIGHT JOIN Clientes AS CL
	ON FAC.IDCliente = CL.IDCliente
GROUP BY CL.Nombre
ORDER BY COUNT(Factura) DESC

SELECT CL.Nombre,
	   COUNT(Factura) AS NumeroFacturas
FROM  Clientes AS CL 
LEFT JOIN Facturas AS FAC
	ON FAC.IDCliente = CL.IDCliente
	--ON  CL.IDCliente = FAC.IDCliente
GROUP BY CL.Nombre
ORDER BY COUNT(Factura) DESC

-- 6. 	Proporcionar el número de factura, fecha de pedido, nombre de almacén,
-- tipo de cliente y sede social para todos los pedidos cancelados. 

SELECT *
FROM Facturas AS FAC
INNER JOIN  Almacenes AS AL
	ON FAC.IDAlmacen = AL.IDAlmacen
	--ON AL.IDAlmacen = FAC.IDAlmacen 
INNER JOIN Clientes AS CL
	ON Cl.IDCliente = FAC.IDCliente
	--ON FAC.IDCliente = Cl.IDCliente
WHERE FAC.Estado = 'Cancelado' -- esto es lo correcto
-- WHERE FAC.Estado <> 'Enviado' -- ESTO NO ES VALIDO
--WHERE FAC.FechaEntrega IS NOT NULL -- esto bien


-- 7. 	Proporcionar el número de factura, el número de días entre la recepción del pedido y su entrega
--, la ciudad del almacén de procedencia y la sede social del cliente. 
--Se debe tener en cuenta que el estado del envío debe ser «enviado». 

SELECT FAC.Factura
	  ,DATEDIFF(DAY, FAC.FechaPedido, FAC.FechaEntrega) AS Dias
	  ,AL.Ciudad
	  ,CL.SedeSocial
FROM Facturas AS FAC
INNER JOIN  Almacenes AS AL
	ON FAC.IDAlmacen = AL.IDAlmacen
INNER JOIN Clientes AS CL
	ON Cl.IDCliente = FAC.IDCliente
WHERE FAC.Estado = 'Enviado' 

-- 8. 	Proporcionar el montante total (sin impuestos) y la cantidad de artículos vendidos en 2019
-- y agrupados por subtipo de artículo. 

SELECT AR.Subtipo
	   ,SUM(P.Cantidad * AR.PrecioUnitario ) AS MontanteTotal
       ,SUM(P.Cantidad) AS CantidadTotal
FROM Facturas AS FAC
INNER JOIN Pedidos AS P
	ON P.Factura = FAC.Factura
INNER JOIN Articulos AS AR
	ON AR.IDArticulo = P.IDArticulo
WHERE YEAR(FAC.FechaPedido) = 2019 
	and FAC.Estado = 'Enviado' 
GROUP BY AR.Subtipo

-- 9. 	Proporcionar el número de artículos enviados, el montante total y la cantidad agrupados
-- por ciudad del almacén. Se deben ordenar por el montante de forma descendiente 
-- y mostrando únicamente aquellos que han enviado más de doscientos artículos.

SELECT aL.Ciudad
	   ,SUM(P.Cantidad * AR.PrecioUnitario * (1+ar.Impuesto)) AS MontanteTotal
       ,SUM(P.Cantidad) AS CantidadTotal
FROM Facturas AS FAC
INNER JOIN Pedidos AS P
	ON P.Factura = FAC.Factura
INNER JOIN Articulos AS AR
	ON AR.IDArticulo = P.IDArticulo
INNER JOIN Almacenes AS AL
	ON AL.IDAlmacen = FAC.IDAlmacen
WHERE  FAC.Estado = 'Enviado' 
GROUP BY Al.Ciudad
HAVING SUM(P.Cantidad) >= 200
ORDER BY SUM(P.Cantidad) DESC