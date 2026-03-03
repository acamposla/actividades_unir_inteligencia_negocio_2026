# Diccionario de Conceptos para el Examen

Referencia rápida de términos clave organizados por bloque temático. Para el examen no basta con definir: hay que **relacionar conceptos entre sí** y aplicarlos a casos de negocio.

---

## 1. Estrategia y Negocio

| Término | Definición | Contexto examen |
|---------|-----------|-----------------|
| **HIPPO** | Highest Paid Person's Opinion. Decisión basada en intuición/autoridad del jefe | Contrastar con Data-Driven. Caso típico de examen: identificar HIPPO en un caso y argumentar por qué es arriesgado |
| **Data-Driven** | Decisiones objetivas basadas en evidencia analítica | Opuesto a HIPPO. El proceso: dato → información → conocimiento → decisión → acción |
| **Customer Centricity** | Estrategia centrada en el cliente, no en el producto | El mercado es heterogéneo: diferentes clientes requieren diferente tratamiento |
| **Ciclo de vida del cliente** | Captación → Desarrollo (cross/up-selling) → Retención | Cada fase requiere acciones y KPIs distintos |
| **BEP (Break Even Point)** | Punto donde el margen incremental iguala el coste de la promoción | Fórmula: `Margen Neto = N × r × (Margen × g - Coste_oferta)`. Las dos palancas: respuesta (r) y gasto (g) |
| **Dilución / Respuesta espontánea** | Regalar descuento a clientes que habrían comprado igual | La exigencia (threshold) minimiza este coste. Poner condición POR ENCIMA del comportamiento habitual |
| **Matriz de escenarios** | Tabla que cruza % incremento respuesta × % incremento gasto | Cada celda muestra si ganas o pierdes. Sirve para comparar ofertas y encontrar el BEP |
| **KPI SMART** | Específico, Medible, Alcanzable, Relevante, Temporal | No basta con "aumentar ventas". Ejemplo: "Incrementar ticket medio de frescos de 19€ a 25€ en Q1 2026" |
| **ROI** | Return on Investment. Retorno sobre inversión | Métrica clave para evaluar campañas post-ejecución |
| **Churn** | Tasa de abandono de clientes | KPI de retención. Señal de alerta si sube |
| **Cross-selling / Up-selling** | Venta cruzada (más categorías) / Venta de mayor valor | Fase de desarrollo del ciclo de vida |
| **Segmentación** | Dividir clientes en grupos homogéneos por comportamiento | Imprescindible antes de cualquier acción comercial. El BEP es distinto por segmento |

---

## 2. Gobierno del Dato y Ética

| Término | Definición | Contexto examen |
|---------|-----------|-----------------|
| **RGPD** | Reglamento General de Protección de Datos (normativa europea) | No piden recitar la ley sino identificar qué principios se vulneran en un caso práctico |
| **Business Compliance** | Sistema que garantiza el cumplimiento normativo | El usuario debe aceptar expresamente qué datos se recogen y para qué uso |
| **Dato personal** | Cualquier información que identifique o haga identificable a persona física | Incluye: nombre, email, IP, geolocalización, ID dispositivo |
| **Dato anonimizado** | Sin posibilidad de identificación | Ya no es dato personal |
| **Dato pseudoanonimizado** | Sin identificador directo pero re-identificable con clave | Sigue siendo dato personal |
| **Limitación de finalidad** | Los datos solo se usan para lo que se informó al usuario | Caso Cambridge Analytica: datos académicos usados para fines políticos |
| **Minimización** | Recoger solo los datos necesarios | No pedir más de lo que el negocio necesita legítimamente |
| **Exactitud** | Datos actualizados y correctos | No guardar CVs de hace 10 años para enviar publicidad |
| **Limitación del plazo de conservación** | No guardar datos eternamente "por si acaso" | Hay que definir plazos y borrar cuando caduquen |
| **Derecho al olvido** | El usuario puede pedir que borren sus datos | Obligación legal |
| **Consentimiento expreso** | El usuario acepta explícitamente el uso de sus datos | No vale con "seguir navegando implica aceptar" |
| **Cambridge Analytica** | Caso de uso político de datos recogidos con fines académicos | Violación de limitación de finalidad. Facebook permitió acceso a datos sin control |
| **Responsable del tratamiento** | Entidad que decide qué datos recopilar y cómo | Distinto del encargado (quien procesa por cuenta del responsable) |

---

## 3. Infraestructura BI

