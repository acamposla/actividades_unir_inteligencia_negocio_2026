# Simulacro 01 — Examen Fundamentos de Visualizacion

**Duracion**: 2 horas
**Material permitido**: Excel, Power BI Desktop, Tableau, Word
**Sin apuntes ni internet**

---

## PARTE 2 — Analisis Critico (3 puntos)

> **Estrategia**: Empieza por aqui para asegurar los 3 puntos con la teoria fresca.

### Enunciado

La directora de marketing de una cadena de supermercados presenta el siguiente grafico en la reunion trimestral de resultados. Tu jefe, el director de datos, te pide que analices esta visualizacion antes de que se presente al consejo de administracion.

**Descripcion del grafico:**

Se trata de un **grafico de tarta 3D** con las cuotas de mercado de 8 marcas de yogur en Espana. Las caracteristicas son:

- **Tipo**: Grafico de sectores (tarta) con efecto 3D y perspectiva inclinada
- **Categorias** (8 marcas): Danone (34%), Hacendado (22%), Nestlé (12%), Pascual (8%), Kaiku (6%), Oikos (5%), La Fageda (4%), Otros (9%)
- **Colores**: 8 colores muy similares entre si (distintos tonos de azul y verde)
- **El sector de Danone** esta posicionado en la parte frontal de la tarta 3D, haciendolo parecer aun mas grande
- **No hay eje Y** ni cifras sobre los sectores — solo una leyenda lateral con los nombres
- **Titulo**: "Danone lidera con fuerza el mercado de yogures"
- **No se indica** la fuente de datos, el periodo temporal ni el tamano de la muestra
- **La suma de los porcentajes es 100%**

### Preguntas

**A) (1.5 puntos)** Identifica y explica todos los errores de visualizacion que presenta este grafico. Cita los conceptos teoricos que aplican en cada caso.

En reglas generales, no se debería usar un gráfico de tarta y menos en 3D. En este caso, 8 categorías son demasiadas para representar en un gráfico de tartas, dado que visualmente es muy complicado comparar la diferencia entre una representación del 8% contra la de un 6%. Generalmente para comparar magnitudes utilizaremos un gráfico de barras (tal y como descubrieron Cleveland y McGil). El color es un elemento muy importanto dado que es uno de los inputs fundamentales para nuestro sistema 1 (Khaneman). Es un input pre-atentivo. Al utilizar colores similares entre si la codificación según Gestalt se hace muy dificil: el color crea una masa uniforme que no permite comparación en el caso en que sea similar. 
El Sector Danone, al aparecer más grande, esta sesgando la narrativa mediante "cherry-picking". 
El título es sensacionalista y no descriptivo: El título no explica de qué trata el gráfico.
No indicar la fuente de datos: esto es un error. Al no conocer el alcance temporal ni el tamaño de la muestra, el dato podría estar sesgado, o la audiencia podría extraer conclusiones erroneas. 



**B) (1.5 puntos)** Propone un rediseno del grafico que corrija los errores identificados. Justifica cada decision de diseno basandote en la teoria de la asignatura.



- Utilización de un gráfico de barras para comparar magnitudes:
- Eje de las X muestran la leyenda de las marcas en un tamaño igual
- Eje de las Y muestra la escala del 0% a 100%
- Titulo descriptivo: "Market Share Periodo 24-25 - Industria de los lácteos"
- Utilización de barras comparativas de un año contra otra que describan el cambio de tendencia. 
- Leyenda del cambio de tendencia encima de cada par de barras (ejemplo +5% en Danone, -3% Hacendado)




---

### Rubrica de evaluacion Parte 2

**A) Identificacion de errores (1.5 pts)**

