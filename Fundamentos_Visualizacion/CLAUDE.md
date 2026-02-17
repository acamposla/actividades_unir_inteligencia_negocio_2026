# Fundamentos de Visualizacion para el Analisis de Datos

## Objetivo del proyecto

Preparar el examen final de la asignatura con objetivo de sacar un **10**.
El proyecto contiene todo el material de la asignatura y se usa como base para generar **simulacros de examen** realistas.

## Modo de trabajo

**modo-estudio** con foco en **active-recall** y **generador-ejercicios**.
La fase de aprendizaje teorico ya paso: ahora toca **practicar y examinar**.

## Estructura del examen (2 horas, sin apuntes ni internet)

### Parte 1 — Dashboard (7 puntos / 70%)
- Dataset limpio en Excel/CSV (tipo AdventureWorks: ventas por pais, categoria, fecha)
- Crear dashboard de **una sola pagina** en Power BI o Tableau
- Elegir graficos correctos, implementar filtros cruzados
- Justificar decisiones y conclusiones en Word
- Pegar capturas (normal + con filtro aplicado)

### Parte 2 — Critica visual (3 puntos / 30%)
- Imagen de un grafico "malo" (horror visual)
- Identificar errores (manipulacion, Gestalt, carga cognitiva, etica)
- Proponer rediseno justificado

### Estrategia de examen (del profesor Javier Canton)
1. Empezar por Parte 2 (teoria) para asegurar 3 puntos
2. Dedicar el resto al dashboard sin presion
3. No perder tiempo con DAX complejo
4. Bocetar layout en papel antes de abrir Power BI

## Contenido teorico clave (para simulacros)

### Bloque 1: Percepcion visual y cognicion
- Sistema 1 (rapido/intuitivo) vs Sistema 2 (lento/calculo) — Kahneman
- Jerarquia de atributos preatentivos: posicion > angulo > area (Cleveland & McGill)
- Leyes de la Gestalt: proximidad, similitud, cierre, continuidad, figura-fondo
- Ratio datos-tinta (Tufte): maximizar dato, minimizar decoracion
- Atributos preatentivos: color, forma, tamanio, orientacion, movimiento

### Bloque 2: Etica y manipulacion visual
- Eje Y cortado (no empieza en 0) — exagera diferencias
- Graficos 3D innecesarios — distorsion por perspectiva
- Escala no proporcional
- Cherry-picking de datos / falta de contexto
- Lie Factor de Tufte

### Bloque 3: Seleccion de graficos
- Lineas = evolucion temporal
- Barras = comparacion de magnitudes
- Scatter/dispersion = correlacion entre variables
- Mapa = distribucion geografica
- Tarta = composicion (solo si pocas categorias, evitar si posible)
- BAN (Big Aggregated Number) = KPI destacado con contexto (tendencia + meta)

### Bloque 4: Estrategia y BSC (Balanced Scorecard)
- 4 perspectivas: Aprendizaje -> Procesos -> Cliente -> Financiera (cadena causal)
- KPQ (Key Performance Question) antes que KPI
- BANs contextualizados: numero + tendencia + meta
- Alineacion KPI con objetivo estrategico

### Bloque 5: Arquitectura de dashboards
- Mantra de Shneiderman: "Vision general primero, zoom y filtro, detalles bajo demanda"
- Patron de lectura Z/F: lo critico arriba a la izquierda
- Espacio en blanco como separador (Gestalt - proximidad)
- Una sola pantalla, no informe de 20 paginas
- Filtros cruzados para interactividad
- Design Thinking: empatia con el usuario, disenar para la accion

### Bloque 6: Herramientas (Power BI / Tableau)
- Modelo de datos estrella (hecho + dimensiones)
- Filtros, segmentadores, tooltips
- Formateo condicional
- No requiere DAX complejo para el examen

## Material disponible

### Clases (PDFs + Transcripciones)
- `clases/1-*` — Tema 1: Introduccion a la visualizacion
- `clases/2-*` — Tema 1b: Percepcion visual
- `clases/3-*` — Tema 2: Tipos de graficos y seleccion
- `clases/4-*` — Tema 2b: Profundizacion graficos
- `clases/5-*` — Tema 3: BSC, KPIs, Practica EcoBite
- `clases/6-*` — Tema 4: Dashboards y arquitectura
- `clases/7-*` — Tema 5: Herramientas (Power BI/Tableau)
- `clases/8-*` — Sesion pre-examen
- `clases/9-*` — Tema 6: Etica y buenas practicas
- `clases/FundamentosViz-ultimaclase.txt` — Ultima clase (repaso general)
- `clases/Programa-*.pdf` — Programa de la asignatura
- `clases/Sampler_Dashboards+that+Deliver.pdf` — Referencia dashboards

### Apuntes y guia de examen
- `apuntes_resumen.md` — Resumen teorico completo (todos los bloques)
- `examen_visualizacion.md` — Estructura del examen + simulacro ejemplo + consejos del profesor

### Actividades entregadas (referencia practica)
- `Actividades/Actividad1/` — Critica visual + infografia (encarcelamiento). Modelo para Parte 2.
- `Actividades/Actividad2/` — Cuadro de Mando Integral BSC (EcoBite). Estrategia + KPIs.
- `Actividades/Actividad3/` — Dashboard Power BI (AdventureWorks). Modelo para Parte 1.

## Protocolo para generar simulacros

### Simulacro Parte 2 (Critica visual — 3 puntos)
1. Describir un grafico malo con errores especificos (o usar imagen si disponible)
2. Pedir al usuario que identifique los errores citando conceptos teoricos
3. Pedir propuesta de rediseno justificada
4. Evaluar respuesta con rubrica: identificacion de errores (1.5 pts) + propuesta de mejora (1.5 pts)

### Simulacro Parte 1 (Dashboard — 7 puntos)
1. Presentar un escenario de negocio con dataset descrito
2. Pedir al usuario que defina: layout del dashboard, graficos elegidos, filtros, BANs
3. Pedir justificacion de cada eleccion (que concepto teorico aplica)
4. Evaluar con rubrica: seleccion graficos (2 pts) + layout/arquitectura (2 pts) + interactividad (1.5 pts) + justificacion (1.5 pts)

### Rubrica de evaluacion (baremo para 10)
- **Uso correcto de terminologia**: nombrar autores (Tufte, Cleveland, Kahneman, Shneiderman), leyes (Gestalt), conceptos (preatentivo, ratio datos-tinta, lie factor)
- **Justificacion basada en teoria**: no basta decir "queda mejor", hay que decir POR QUE funciona cognitivamente
- **Completitud**: no dejar ningun error sin identificar, no dejar ninguna eleccion sin justificar
- **Precision**: distinguir entre problemas distintos (no mezclar "etica" con "percepcion")

## Formato de respuesta del usuario en simulacros

El usuario debe responder como si escribiera en el Word del examen:
- Parrafos estructurados con argumentacion
- Citar conceptos teoricos por nombre
- Ser conciso pero completo (el examen tiene limite de tiempo)

## Profesor

Javier Canton. Enfoque practico. Valora la justificacion teorica de las decisiones.
