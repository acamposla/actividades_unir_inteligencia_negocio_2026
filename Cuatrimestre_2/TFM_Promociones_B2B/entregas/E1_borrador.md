# Entrega 1 — Borrador de trabajo

**Fecha límite:** 15 marzo 2026 (domingo)
**Formato final:** Word (plantilla `admin/plantilla.docx`)
**Extensión:** 5-8 hojas
**Qué pide Eduardo:** redacción conclusiva de qué vamos a hacer, qué problema, con qué datos, qué objetivo y cómo lo enfocamos.
**Estructura:** Sigue el índice de `admin/plantilla.docx`. Para E1 cubrimos secciones 0, 1 y parcialmente 2.

---

## Referencia principal

- Intriago Solórzano, G.M. (2022). "Inteligencia de Negocio aplicada a la Segmentación de clientes: Modelo RFM y Análisis de Clúster". UNIR. (Notable+)
- **Ojo**: temática similar. Nuestro trabajo se diferencia en: enfoque B2B multivariable (no RFM), cálculo BEP/rentabilidad de promociones, perfilado con árboles, campaña piloto real, problema HIPPO explícito.

---

## 0. Organización del trabajo en grupo

> Apartado obligatorio antes de la Introducción (por ser TFM grupal).

**Modelo de trabajo:** No se reparte con una separación estricta de funciones. Ambos miembros ejecutan todas las partes del proyecto y se revisan mutuamente en un proceso iterativo de mejora continua. Las diferencias de rol son por acceso y perfil:

- **Alejandro**: acceso directo a los datos de la empresa (SAP/Oracle), responsable de la extracción, ETL y modelado técnico.
- **Leticia**: mayor peso en la revisión bibliográfica, redacción descriptiva y búsqueda de fuentes académicas.
- **Ambos**: participan en el análisis, la interpretación de resultados y la redacción de todas las secciones.

**Mecanismos de coordinación:**

- Reuniones semanales donde cada uno trae una propuesta de integración sobre el trabajo revisado del otro, que se valida conjuntamente.
- Antes de cada reunión, ambos han revisado lo que produjo el otro.
- Repositorio privado en GitHub para control de versiones del código y documentación.
- Google Colab para borradores de código colaborativos, que después se transforman en scripts modulares en VSCode.

**Nota para redactar:** Adaptar a prosa académica. Evitar formato de lista — debe leerse como párrafo continuo.

---

## 1. Introducción

### 1.1. Planteamiento general: descripción y justificación del proyecto

> Este apartado combina justificación + planteamiento del problema en un solo epígrafe (así lo pide la plantilla).

**Justificación (primera parte del 1.1):**
En la distribución FMCG en España, los canales de venta están muy atomizados (supermercados, hipermercados, bazares, bricolaje, ferreterías, electrodomésticos). Los distribuidores exclusivos como Imprex Europe gestionan marcas líderes (Energizer, iRobot, Garza, Hawaiian Tropic, Wilkinson) que compiten por dominar los lineales físicos y digitales (digital shelf). Las promociones comerciales B2B son una palanca crítica, pero se diseñan de forma genérica — el mismo descuento para todos los clientes de un canal, sin evaluar su rentabilidad ni segmentar por comportamiento real.

**Planteamiento del problema (segunda parte del 1.1):**
Imprex diseña promociones por RAMO (canal SAP) con descuento uniforme. No existe segmentación por comportamiento de compra ni evaluación previa de rentabilidad (BEP). Las decisiones son tipo HIPPO. Esto genera dilución de margen y oportunidades perdidas.

Caso de estudio: Garza, marca líder en iluminación y conectividad IoT, distribuida en exclusiva por Imprex Europe. Portfolio multicategoría vendido a través de múltiples canales B2B.

Pregunta de investigación: ¿Es posible optimizar las promociones comerciales B2B mediante segmentación analítica de clientes y simulación de escenarios de rentabilidad?

**Conceptos a fundamentar con bibliografía:**

- Segmentación de mercado y customer centricity
- Decisiones HIPPO vs data-driven
- Distribución FMCG y atomización de canales en España
- B2B vs B2C: por qué RFM no basta en B2B

---

### 1.2. Objetivos del TFE

**Objetivo general:**
Diseñar un sistema de segmentación de clientes B2B y optimización de promociones comerciales para la marca Garza, mediante técnicas de clustering y análisis de rentabilidad, aplicado a datos reales del ERP de Imprex Europe.

**Objetivos específicos:**

- OE1: Definir el alcance de datos y realizar el proceso ETL desde el data lake corporativo.
- OE2: Segmentar la base de clientes B2B mediante clustering K-Means sobre variables de comportamiento de compra.
- OE3: Perfilar los segmentos resultantes mediante árboles de decisión, generando reglas interpretables.
- OE4: Simular escenarios promocionales por segmento mediante BEP y matrices de respuesta.
- OE5: Implementar un dashboard que integre la segmentación y los escenarios para toma de decisiones.

