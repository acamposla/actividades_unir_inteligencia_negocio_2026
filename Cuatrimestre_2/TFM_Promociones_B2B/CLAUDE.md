# Proyecto: TFM Inteligencia de Negocio (UNIR)

## Tema
Segmentación de clientes B2B y optimización de promociones comerciales en distribución FMCG.
**Caso real: marca Garza** (iluminación, conectividad e IoT), distribuida por Imprex. Todas las categorías incluidas.

## Equipo
- **Alejandro Campos** y **Leticia** (trabajo grupal)
- **Director TFM:** Eduardo (4 sesiones obligatorias vía Zoom)
- Enrique Hortalá González: charla general de pautas (no es nuestro tutor).

## Naturaleza del Proyecto

Este TFM no simula un caso: ES el caso real de Imprex. Los datos son reales, los segmentos son reales, las promociones se ejecutarán de verdad. El formato académico es el envoltorio.

Sirve simultáneamente como:
1. **Trabajo académico** evaluable por tribunal UNIR.
2. **Proyecto operativo** de segmentación real para Imprex (se presentará a dirección de Imprex como proyecto interno).
3. **Caso de éxito** documentado para la consultora "Vértice".

**Test de realidad**: si el resultado del TFM no es lo suficientemente bueno como para presentarlo al CEO de Imprex y que lo apruebe como proyecto real, entonces no es lo suficientemente bueno para el tribunal.

> **Nota:** `~/Proyectos/IMPREX/analitica-comercial/` fue el diseño previo de este sistema. Los frameworks metodológicos se han traído a este repo (`docs/metodologia/`). A partir de ahora, todo el trabajo se hace aquí.

## Fechas Clave
| Entrega | Fecha oficial | Fecha tutor | Contenido |
|---------|--------------|-------------|-----------|
| Entrega 1 | 18 marzo | **15 marzo (domingo)** | 5-8 hojas: problema, datos, objetivo, enfoque |
| Entrega 2 | 29 abril | - | Avance acumulativo con correcciones E1 |
| Entrega 3 | 10 junio | - | Avance acumulativo con correcciones E2 |
| Predepósito | 30 junio | - | Documento completo 100% (PDF) |
| Defensa oral | Post-depósito | - | 30 min (grupal) con presentación visual |

## Problema de Negocio

Imprex diseña promociones por RAMO (canal SAP) con descuento uniforme, sin segmentación ni evaluación de rentabilidad. Decisiones tipo HIPPO: "7% de descuento para todas las ferreterías".

**Objetivo**: Pasar de promociones genéricas a acciones segmentadas con rentabilidad calculada (BEP).

## Metodología (del Cuatrimestre 1 a la práctica real)

El TFM aplica conocimiento adquirido en asignaturas del Máster BI:
- **Estrategia y Gestión Empresarial** (C1) → BEP, customer centricity, KPIs SMART, ciclo intelligence-action
- **Análisis de Datos con R** (C1) → fundamentos conceptuales de EDA, clustering, regresión (referencia, no implementación)
- **Machine Learning con Python** (C2, en curso) → implementación real en Python con scikit-learn, pandas

**Decisión firme de stack: Python** (no R). Razones: es lo que se aprende en C2, mayor valor para Imprex a largo plazo, al tribunal le es indiferente el lenguaje. Los frameworks en `docs/metodologia/` tienen snippets en R como referencia histórica; la implementación real es íntegramente Python.

### Ciclo Intelligence-Action
```
1. Extracción de datos (SAP → Oracle/REPORTING)
2. EDA + limpieza en Python (pandas)
3. Segmentación K-Means (selección óptima de k con elbow + silhouette)
4. Perfilado de segmentos (descriptivo + árboles de decisión)
5. Diseño de oferta por segmento (BEP + matrices de escenarios)
6. Ejecución de campaña piloto real
7. Medición de resultados (KPIs SMART, ROI real vs esperado)
```

### Variables de Segmentación B2B
| Variable | Para qué sirve | Fuente SAP |
|----------|----------------|------------|
| Volumen anual (€) | Tamaño del cliente | Facturación acumulada |
| Frecuencia de pedido | Engagement | Nº pedidos / periodo |
| Nº categorías que compra | Profundidad de relación | Líneas distintas |
| Ticket medio por pedido | Perfil de compra | Valor medio pedido |
| Tendencia (crece/decrece) | Riesgo de fuga | Comparar periodos |
| Margen que deja | Rentabilidad real | Coste vs precio |

