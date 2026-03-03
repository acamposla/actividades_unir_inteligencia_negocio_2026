

/*
--------
1.1. Obtener una lista d
e factura, 
Fecha de envío, 
fecha de compra, 
total sin impuestos 
y comentarios 

para aquellas facturas con un total 
superior a los 2000 con estado enviado 
o entregado desde el 01/01/2022.
*/


-- Respuesta: 

SELECT fac.IDFactura, 
fac.Fecha_Envio_Estimada, 
fac.Fecha_Compra,
fac.Total_sin_impuestos,
fac.Comentarios 
FROM ExamenUnir.Tienda_Facturas AS fac
WHERE fac.Total_sin_impuestos > 2000 
AND fac.Estado IN ("Enviado", "Entregado")
AND fac.Fecha_Entrega > "2022-01-01"





/*
--------
Entiendo que se se refiere a estado "Enviado" o "Entregado"
Y No cuya fecha de entrega es > "2022-01-01"
En ese caso sería la consulta comentada. 
Mi respuesta es la de arriba (la primera)
*/


-- SELECT fac.IDFactura, 
-- fac.Fecha_Envio_Estimada, 
-- fac.Fecha_Compra,
-- fac.Total_sin_impuestos,
-- fac.Comentarios 
-- FROM ExamenUnir.Tienda_Facturas AS fac
-- WHERE fac.Total_sin_impuestos > 2000 
-- AND fac.Estado = "Enviado"
-- OR fac.Fecha_Entrega > "2022-01-01"




/*
--------
1.2. Obtener el recuento de facturas 
y la media del total sin impuestos 
agrupado por cada dia (fecha de compra) 
para facturas en estado entregado 
y con fecha de compra entre el 
24/12/2021 
y 5/1/2022.
*/



SELECT fac.Fecha_Compra,
COUNT(fac.IDFactura) as recuento, 
AVG(fac.Total_sin_impuestos) as media
FROM ExamenUnir.Tienda_Facturas as fac
WHERE fac.Estado = "Entregado" 
AND fac.Fecha_Compra BETWEEN "2021-12-24" AND "2022-01-05"
GROUP BY fac.Fecha_Compra




/*
--------
1.3. Obtener el promedio del precio 
de compra y el número de artículos agrupados 
por el nombre de la categoría.

*/


SELECT 
cat.Nombre_Categoria, 
AVG(pro.Precio_Compra) as MediaPrecioCompra,
COUNT(pro.IDProducto ) as NumeroArticulos
FROM ExamenUnir.Tienda_Productos as pro
LEFT JOIN ExamenUnir.Tienda_Categoria_Productos as cat
ON pro.IDCategoria = cat.IDCategoria 
GROUP BY cat.Nombre_Categoria 



/*
--------
4.1 Obtener el recuento de empleados, 
el promedio del salario base 
y el promedio de comisiones, 
agrupados por el nombre de la tienda, 
para aquellas tiendas 
que han abierto desde el 01/01/2017.
*/



SELECT 
tie.RazonSocial,
COUNT(emp.IDEmpleado) as N_empleados,
AVG(emp.SalarioBase) as MediaSalarioBase,
AVG(emp.ComisionPorVenta) as MediaComisiones
FROM ExamenUnir.Tienda_Tiendas as tie
	INNER JOIN ExamenUnir.Tienda_Empleados as emp
	ON tie.IDTienda = emp.IDTienda 
	WHERE tie.FechaApertura > "2017-01-01"
	GROUP BY tie.RazonSocial  




	/*
--------
5.1 Obtener el 
listado de factura, 
total sin impuestos, 
estado y 
provincia 

de la tienda 

FILTRO:
para aquellas tiendas que pertenecen 
a la comunidad de Andalucía y Galicia.
*/
	



SELECT tie.IDTienda, 
fac.IDFactura,
fac.Total_sin_impuestos,
fac.Estado,
cli.Provincia 
FROM ExamenUnir.Tienda_Tiendas as tie
LEFT JOIN ExamenUnir.Tienda_Facturas as fac
	ON tie.IDTienda = fac.IDTienda 
LEFT JOIN ExamenUnir.Tienda_Clientes as cli 
	ON fac.IDCliente = cli.IDCliente 
INNER JOIN ExamenUnir.Tienda_Territorio as ter
	ON tie.IDTerritorio = ter.IDTerritorio 
WHERE ter.Comunidad IN ("Andalucia", "Galicia")



