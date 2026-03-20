# Contexto de Conversación

## Última actualización
2026-03-20

## ¿Qué estábamos haciendo?

Dos frentes en paralelo durante la sesión:

1. **Cierre de E1 (Entrega 1)**: merge de versiones Alejandro + Leticia en TFM_Garza_main.docx. Estructura del documento consolidada, bibliografía parcialmente resuelta.
2. **Exploración de tablas Oracle/SAP**: identificar qué tablas del esquema REPORTING sirven para la ETL de segmentación (marca Garza).

## Estado de la tarea actual

### Documento E1
El fichero `entregas/TFM_Garza_main.docx` contiene el merge completo con esta asignación de secciones:
- Sección 0 (organización grupo): Leticia, en prosa
- Sección 1.1 (justificación + problema): Leticia base + ejemplo RAMO de Alejandro
- Sección 1.2 (objetivos): Leticia, lenguaje académico
- Sección 1.3 (elementos innovadores): Leticia completo
- Sección 2 (alcance): Alejandro (tablas, pipeline)
- Sección 7 (limitaciones): Alejandro (atribución campañas)

Pendiente: la sección 2.2 (enfoque metodológico) necesita reescritura por Alejandro ahora que tiene claro RFM vs. multivariable. También hay gaps en sección 2 (deficiencias, habilidades, gaps, recomendaciones).

**ALERTA**: La fecha objetivo del tutor (Eduardo) era 15 de marzo. Hoy es 20 de marzo. Hay que confirmar el estado de la entrega con Eduardo — si E1 ya se entregó en UNIR, si Eduardo la tiene, etc.

### Bibliografía E1
4 referencias encontradas y en APA:
- Luhn (1958) — Business Intelligence original
- Kaplan & Norton (1996) — KPIs / Balanced Scorecard
- Dolnicar (2002) — segmentación B2B
- Caseiro & Coelho (2019) — BI en PYME

8 referencias pendientes de buscar:
- HIPPO decision-making (concepto de decisiones por jerarquía, no datos)
- BEP aplicado a promociones comerciales
- K-Means / clustering en contexto comercial
- Árboles de decisión para perfilado de segmentos
- B2B segmentation (paper académico, no divulgativo)
- RFM (aunque lo descartamos, la mención en el texto necesita cita)
- FMCG España / dato de mercado (¿AECOC? — verificar si hay fuente real o eliminar mención)
- Customer centricity (Fader o similar)

### ETL / Oracle
Conexión funciona. Tablas identificadas en CLAUDE.md. Falta:
- Confirmar que IT ha cargado KNA1, KNVV, KNVH, VBRK, VBRP
- Explorar VENTAS_MASTER_CE1IMPR (CO-PA) para ver si tiene margen directo antes de construirlo desde Golden Table

## Problemas abiertos

- **Cita AECOC**: en el texto hay una referencia a dato de mercado FMCG España que puede ser inventada o no tener fuente verificable. Revisar el párrafo exacto y o bien localizar la fuente real en aecoc.es o retirar la afirmación.
- **Fecha E1**: La fecha del tutor (15 marzo) ya pasó. Desconocemos si Eduardo recibió algo o si hay penalización. Confirmar con Leticia y con Eduardo.
- **Tablas IT pendientes**: KNA1, KNVV, KNVH, VBRK, VBRP pedidas pero sin confirmar carga. Sin estas tablas no se puede construir el maestro de clientes ni la facturación limpia.

## Próximo paso concreto

Lo primero al retomar:
1. Verificar con Eduardo el estado de E1 (¿entregada? ¿tiene feedback?).
2. Buscar las 8 referencias bibliográficas pendientes (empezar por HIPPO y customer centricity, que son las más citadas en el texto).
3. Reescribir sección 2.2 enfoque metodológico (Alejandro) — justificar por qué multivariable B2B y no RFM.

Cuando llegue confirmación de IT sobre tablas Oracle:
4. Explorar VENTAS_MASTER_CE1IMPR para márgenes.
5. Diseñar ETL completa: queries en `sql/`, scripts en `src/etl/`.

## Notas de sesión

- La decisión de usar Garza como caso de estudio (en lugar de Imprex genérico) tiene ventaja académica: es un universo de productos más acotado (455 en SalesLayer) y permite un análisis más limpio para el TFM. Operativamente sigue siendo real.
- SALESLAYER_PRODUCTOS_GARZA es un hallazgo importante: evita reconstruir el maestro de productos desde cero y ya viene enriquecida desde el PIM. Esto simplifica mucho la ETL.
- La segmentación multivariable (6 variables) vs. RFM está documentada como decisión en CLAUDE.md y sincronizada en cerebro-digital. Si alguien pregunta en el tribunal, la respuesta es: RFM mira comportamiento pasado de ventas (operativo); nuestras 6 variables incluyen tendencia y margen, lo que lo hace estratégico y prospectivo.
