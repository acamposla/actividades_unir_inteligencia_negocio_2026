# Proyecto: TFM Inteligencia de Negocio (UNIR)

## Tema
Segmentación de clientes B2B y optimización de promociones comerciales en distribución FMCG.
**Caso real: Imprex** (distribuidor de gran consumo, empresa familiar).

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
- **Análisis de Datos con R** (C1) → fundamentos de EDA, clustering K-Means, regresión logística, árboles de decisión
- **Machine Learning con Python** (C2, en curso) → implementación en Python con scikit-learn, pandas

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
- [ ] **Fase 0**: Definir alcance y datos necesarios → pedir extracción a IT
- [ ] **Fase 1**: Extraer datos SAP (clientes, pedidos, facturación últimos 12-24 meses) para segmento piloto
- [ ] **Fase 2**: EDA en Python — distribuciones, correlaciones, anomalías, calidad de datos
- [ ] **Fase 3**: Segmentación K-Means (scikit-learn) — perfilar segmentos con árboles de decisión
- [ ] **Fase 4**: BEP por segmento — matrices de escenarios (r × g)
- [ ] **Fase 5**: Diseñar y ejecutar promoción piloto real en Imprex
- [ ] **Fase 6**: Medir resultados, documentar como caso de éxito

## Datos SAP Necesarios (pendiente confirmar con IT)

**Tablas clave del esquema REPORTING (Oracle, réplica SAP):**
- Maestro de clientes: código, nombre, RAMO (canal), zona, comercial asignado
- Pedidos/Facturación: fecha, cliente, artículo, cantidad, precio, descuento, margen
- Maestro de artículos: código, descripción, familia, categoría
- Condiciones comerciales: descuentos vigentes por cliente/canal

> **Próximo paso concreto**: Identificar las tablas exactas en el esquema REPORTING y confirmar disponibilidad de las variables de segmentación. Usar el skill `sap-distribucion` y el MCP `oracle-db` para explorar.

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

- **framework-segmentacion.md**: Pipeline completo de clustering B2B. Variables propuestas, perfilado con árboles ("engañar al ordenador"), y conexión segmento → acción comercial (captación/desarrollo/retención). Código de referencia en R, se implementará en Python (scikit-learn).
- **framework-bep.md**: Fórmula BEP, matrices de escenarios (r × g), regla del threshold para minimizar dilución. Cada segmento tiene su propio BEP porque tiene distinto margen/ticket/frecuencia. Código de referencia en R, se implementará en Python (numpy/pandas).
- **framework-scoring.md**: Scoring de propensión (logit) y reglas de negocio (árboles). Del score a la acción: solo ofrecer promo a clientes con P(respuesta) × Margen > Coste_oferta. Código de referencia en R, se implementará en Python (scikit-learn).

> **Nota**: Los frameworks contienen snippets en R (del Cuatrimestre 1). La metodología es agnóstica al lenguaje; la implementación real será en Python.

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

## Proyectos Relacionados (solo referencia)
| Proyecto | Qué aporta | Estado |
|----------|------------|--------|
| `~/Proyectos/IMPREX/analitica-comercial/` | Diseño original del sistema. Frameworks ya copiados aquí. | Archivo — no se trabaja ahí |
| `~/Proyectos/ACTIVIDADES_UNIR/Cuatrimestre_1/EstrategiaYGestiónEmpresarial/` | Teoría: BEP, customer centricity, KPIs, ciclo intelligence-action | Consulta puntual |
| `~/Proyectos/ACTIVIDADES_UNIR/Cuatrimestre_1/Estudiar_R/` | Fundamentos técnicos: clustering, scoring, EDA (conceptos, no código) | Consulta puntual |
| `~/Proyectos/optimizacion-promociones/` | Primer intento del proyecto (solo scaffold). Sin código real. | Archivo — no aporta |

## Modo de Trabajo
**Modo productivo** por defecto. El foco es avanzar rápido dentro de los límites permitidos.
