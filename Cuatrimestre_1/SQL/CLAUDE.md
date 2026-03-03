# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Proyecto

Repositorio de actividades SQL de la asignatura **"Fundamentos Tecnológicos para el Tratamiento y Análisis de Datos"** del Máster BI en UNIR.
Equipo: Grupo 3, Equipo 3.

## Objetivo actual: Preparación examen (viernes 20/02/2026)

El foco del proyecto es **preparar el examen práctico de SQL**. Claude actúa como generador de simulacros de examen y tutor de corrección.

### Estructura y Formato del Examen

- **100% práctico** en MySQL, 2 horas
- **7 consultas SQL**: 5 fáciles/medias (1 pto c/u) + 2 difíciles (2.5 pts c/u)
- Solo **DQL**: SELECT, FROM, WHERE, ORDER BY, AND, OR, IN, BETWEEN, LIKE, NULL, INNER JOIN, LEFT JOIN, GROUP BY, HAVING, COUNT, SUM, AVG, subconsultas
- **NO entra**: INSERT, UPDATE, DELETE, CREATE TABLE, DROP TABLE
- **Requisito obligatorio**: demostrar dominio de JOINs (sin JOINs = suspenso aunque sumes 5 puntos)
- Las preguntas son de negocio ("¿qué clientes compraron X en fecha Y?") que hay que traducir a SQL

### Conexión a la BBDD de examen

- **Host**: 127.0.0.1:3306
- **Usuario**: root
- **Password**: 14001400
- **Base de datos**: ExamenUnir
- **Comando**: `mysql -h 127.0.0.1 -P 3306 -u root -p'14001400' ExamenUnir`

### Workflow de preparación

1. Claude genera un simulacro (7 preguntas de negocio, sin SQL)
2. El alumno escribe las queries en un .sql en `EJERCICIOS/`
3. Claude corrige ejecutando contra la BBDD real, comparando resultados
4. Se identifican patrones débiles y se refuerzan

## Modo por defecto

**modo-estudio**. Este es un proyecto académico de aprendizaje de SQL.

## Estructura

- `ACTIVIDADES/` — Entregas por actividad (scripts SQL + enunciados .docx)
  - **Actividad 2**: Queries SQL (SELECT, JOIN, GROUP BY, subqueries) — referencia directa del nivel de examen
- `BASES_DATOS_EXAMEN/` — Script de creación de la BBDD Tienda (esquema retail)
- `EJERCICIOS/` — Simulacros de examen resueltos (.sql), organizados por sesión
  - **simulacro_01.sql**: ✅ Completado con correcciones (P4, P5, P7)
  - **simulacro_02.sql**: ✅ Completado con correcciones (P3, P4, P6, P7)
  - **simulacro_03.sql**: ✅ Completado con correcciones incluidas en el archivo
  - **simulacro_04.sql**: ✅ Completado con correcciones (P2, P4, P7)
  - **simulacro_05.sql**: ✅ Especial NOT IN — P1 y P2 resueltas con errores de detalle corregidos. Resto no necesario.
  - **simulacro_06.sql**: ✅ Completado con correcciones (P1, P2, P4, P7)
- `TRANSCRIPCIONES/` — Transcripciones de clases magistrales (referencia)
- `CONTEXTO_CONVERSACION.md` — Estado volátil de la sesión actual

## Esquema ExamenUnir (Tienda retail)

### Relaciones entre tablas
```
Tienda_Territorio (IDTerritorio PK)
    └── Tienda_Tiendas (IDTienda PK, IDTerritorio FK)
            ├── Tienda_Empleados (IDEmpleado PK, IDTienda FK, SupervisorIDEmpleado FK self-ref)
            └── Tienda_Facturas (IDFactura PK, IDCliente FK, IDTienda FK, IDEmpleado FK)
                    └── Tienda_Detalles_Facturas (IDTransaccion PK, IDFactura FK, IDProducto FK)
Tienda_Clientes (IDCliente PK)
    └── Tienda_Facturas
Tienda_Categoria_Productos (IDCategoria PK)
    └── Tienda_Productos (IDProducto PK, IDCategoria FK)
            └── Tienda_Detalles_Facturas
```

### Datos clave para generar ejercicios
- **Clientes**: 18 (Tipo: Particular/Empresa)
- **Territorios**: 13 (10 comunidades: Madrid, Cataluña, Pais Vasco, Andalucia, Extremadura, Region de Murcia, Castilla y Leon, Navarra, Galicia, Asturias)
- **Tiendas**: 13
- **Categorías**: 6 (Ropa, Equipamiento Tecnico, Bicicletas, Suplementos Alimenticios, Merchandising, NULL)
- **Productos**: 29 (Colores: Negro, Gris, Azul, Verde, Rojo, NULL; Intervalo_Precio: Alto, Medio, Bajo)
- **Empleados**: 20 (Jornada: Completa/Media Jornada; tienen SupervisorIDEmpleado)
- **Facturas**: 63 (Estado: Enviado, Entregado, Cancelado)
- **Detalles**: 98 transacciones

## Gaps de aprendizaje detectados

### Errores SUPERADOS (ya no ocurren):
1. **Columnas agregables en GROUP BY**: Ocurrió 3 veces en sim1-2, no ha vuelto desde simulacro 3. Superado.
2. **NOT IN vs WHERE <>**: Confundir "excluir filas" con "NUNCA hizo X". En simulacro 6 P6 se resolvió correctamente. Patrón NOT IN dominado.
3. **Self-join dirección del ON**: Resuelto desde simulacro 2, en simulacro 6 P6 se hizo perfecto.

### Errores que PERSISTEN (alta prioridad — revisar antes del examen):
1. **Olvidar filtros WHERE del enunciado**: El alumno se salta condiciones explícitas (jornada completa, comision > 0.02, etc.). Ocurrió en sim1-P4, sim4-P2, sim6-P4. Es el error más recurrente.
2. **Faltar columnas en el SELECT**: El enunciado pide N columnas y el alumno omite alguna. Ocurrió en sim3-P5, sim6-P1.
3. **ORDER BY ASC vs DESC**: Poner DESC cuando pide ASC o viceversa. Ocurrió en sim2-P6, sim6-P2.
4. **Columnas cruzadas en ON de JOINs**: Usar la columna equivocada en la condición JOIN (ej: `pro.IDProducto = cat.IDCategoria` en vez de `pro.IDCategoria = cat.IDCategoria`). Ocurrió en sim6-P7.
5. **Valores de texto exactos**: Escribir 'Cancelada' en vez de 'Cancelado', o usar la columna equivocada (Precio_Compra en vez de Intervalo_Precio). Ocurrió en sim2-P7, sim5-P1, sim5-P2.

### Recomendacion para el examen:
- Antes de escribir cualquier query: leer el enunciado 2 veces y subrayar mentalmente TODAS las condiciones y columnas pedidas.
- Antes de escribir un ON: preguntarse "¿qué columna de esta tabla es FK de la otra?"
- Antes de ORDER BY: releer si pide ascendente o descendente.
- Hacer un `SELECT DISTINCT` rápido para verificar valores exactos de los campos de texto si hay duda.

## Convenciones

- Los scripts SQL usan comentarios `/* */` y `--` para separar ejercicios numerados
- Nombres de tablas con prefijo Tienda_
- Alias de tablas cortos (cli, ter, tie, cat, pro, emp, fac, det)
- Ficheros de ejercicios: `simulacro_XX.sql`
- **Importante**: Los enunciados NO incluyen pistas entre paréntesis (simular examen real)
