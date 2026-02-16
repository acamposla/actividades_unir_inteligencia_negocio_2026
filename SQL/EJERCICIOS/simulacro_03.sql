/* ===========================================================
   SIMULACRO DE EXAMEN 03 — Preparación examen SQL
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

   El departamento financiero necesita conocer el margen
   bruto de cada producto. Muestra el Nombre del producto,
   su Precio de Compra, su Precio de Venta y una columna
   calculada llamada "Margen" que sea la diferencia entre
   el Precio de Venta y el Precio de Compra. Ordena por
   margen de mayor a menor.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 2 (1 punto) — Dificultad: BAJA

   Comercial quiere contactar con todos los clientes de tipo
   "Empresa" que se dieron de alta entre el año 2003 y el
   año 2005 (ambos incluidos). Muestra su IDCliente,
   Denominación, Fecha de Alta y Provincia.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 3 (1 punto) — Dificultad: BAJA-MEDIA

   Logística necesita localizar todas las facturas que
   tienen fecha de entrega registrada pero cuyo estado NO
   es "Entregado". Muestra IDFactura, Estado, Fecha de
   Entrega y Comentarios.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 4 (1 punto) — Dificultad: MEDIA

   Dirección quiere saber cuántas facturas ha gestionado
   cada empleado. Muestra el Nombre y Apellidos del empleado
   y el número total de facturas que ha gestionado. Incluye
   solo empleados con más de 3 facturas. Ordena por número
   de facturas de mayor a menor.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 5 (1 punto) — Dificultad: MEDIA

   Se necesita un listado de todas las tiendas junto con la
   ciudad y comunidad autónoma donde se ubican. Para cada
   tienda, muestra también el número de empleados que
   trabajan en ella. Ordena por número de empleados
   descendente.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 6 (2.5 puntos) — Dificultad: ALTA

   Se quiere conocer el ticket medio (importe medio por
   factura, sin impuestos) de cada tienda, pero solo para
   facturas no canceladas. Muestra la Razón Social de la
   tienda, la Ciudad donde está ubicada y el ticket medio
   redondeado a 2 decimales. Muestra solo tiendas con un
   ticket medio superior a 5.000€. Ordena por ticket medio
   descendente.
   ----------------------------------------------------------- */



/* -----------------------------------------------------------
   PREGUNTA 7 (2.5 puntos) — Dificultad: ALTA

   El departamento comercial quiere identificar a los
   clientes que NUNCA han comprado en una tienda ubicada
   en Andalucía. Muestra el IDCliente y la Denominación
   de esos clientes.
   ----------------------------------------------------------- */


