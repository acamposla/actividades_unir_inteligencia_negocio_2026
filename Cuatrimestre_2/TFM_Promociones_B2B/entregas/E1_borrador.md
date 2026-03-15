# Entrega 1 — Borrador de trabajo

**Fecha límite:** 15 marzo 2026 (domingo)
**Formato final:** Word (plantilla `admin/plantilla.docx`)
**Extensión:** 5-8 hojas
**Qué pide Eduardo:** redacción conclusiva de qué vamos a hacer, qué problema, con qué datos, qué objetivo y cómo lo enfocamos.

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

### 1.1. Justificación del tema

**Idea central:** En la distribución FMCG en España, los canales de venta están muy atomizados (supermercados, hipermercados, bazares, bricolaje, ferreterías, electrodomésticos). Los distribuidores exclusivos como Imprex Europe gestionan marcas líderes (Energizer, iRobot, Garza, Hawaiian Tropic, Wilkinson) que compiten por dominar los lineales físicos y digitales (digital shelf). En este contexto, las promociones comerciales son una palanca crítica, pero se diseñan de forma genérica — el mismo descuento para todos los clientes de un canal, sin evaluar su rentabilidad ni segmentar por comportamiento real.

**Conceptos a fundamentar con bibliografía:**

- Segmentación de mercado y customer centricity (Dolnicar et al., 2018 — usado por Intriago)
- Decisiones HIPPO vs data-driven (buscar fuente)
- Distribución FMCG y atomización de canales en España (buscar fuente sectorial)
- B2B vs B2C: por qué RFM no basta en B2B (buscar fuente)

**Notas del alumno (borrador libre):**

> [Espacio para que Alejandro escriba su borrador aquí]

---

### 1.2. Planteamiento del problema

**Idea central:** Imprex diseña promociones por RAMO (canal SAP) con descuento uniforme. No existe segmentación por comportamiento de compra ni evaluación previa de rentabilidad (Break Even Point). Las decisiones son tipo HIPPO: "7% de descuento para todas las ferreterías". Esto genera dilución de margen en clientes que habrían comprado igual, y oportunidades perdidas con clientes que necesitan incentivos distintos.

**Caso de estudio:** Garza, marca líder en iluminación y conectividad IoT en España, distribuida en exclusiva por Imprex Europe. Portfolio multicategoría (iluminación, IoT, conectividad) vendido a través de múltiples canales B2B.

**Pregunta de investigación:** ¿Es posible optimizar las promociones comerciales B2B mediante segmentación analítica de clientes y simulación de escenarios de rentabilidad?

**Notas del alumno (borrador libre):**

> [Espacio para que Alejandro escriba su borrador aquí]

---

### 1.3. Objetivos del TFE

**Objetivo general:**
Diseñar un sistema de segmentación de clientes B2B y optimización de promociones comerciales para la marca Garza, mediante técnicas de clustering y análisis de rentabilidad, aplicado a datos reales del ERP de Imprex Europe.

**Objetivos específicos:**

- OE1: Realizar un análisis exploratorio descriptivo de los datos transaccionales de la marca Garza (ventas, clientes, categorías, canales) para identificar patrones y calidad de datos.
- OE2: Segmentar la base de clientes B2B mediante clustering K-Means sobre variables de comportamiento de compra (volumen, frecuencia, categorías, ticket medio, tendencia, margen).
- OE3: Perfilar los segmentos resultantes mediante árboles de decisión, generando reglas interpretables para el equipo comercial.
- OE4: Simular escenarios promocionales por segmento mediante cálculo de Break Even Point (BEP) y matrices de respuesta (r × g).
- OE5: Implementar una herramienta de visualización (dashboard) que integre la segmentación y los escenarios para la toma de decisiones.

**Notas del alumno (borrador libre):**

> [Espacio para que Alejandro escriba su borrador aquí]

---

## 2. Datos y metodología (visión general)

### 2.1. Fuente de datos

**Idea central:** Los datos proceden del ERP SAP de Imprex Europe, replicados en un esquema Oracle (REPORTING). Se trabajará con datos transaccionales reales de la marca Garza, todas sus categorías de producto, para un periodo de 12-24 meses.

**Datos necesarios:**

- Maestro de clientes: código, nombre, RAMO (canal), zona, comercial asignado
- Transacciones: fecha, cliente, artículo, cantidad, precio neto, descuento aplicado, margen
- Maestro de artículos: código, descripción, familia/categoría (dentro de Garza)
- Condiciones comerciales: descuentos vigentes por cliente/canal

**Variables de segmentación a construir:**
| Variable | Cálculo | Fuente |
|----------|---------|--------|
| Volumen anual (€) | SUM(neto) por cliente | Facturación |
| Frecuencia de pedido | COUNT(DISTINCT pedido) por cliente | Pedidos |
| Nº categorías | COUNT(DISTINCT categoria) por cliente | Líneas de pedido |
| Ticket medio | AVG(neto_pedido) por cliente | Pedidos |
| Tendencia | Ratio periodo actual / anterior | Comparar periodos |
| Margen | SUM(neto - coste) por cliente | Facturación + costes |

**Notas del alumno (borrador libre):**

> [Espacio para que Alejandro escriba su borrador aquí]

---

### 2.2. Enfoque metodológico

**Idea central:** El proyecto sigue el ciclo Intelligence-Action: extraer datos → analizar → segmentar → diseñar acción → ejecutar → medir. No se limita a describir segmentos (como el RFM clásico), sino que conecta cada segmento con una acción comercial cuya rentabilidad se calcula antes de ejecutar.

**Pipeline:**

```
ETL (Python/SQL) → EDA (pandas/seaborn) → K-Means (scikit-learn)
→ Perfilado (árboles) → BEP (matrices de escenarios) → Dashboard (PowerBI)
```

**Diferenciación metodológica respecto a enfoques clásicos:**

- No usamos RFM: en B2B la Recencia tiene menos peso (ciclos de compra regulares). Usamos variables multidimensionales de comportamiento.
- K-Means directamente sobre variables de comportamiento, no sobre scores RFM.
- Perfilado con árboles de decisión: genera reglas legibles ("Si volumen > 50k€ Y frecuencia > 24 → VIP").
- BEP por segmento: cada segmento tiene distinto margen, ticket y frecuencia base → distinto umbral de rentabilidad.

**Notas del alumno (borrador libre):**

> [Espacio para que Alejandro escriba su borrador aquí]

---

### 2.3. Herramientas

| Capa            | Herramienta                             |
| --------------- | --------------------------------------- |
| Fuente de datos | SAP / Oracle (esquema REPORTING)        |
| ETL y análisis  | Python (pandas, scikit-learn, oracledb) |
| Queries         | SQL                                     |
| Visualización   | Power BI / Quarto                       |
| Documentación   | Word (plantilla UNIR)                   |

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
- **Biblioteca virtual UNIR**: revistas académicas con acceso institucional (¿tienes apuntado en algún sitio el acceso a las revistas? Buscar en plataforma UNIR)
- **Google Scholar**: backup para confirmar citas APA correctas

---

## Checklist antes de entregar

- [ ] Apartado "Organización del trabajo en grupo" incluido
- [ ] Formato APA (citas en texto + bibliografía final)
- [ ] Plantilla Word de UNIR (`admin/plantilla.docx`)
- [ ] 5-8 hojas
- [ ] Redacción propia (no generada por IA)
- [ ] Tono conclusivo (no tentativo)
- [ ] Eduardo lo revisa antes del domingo 15
