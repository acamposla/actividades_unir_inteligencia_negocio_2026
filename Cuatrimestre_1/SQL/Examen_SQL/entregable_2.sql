

	/*
--------
2.1.
1. Se necesita obtener 
la suma de las ventas (total sin impuestos) y 
la suma de cantidad de artículos 
agrupado 
por tipo de cliente y provincia del cliente 
con fecha de compra desde el 1/1/2022 
y que el estado de factura sea distinto de cancelado.
*/


SELECT 
	cli.Tipo,
	cli.Provincia,
	SUM(fac.Total_sin_impuestos) as VentasTotales,
	COUNT(det.IDProducto) as CantidadArticulos
FROM ExamenUnir.Tienda_Clientes as cli
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
	ON cli.IDCliente = fac.IDCliente 
LEFT JOIN ExamenUnir.Tienda_Detalles_Facturas as det
	ON fac.IDFactura = det.IDFactura 
WHERE fac.Fecha_Compra > "2022-01-01"
AND fac.Estado <> "Cancelado"
	GROUP BY cli.Tipo, cli.Provincia 

	


		/*
--------
2.2.
 Se necesita obtener 
 la suma de ventas totales 
 (total sin impuestos) 
 y media de productos por factura 
 agrupado por nombre y apellido del empleado,
  para aquellos empleados cuyo sumatorio de ventas
   totales sea superior a 1000, ordenado de mayor 
   a menor en función del sumatorio de ventas totales
*/

	

SELECT 
	emp.Nombre, 
	emp.Apellidos, 
	SUM(fac.Total_sin_impuestos) as SumaVentas,
	AVG(det.Cantidad) as MediaProductosPorFactura
	FROM ExamenUnir.Tienda_Empleados as emp
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
	ON emp.IDEmpleado = fac.IDEmpleado 
INNER JOIN ExamenUnir.Tienda_Detalles_Facturas as det
	ON fac.IDFactura = det.IDFactura 
GROUP BY emp.Nombre, emp.Apellidos 
HAVING SumaVentas > 1000
ORDER BY SumaVentas DESC;