---

### 1.3. Elementos innovadores del proyecto

> **NUEVO — hay que escribir este apartado.** Ideas para cubrir:

- **Segmentación multivariable B2B** (6 variables de comportamiento) frente al RFM clásico (3 variables).
- **BEP por segmento**: cada segmento tiene distinto margen, ticket y frecuencia → distinto umbral de rentabilidad. No se lanza una promo sin calcular su punto de equilibrio.
- **Perfilado con árboles de decisión** ("engañar al ordenador"): genera reglas legibles que el equipo comercial puede aplicar sin ejecutar modelos.
- **Datos reales de un ERP en producción** (SAP/Oracle), no datasets de ejemplo.
- **Sistema modular y reproducible** pensado para implementación real, no solo entrega académica.
- **Propuesta de atribución de campañas** en SAP para cerrar el ciclo de medición.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

## 2. Alcance y planificación

### 2.1. Fase de descubrimiento: evaluación del entorno actual

#### 2.1.1. Información deseada

> Aquí va: qué queremos conseguir, qué información necesitamos para segmentar y optimizar.

**Idea central:** Para poder segmentar clientes y diseñar promociones rentables, necesitamos construir un perfil multidimensional de cada cliente basado en variables de comportamiento de compra.

**Variables de segmentación a construir:**
| Variable | Cálculo | Fuente |
|----------|---------|--------|
| Volumen anual (€) | SUM(neto) por cliente | Facturación |
| Frecuencia de pedido | COUNT(DISTINCT pedido) por cliente | Pedidos |
| Nº categorías | COUNT(DISTINCT categoría) por cliente | Líneas de pedido |
| Ticket medio | AVG(neto_pedido) por cliente | Pedidos |
| Tendencia | Ratio periodo actual / anterior | Comparar periodos |
| Margen | SUM(neto - coste) por cliente | Facturación + costes |

**Pipeline metodológico:**

```
ETL (Python/SQL) → EDA (pandas/seaborn) → K-Means (scikit-learn)
→ Perfilado (árboles) → BEP (matrices de escenarios) → Dashboard (PowerBI)
```

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

#### 2.1.2. Información actual: deficiencias y soluciones alternativas

> Aquí va: cómo funciona Imprex HOY, qué falla, qué se hace mal.

**Idea central:** Hoy las promociones se diseñan por RAMO (canal SAP) con descuento uniforme. Las decisiones son tipo HIPPO. No hay segmentación por comportamiento ni cálculo previo de rentabilidad. Los reportes son estáticos en Excel, sin cruce multivariable.

**Notas del alumno (borrador libre):**

> [Espacio para redactar — ya tienes el contenido de "Planteamiento del problema" que puedes adaptar aquí]

---

#### 2.1.3. Habilidades analíticas actuales

> Aquí va: con qué herramientas y capacidades cuenta la empresa y el equipo del proyecto.

**Herramientas:**
| Capa | Herramienta | Uso |
|------|-------------|-----|
| Fuente de datos | SAP / Oracle (esquema REPORTING) | Datos transaccionales reales |
| ETL y análisis | Python (pandas, scikit-learn, oracledb) | Extracción, limpieza, modelado |
| Queries | SQL | Consultas sobre Oracle |
| Visualización | Power BI | Dashboards interactivos |
| Documentación | Quarto / Word | Informes reproducibles |

**Datos disponibles en SAP:**

- Maestros de clientes: Código, nombre, Ramo (canal), zona, comercial asignado
- Transacciones: fecha, cliente, artículo, cantidad, precio neto, descuento, margen
- Maestro de artículos: código, descripción, familia/categoría
- Condiciones comerciales: descuentos vigentes por cliente/canal

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

### 2.2. Fase de análisis: identificación de gaps

#### 2.2.1. Capacidad de los informes actuales

> Aquí: qué reportes tiene Imprex hoy y por qué no son suficientes.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

#### 2.2.2. Diferencia entre los informes actuales y la información deseada

> Aquí: de HIPPO → data-driven, de genérico → segmentado, de estático → dinámico.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

#### 2.2.3. Proveedores de tecnología necesarias

> Aquí: Python, scikit-learn, PowerBI — todo open source o licencias existentes.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

#### 2.2.4. Cronología, costes y recursos humanos implicados

> Aquí: cronograma del TFM (las fechas de entrega), recursos (equipo de 2, acceso a SAP), sin coste adicional.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

### 2.3. Fase de recomendaciones: alcance, prioridades y presupuesto

> Aquí: alcance = marca Garza, todas las categorías, 12-24 meses de datos.

**Notas del alumno (borrador libre):**

> [Espacio para redactar]

---

## Secciones 3-6: No se cubren en E1

> Estas secciones se desarrollarán en entregas posteriores:
> 
> - 3. Análisis y definición (EDA, limpieza, modelado)
> - 4. Construcción, prueba, implementación y despliegue
> - 5. Cronograma del proyecto (Swimlanes)
> - 6. Conclusiones