| Error | Concepto teorico | Puntos |
|-------|-----------------|--------|
| Grafico de tarta con 8 categorias (>6) | Precision perceptiva: el angulo es impreciso (Cleveland & McGill) | 0.20 |
| Efecto 3D que distorsiona proporciones | Distorsion por perspectiva, carga cognitiva innecesaria | 0.20 |
| Danone en primer plano (parece mas grande de lo que es) | Manipulacion visual, sesgo de perspectiva | 0.20 |
| 8 colores similares (azules/verdes) no distinguibles | Atributos preatentivos mal usados: el color no discrimina | 0.15 |
| Sin cifras sobre los sectores (solo leyenda lateral) | Obliga al Sistema 2: hay que ir y venir entre leyenda y grafico | 0.15 |
| Titulo sesgado ("lidera con fuerza") | Falta de neutralidad; el titulo debe describir, no persuadir | 0.15 |
| Sin fuente de datos, periodo ni muestra | Falta de contexto y transparencia (etica de datos) | 0.15 |
| Ratio datos-tinta bajo: decoracion 3D no aporta dato | Principio de Tufte: maximizar dato, minimizar decoracion | 0.15 |
| Violacion del orden convencional (mayor a menor en sentido horario) no verificable por el 3D | Convencion rota + carga cognitiva | 0.15 |

**B) Propuesta de rediseno (1.5 pts)**

| Elemento del rediseno | Justificacion esperada | Puntos |
|-----------------------|----------------------|--------|
| Cambiar a barras horizontales ordenadas de mayor a menor | Posicion sobre escala comun = maxima precision (Cleveland & McGill) | 0.30 |
| Eliminar 3D, usar grafico 2D plano | Ratio datos-tinta (Tufte), eliminar distorsion | 0.20 |
| Etiquetas de datos directas sobre las barras | Evitar ida y vuelta a leyenda, activar Sistema 1 (Kahneman) | 0.20 |
| Paleta de colores diferenciada o un solo color con intensidad | Atributos preatentivos: usar color de forma util o neutra | 0.20 |
| Titulo descriptivo y neutro | Ej: "Cuota de mercado de yogures en Espana (T3 2025)" | 0.20 |
| Incluir fuente, periodo y tamano de muestra | Transparencia, contexto, etica visual | 0.20 |
| Agrupar marcas pequenas en "Otros" si se quiere simplificar | Reducir carga cognitiva | 0.20 |

---

## PARTE 1 — Caso Practico: Dashboard (7 puntos)

> **Estrategia**: Boceta el layout en papel (2 min) antes de abrir Power BI.

### Enunciado

Eres el analista de datos de **FreshMarket**, una cadena de supermercados con presencia en 5 paises europeos (Espana, Francia, Alemania, Italia y Portugal). El director general te pide crear un **dashboard de una sola pagina** para la reunion mensual del comite de direccion.

**Dataset disponible** (archivo Excel con una sola hoja, datos limpios):

| Campo | Tipo | Ejemplo |
|-------|------|---------|
| OrderID | Texto | ORD-2025-001 |
| OrderDate | Fecha | 15/03/2025 |
| Country | Texto | Espana, Francia, Alemania, Italia, Portugal |
| Region | Texto | Norte, Sur, Este, Oeste, Centro |
| Category | Texto | Frescos, Bebidas, Limpieza, Snacks, Lacteos |
| Product | Texto | Leche entera, Cerveza artesana, ... |
| Quantity | Entero | 150 |
| UnitPrice | Decimal | 2.50 |
| TotalSales | Decimal | 375.00 |
| Cost | Decimal | 250.00 |
| CustomerSegment | Texto | Premium, Standard, Basico |

**Periodo**: Enero 2024 - Diciembre 2025 (24 meses)

**Objetivos del comite de direccion** (lo que quieren responder):
1. Como han evolucionado las ventas totales mes a mes? Hay estacionalidad?
2. Que pais y que categoria generan mas ingresos?
3. Cual es el margen de beneficio y como se distribuye por categoria?
4. Como se distribuyen las ventas geograficamente?
5. Que segmento de cliente es mas rentable?

### Tareas

