/* ===========================================================
   SIMULACRO DE EXAMEN 02 — Preparación examen SQL
   Base de datos: ExamenUnir (MySQL)
   Fecha: 2026-02-15

   INSTRUCCIONES:
   - Resuelve cada pregunta escribiendo tu query debajo del enunciado.
   - No modifiques la base de datos (solo SELECT).
   - Usa alias de tabla para mayor legibilidad.
   - Tienes 2 horas (como en el examen real).
   =========================================================== */

USE ExamenUnir;

/* -----------------------------------------------------------
   PREGUNTA 1 (1 punto) — Dificultad: BAJA

   El equipo de catálogo ha detectado que algunos productos
   no tienen color registrado. Obtén un listado con el
   Nombre, Precio de Compra y Precio de Venta de todos los
   productos que NO tengan color asignado. Ordénalos por
   Precio de Venta descendente.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Dirección quiere identificar a los grandes clientes.
   Obtén el IDCliente, Denominación, Tipo y Gasto Acumulado
   de todos los clientes cuyo gasto acumulado supere los
   100.000€. Ordénalos por gasto acumulado de mayor a menor.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Logística necesita un informe de las entregas completadas
   durante el año 2022. Muestra el IDFactura, la Fecha de
   Compra, la Fecha de Entrega y la Denominación del cliente.
   Solo incluye facturas con estado "Entregado".
   Ordena por Fecha de Entrega ascendente.
   (Necesitarás combinar dos tablas.)
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   Recursos Humanos quiere un organigrama básico. Para cada
   empleado, muestra su Nombre, Apellidos, y el Nombre y
   Apellidos de su supervisor directo. Ordena por apellidos
   del empleado.
   (Pista: la tabla de empleados tiene una columna que
   referencia a otro empleado de la misma tabla.)
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Comercial necesita saber cuántas unidades se han vendido
   en total de cada categoría de producto. Muestra el nombre
   de la categoría y el total de unidades vendidas. Ordena
   por unidades vendidas de mayor a menor.
   (Necesitarás combinar varias tablas.)
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   La dirección quiere evaluar el rendimiento de cada
   empleado. Para cada empleado que haya gestionado facturas
   NO canceladas, muestra: su Nombre, Apellidos, la Razón
   Social de la tienda donde trabaja, la Comunidad Autónoma
   de esa tienda, y la suma total de ventas (sin impuestos).
   Muestra SOLO los empleados cuyo total de ventas supere
   los 15.000€. Ordena por total de ventas descendente.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El departamento de calidad quiere revisar qué empleados
   NO han gestionado NUNCA una factura que haya acabado
   cancelada. Muestra el IDEmpleado, Nombre y Apellidos
   de dichos empleados.
   (Piensa primero: ¿qué empleados SÍ tienen facturas
   canceladas? Luego excluye a esos.)
   ----------------------------------------------------------- */