### Stack Técnico
| Capa | Herramienta | Uso |
|------|-------------|-----|
| Datos | Oracle (esquema REPORTING, réplica SAP) | Fuente de verdad |
| ETL | Python (oracledb, pandas) + SQL | Extracción y limpieza |
| Análisis | Python (pandas, scikit-learn, scipy) | EDA, modelos, clustering |
| BEP / Escenarios | Python (numpy, pandas) | Matrices de escenarios, simulación |
| Visualización | matplotlib / seaborn / PowerBI | Dashboards y gráficos |
| Documentación | Quarto + Word (plantilla UNIR) | TFM + docs internas |

## Fases del Proyecto
- [x] **Fase 0**: Definir alcance y datos necesarios → petición enviada a IT (KNA1, KNVV, KNVH, VBRK, VBRP)
- [ ] **Fase 1**: Extraer datos SAP (clientes, pedidos, facturación últimos 12-24 meses) para marca Garza
- [ ] **Fase 2**: EDA en Python — distribuciones, correlaciones, anomalías, calidad de datos
- [ ] **Fase 3**: Segmentación K-Means (scikit-learn) — perfilar segmentos con árboles de decisión
- [ ] **Fase 4**: BEP por segmento — matrices de escenarios (r × g)
- [ ] **Fase 5**: Diseñar y ejecutar promoción piloto real en Imprex
- [ ] **Fase 6**: Medir resultados, documentar como caso de éxito

## Datos SAP / Oracle — Tablas Identificadas

Conexión Oracle funciona: host `172.16.62.24`, esquema REPORTING, user `reporting`.

**Estrategia ETL (decidida en sesión 2026-03-20):**

| Capa | Tabla / Vista | Rol en ETL | Estado |
|------|--------------|------------|--------|
| Maestro productos Garza | `SALESLAYER_PRODUCTOS_GARZA` | Base del maestro (455 productos, ya enriquecida desde PIM) — preferir sobre reconstruir desde DIM_MARA | Disponible |
| Costes y tarifa | `MV_GOLDEN_TABLE_COMPLETA` | JOIN puntual para `COSTE_UNITARIO` y `TARIFA_BASE_EUR` → calcular margen | Disponible |
| Transacciones | `VBAK` / `VBAP` | Pedidos + líneas (volumen, frecuencia, categorías, ticket) | Disponible |
| Maestro clientes | `KNA1` | Datos maestro: código, nombre, zona | Pendiente carga IT |
| Clientes — canal | `KNVV` | RAMO (canal SAP), comercial asignado | Pendiente carga IT |
| Jerarquía clientes | `KNVH` | Agrupaciones de clientes | Pendiente carga IT |
| Facturación cabecera | `VBRK` | Facturas emitidas | Pendiente carga IT |
| Facturación posiciones | `VBRP` | Líneas de factura | Pendiente carga IT |

**Tablas adicionales a explorar:**
- `VENTAS_MASTER_CE1IMPR` (CO-PA): posiblemente tiene margen directo — verificar antes de construirlo manualmente desde Golden Table.

**Nota sobre RFM vs. multivariable**: Se descartó RFM explícitamente. RFM es operativo/ventas (mirar hacia atrás). Nuestra segmentación es estratégica/marketing (6 variables: volumen, frecuencia, nº categorías, ticket medio, tendencia, margen). Nota sincronizada en cerebro-digital.

## Estructura del Repositorio — Dos capas, un repo

El repo tiene dos capas que conviven sin mezclarse:

```
# === CAPA ACADÉMICA (output: TFM para UNIR) ===
admin/              # Normativa UNIR: reglamento, guía, instrucciones, plantilla Word
entregas/           # Documentos finales enviados a evaluación (Word/PDF)
referencias/        # TFMs de sobresaliente para estudiar estructura y nivel
sesiones/           # Notas de reuniones con Eduardo y tutorías

# === CAPA TÉCNICA (output: sistema real para Imprex) ===
src/
  etl/              # Conexión Oracle, extracción y limpieza de datos SAP
  eda/              # Análisis exploratorio (pandas, seaborn)
  segmentacion/     # Clustering K-Means, perfilado de segmentos (scikit-learn)
  scoring/          # Modelos predictivos (logit, árboles)
  promociones/      # Cálculo BEP, matrices de escenarios, simulación
sql/                # Queries Oracle (exploración + producción)
datos/
  raw/              # Extracciones SAP (gitignored — NUNCA commitear)
  processed/        # Datos limpios y transformados (gitignored)

# === PUENTE (conecta ambas capas) ===
docs/
  metodologia/      # Frameworks teórico-prácticos que fundamentan ambas capas
    framework-bep.md
    framework-segmentacion.md
    framework-scoring.md
```

**Regla de oro**: lo que está en `src/`, `sql/` y `datos/` es trabajo real de Imprex. Lo que está en `entregas/` es la versión académica del mismo trabajo. `docs/metodologia/` alimenta a ambos.