---

## 7. Limitaciones y prospectiva

> Ya hay contenido escrito sobre atribución de campañas en SAP.

**Contenido existente (resumen):** Para cerrar el ciclo intelligence-action se necesita trazabilidad de campañas en SAP (tabla de promociones con ID, asignación en tablet o automática). Hoy SAP aplica el descuento pero no registra qué promoción lo originó.

---

## Nota: Atribución de campañas en SAP (no es objetivo, pero sí mención)

**Contexto:** Para cerrar el ciclo intelligence-action (medir ROI real de una campaña), los pedidos deben registrar QUÉ campaña se aplicó. Hoy SAP no lo hace — el descuento se aplica pero no queda trazado qué promoción lo originó.

**Propuesta de diseño (para mencionar en metodología, paso 6):**

- Tabla de promociones con ID único (ej: `SEMANALUZ2026FERRETERIA`)
- Asignación en tablet por el vendedor, o automática cuando la línea de pedido cumple condiciones
- SAP registra el ID de campaña en cada línea de pedido → permite medir respuesta y ROI real

**Dónde incluir en el TFM:**

- En sección de metodología (ciclo intelligence-action, paso 6: medición)
- En "Limitaciones y prospectiva" como trabajo futuro pendiente de implementación IT

**No es un objetivo específico (OE)** — depende de IT y no lo controlamos. Pero mencionarlo muestra visión de implementación real.

---

## Bibliografía

### Ya encontrada (en temario UNIR o referencia Intriago)

- [x] Luhn, H.P. (1958). A business intelligence system. *IBM Journal of Research and Development*, 2(4), 314-319. ← paper fundacional de BI (Estrategia Tema 2)
- [x] Kaplan, R. y Norton, D. (1992). The Balanced Scorecard – Measures that Drive Performance. *Harvard Business Review*, 70(1), 47-54. (Estrategia Tema 6)
- [x] Dolnicar, S., Grün, B. y Leisch, F. (2018). *Market Segmentation Analysis*. Springer. (Usado por Intriago)
- [x] Caseiro, N. y Coelho, A. (2018). Business Intelligence and competitiveness. *Competitiveness Review*, 28(2), 213-226. (Estrategia Tema 1)

### Pendiente buscar (Perplexity Pro modo Académico + Biblioteca UNIR)

- [ ] **HIPPO**: El temario UNIR lo define pero no cita fuente. Buscar: Avinash Kaushik (2006) *Web Analytics: An Hour a Day* o McAfee & Brynjolfsson (2012) en HBR.
- [ ] **BEP de promociones**: No aparece en el temario. Buscar: Blattberg, R. y Neslin, S. (1990) *Sales Promotion*; o Kotler/Armstrong sobre análisis de punto de equilibrio promocional.
- [ ] **K-Means**: El temario no cita el paper original. Buscar: MacQueen, J. (1967). "Some methods for classification and analysis of multivariate observations." *Proceedings of the 5th Berkeley Symposium*.
- [ ] **Árboles de decisión**: Buscar: Breiman, L. et al. (1984). *Classification and Regression Trees*. Quinlan, J.R. (1986). Induction of decision trees.
- [ ] **B2B segmentation**: Buscar: Bonoma, T.V. y Shapiro, B.P. (1984). "Evaluating Market Segmentation Approaches." *Industrial Marketing Management*. Wind, Y. y Cardozo, R. (1974).
- [ ] **RFM**: Buscar: Hughes, A.M. (1994). *Strategic Database Marketing*; Fader, P. et al. (2005) sobre CLV/RFM.
- [ ] **Distribución FMCG en España**: Buscar informes AECOC, Nielsen, Kantar sobre distribución comercial y canales en España.
- [ ] **Customer centricity**: Buscar: Fader, P. (2012). *Customer Centricity*. Wharton Press.

### Dónde buscar

- **Perplexity Pro** (modo "Academic"): para papers y libros
- **Biblioteca virtual UNIR**: revistas académicas con acceso institucional
- **Google Scholar**: backup para confirmar citas APA correctas

---

## Checklist antes de entregar

- [ ] Apartado "Organización del trabajo en grupo" en prosa
- [ ] Buscar cita real de AECOC (informe distribución gran consumo España) o quitar mención explícita
- [ ] Modificar la introducción respecto a AECOC y sustituir por lo encontrado en perplexity
- [ ] 1.1 Justificación + problema integrados
- [ ] 1.3 Elementos innovadores redactado
- [ ] 2.1-2.3 al menos parcialmente cubiertos
- [ ] Formato APA (citas en texto + bibliografía final)
- [ ] Plantilla Word de UNIR con epígrafes correctos
- [ ] 5-8 hojas
- [ ] Redacción propia (no generada por IA)
- [ ] Tono conclusivo (no tentativo)
- [ ] Eduardo lo revisa antes del domingo 15