**A) (2 puntos)** Define el layout de tu dashboard: que graficos elegiras, donde los colocaras y por que. Justifica cada eleccion con conceptos teoricos.

- Evolución de ventas: gráfico de líneas
- País y cateogría con más infresos: Tarjeta
- Margen de beneficio y como se distribuye por categoría: Scatterplot de beneficio y categoría?
- Ventas geográficas: mapa cloroplético
- Segmento más rentable: tabla con segmentos y márgenes o tarta?

**B) (2 puntos)** Describe la arquitectura de tu dashboard: que BANs incluiras, que jerarquias crearas, como organizaras la informacion siguiendo el mantra de Shneiderman.



**C) (1.5 puntos)** Explica que filtros e interactividad implementaras. Como demostaran los filtros cruzados que tu dashboard permite exploracion?

**D) (1.5 puntos)** Escribe las conclusiones que esperarias obtener del dashboard (basandote en datos inventados razonables) y como guiarian la toma de decisiones del comite.

---

### Rubrica de evaluacion Parte 1

**A) Seleccion de graficos y layout (2 pts)**

| Criterio | Puntos |
|----------|--------|
| Grafico de lineas para evolucion temporal de ventas (P1) | 0.30 |
| Grafico de barras para comparar paises y/o categorias (P2) | 0.30 |
| Mapa de burbujas o coropletas para distribucion geografica (P4) | 0.25 |
| BANs para KPIs clave (ventas totales, margen, etc.) | 0.25 |
| Disposicion coherente con patron Z/F (critico arriba-izquierda) | 0.30 |
| Justificacion teorica de CADA eleccion (Cleveland & McGill, Gestalt, Kahneman) | 0.60 |

**B) Arquitectura del dashboard (2 pts)**

| Criterio | Puntos |
|----------|--------|
| BANs contextualizados (numero + tendencia + meta) | 0.40 |
| Aplicacion explicita del Mantra de Shneiderman (3 niveles) | 0.40 |
| Jerarquias definidas (geografica: Pais>Region; temporal: Ano>Mes; producto: Categoria>Producto) | 0.40 |
| Uso del espacio en blanco como separador (Gestalt: proximidad) | 0.30 |
| Tabla de detalle con formato condicional | 0.25 |
| Titulo claro y descriptivo | 0.25 |

**C) Interactividad y filtros (1.5 pts)**

| Criterio | Puntos |
|----------|--------|
| Segmentadores por fecha (ano/mes) y por pais/categoria | 0.30 |
| Filtros cruzados entre graficos (explicar que pasa al clicar) | 0.40 |
| Drill-down usando jerarquias (de pais a region, de categoria a producto) | 0.30 |
| Tooltips con informacion adicional | 0.20 |
| Demostracion con capturas (normal + filtro aplicado) | 0.30 |

**D) Conclusiones y toma de decisiones (1.5 pts)**

| Criterio | Puntos |
|----------|--------|
| Conclusiones basadas en datos (no opiniones vagas) | 0.40 |
| Identificar patrones (estacionalidad, categoria lider, pais debil) | 0.40 |
| Propuestas de accion concretas para el comite | 0.35 |
| Vinculacion de las conclusiones con los KPIs mostrados | 0.35 |

---

## Instrucciones para la auto-evaluacion

Cuando termines tu respuesta, compartela conmigo para que la evalue con esta rubrica. Deberas:

1. **Parte 2**: Escribir tu analisis critico como si lo redactaras en el Word del examen. Parrafos estructurados, citar conceptos por nombre, ser conciso pero completo.

2. **Parte 1**: Puedes hacer el dashboard en Power BI con el dataset que inventes, O puedes describir tu diseno en texto (layout, graficos, justificaciones). Para un 10, construye el dashboard real + justificacion en Word.

**Nota**: Este simulacro NO incluye dataset real. Si quieres practicar con Power BI, usa el `AdventureWorks.xlsx` de la Actividad 3 adaptando las preguntas.