| Término | Definición | Contexto examen |
|---------|-----------|-----------------|
| **BI (Business Intelligence)** | Integración de 5 elementos: procesos, tecnología, herramientas, personas, capacidades | Las personas son el elemento central y más difícil de copiar (ventaja competitiva) |
| **ETL** | Extract, Transform, Load. Proceso de extracción, transformación y carga de datos | Fase de transformación = limpieza: duplicados, nulos, formatos inconsistentes |
| **Data Warehouse (DTW)** | Repositorio centralizado para análisis (no para operativa diaria) | Motor que permite generar conocimiento e inteligencia |
| **Golden Record** | Versión única y veraz de un cliente tras unificar duplicados | Sin Golden Record, tratas al mismo cliente como varios distintos |
| **Modelo Estrella** | Tabla de hechos central + dimensiones sin jerarquías | Más rápido para consultas (desnormalizado). Elegir cuando prima velocidad |
| **Modelo Copo de Nieve** | Dimensiones normalizadas con jerarquías entre sí | Ahorra espacio pero más lento en joins. Más tablas |
| **Tabla de hechos** | Datos transaccionales: ventas, cantidad, fecha, IDs | Centro del modelo estrella |
| **Tabla de dimensiones** | Contexto: cliente, producto, tiempo, tienda | Rodean la tabla de hechos. Variables por las que se analiza |
| **Data Mart** | Data warehouse específico de un área (ventas, compras) | Subconjunto del DTW general |
| **CRM** | Customer Relationship Management. Sistema operacional de clientes | Fuente de datos para el DTW |
| **ERP** | Enterprise Resource Planning (ej. SAP) | Sistema operacional de empresa. Otra fuente de datos |

---

## 4. Interpretación Analítica

| Término | Definición | Contexto examen |
|---------|-----------|-----------------|
| **Clustering (K-Means)** | Aprendizaje NO supervisado. Agrupa datos en k grupos por similitud | Interpretación: mirar medias de cada grupo, ponerles nombre, proponer estrategia por segmento |
| **Árbol de decisión** | Aprendizaje supervisado. Estructura jerárquica de reglas | Nodo raíz arriba, ramas = reglas, hojas = probabilidad. Saber leer: "Si X > 30 y Y < 20k → 90% No compra" |
| **"Engañar al ordenador"** | Usar árbol supervisado para explicar clusters no supervisados | Se usa el cluster como variable objetivo para extraer reglas legibles para negocio |
| **Regresión logística** | Predice variables binarias (Sí/No, 0/1) | El P-valor indica qué variables influyen realmente. P < 0.05 = significativa |
| **Series temporales (ARIMA)** | Análisis de datos con frecuencia temporal para predicción | Requiere variable temporal + frecuencia (mensual, diaria). En R: objeto `ts` |
| **Correlación** | Relación lineal entre dos variables (-1 a +1) | **Correlación NO implica causalidad**. Concepto crítico que el profesor repite |
| **Matriz de confusión** | Tabla de evaluación: predichos vs reales | Verdaderos positivos, falsos positivos, verdaderos negativos, falsos negativos |
| **Supervisado vs No supervisado** | Con variable objetivo vs sin ella | Clustering = no supervisado. Árbol y regresión = supervisados |
| **Scoring** | Asignar probabilidad a cada cliente (ej. probabilidad de churn) | Resultado de modelos predictivos. Se usa para priorizar acciones comerciales |

---

## 5. Proceso del Ciclo Intelligence-Action

El profesor enfatiza este flujo como **ciclo virtuoso**:

```
1. Propuesta de valor
2. Drivers de información
3. Análisis (segmentación, modelos, valor cliente)
4. Definición de acción (oferta, canal, objetivo)
5. Comunicación (segmentada, multicanal)
6. Gestión de campaña (registro de impactos)
7. Análisis de resultados (ROI, KPIs)
8. Aprendizajes → Nueva propuesta (cierra el ciclo)
```

---

## 6. Visualización

| Término | Definición | Contexto examen |
|---------|-----------|-----------------|
| **Mantra del profesor** | "Olvido lo que leo, recuerdo lo que veo" | Justifica la inversión en visualización |
| **Tableau** | Tres niveles: Hoja de trabajo → Dashboard → Historia | La "Historia" (narrativa secuencial) es el diferencial vs PowerBI |
| **Dashboard** | Panel visual de KPIs | Conjunto de gráficos combinados para toma de decisiones |

---

## 7. Roles Profesionales

| Rol | Función |
|-----|---------|
| **Data Scientist** | Modelos predictivos avanzados |
| **Data Analyst** | Reporting, análisis exploratorio |
| **Data Engineer** | Infraestructura, ETL, pipelines |
| **Business Analyst** | Traducción entre negocio y datos |
| **CDO (Chief Digital Officer)** | Estrategia digital |

---

## Conceptos trampa (el profesor insiste en estos)

1. **Correlación ≠ Causalidad**: Que dos variables se muevan juntas no significa que una cause la otra.
2. **Incremento de facturación ≠ Incremento de margen**: Puedes vender más y ganar menos si el coste de la promo supera el margen extra.
3. **El coste del producto NO cambia con la promo**: Si bajas el precio, el coste sigue igual. Tu margen % cambia pero el coste en euros no.
4. **Más respuesta no siempre es mejor**: Si la oferta no es rentable por cliente, más respuesta amplifica las pérdidas.
5. **No memorices, relaciona**: El examen no pide definiciones sino aplicación a casos.