### Frameworks metodológicos (`docs/metodologia/`)
Estos documentos son la columna vertebral técnica del TFM. Conectan la teoría del Máster (profesor Herranz, asignaturas de Estrategia y R) con la implementación real:

- **framework-segmentacion.md**: Pipeline completo de clustering B2B. Variables propuestas, perfilado con árboles ("engañar al ordenador"), y conexión segmento → acción comercial (captación/desarrollo/retención). Snippets en R como referencia; implementación en Python (scikit-learn).
- **framework-bep.md**: Fórmula BEP, matrices de escenarios (r × g), regla del threshold para minimizar dilución. Cada segmento tiene su propio BEP porque tiene distinto margen/ticket/frecuencia. Snippets en R como referencia; implementación en Python (numpy/pandas).
- **framework-scoring.md**: Scoring de propensión (logit) y reglas de negocio (árboles). Del score a la acción: solo ofrecer promo a clientes con P(respuesta) × Margen > Coste_oferta. Snippets en R como referencia; implementación en Python (scikit-learn).

## Restricciones de Originalidad e IA (CRITICO)

### Turnitin
- Tope máximo de similitud (~29%). Priorizar parafraseo, minimizar citas literales.

### Uso de IA — Lo que dice la norma
- **Permitido:** planificación, lluvia de ideas, localización de fuentes y datos estadísticos.
- **PROHIBIDO (suspenso directo):** usar IA para redactar texto, ejecutar cálculos o realizar análisis de datos.

### Implicaciones para Claude en este proyecto
Claude puede ayudar con:
- Organización, planificación y estructura del trabajo.
- Buscar y sugerir fuentes bibliográficas.
- Revisar y dar feedback sobre borradores escritos por el alumno.
- Discutir ideas, enfoques metodológicos y arquitectura de datos.
- Preparar las queries SQL y el código Python (que el alumno ejecutará y adaptará).

Claude NO genera:
- Texto final para incluir en el TFM.
- Cálculos, análisis de datos ni visualizaciones presentados como trabajo del alumno.

## Reglas de Redacción
- **Formato APA** estricto: citas en cuerpo emparejadas con bibliografía final.
- **Plantilla Word obligatoria** (`admin/plantilla.docx`): no alterar tipografía, interlineado ni índice.
- **Antidetector IA:** prosa académica densa, conectores lógicos de papers. Prohibido: "En conclusión", "Es importante destacar", listas de viñetas simétricas, estructuras genéricas de IA.
- Todo dato afirmado respaldado por bibliografía o datos empíricos de Imprex.
- Apartado "Organización del trabajo en grupo" antes de la Introducción (obligatorio por ser grupal).

## Decisiones Tomadas (registro acumulativo)

| Fecha | Decisión | Justificación |
|-------|----------|---------------|
| 2026-03-20 | Stack Python (no R) | Se aprende en C2, mayor valor Imprex largo plazo, tribunal indiferente al lenguaje |
| 2026-03-20 | Caso de estudio: marca Garza, todas las categorías | Datos reales disponibles, proyecto operativo real |
| 2026-03-20 | Segmentación multivariable (6 vars), no RFM | RFM es operativo/ventas; nuestro enfoque es estratégico/marketing |
| 2026-03-20 | SALESLAYER_PRODUCTOS_GARZA como base del maestro de productos | Ya filtrada y enriquecida desde PIM (455 productos); evita reconstruir desde DIM_MARA |
| 2026-03-20 | JOIN puntual con MV_GOLDEN_TABLE_COMPLETA para márgenes | Tiene COSTE_UNITARIO y TARIFA_BASE_EUR; explorar antes CO-PA (VENTAS_MASTER_CE1IMPR) |
| 2026-03-20 | Repo único: todo el trabajo aquí | analitica-comercial y optimizacion-promociones quedan como archivo/referencia |

## Proyectos Relacionados (solo referencia)
| Proyecto | Qué aporta | Estado |
|----------|------------|--------|
| `~/Proyectos/IMPREX/analitica-comercial/` | Diseño original del sistema. Frameworks ya copiados aquí. | Archivo — no se trabaja ahí |
| `~/Proyectos/ACTIVIDADES_UNIR/Cuatrimestre_1/EstrategiaYGestiónEmpresarial/` | Teoría: BEP, customer centricity, KPIs, ciclo intelligence-action | Consulta puntual |
| `~/Proyectos/ACTIVIDADES_UNIR/Cuatrimestre_1/Estudiar_R/` | Fundamentos técnicos: clustering, scoring, EDA (conceptos, no código) | Consulta puntual |
| `~/Proyectos/optimizacion-promociones/` | Primer intento del proyecto (solo scaffold). Sin código real. | Archivo — no aporta |

## Modo de Trabajo
**Modo productivo** por defecto. El foco es avanzar rápido dentro de los límites permitidos.
