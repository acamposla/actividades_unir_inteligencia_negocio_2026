# EXAMEN FINAL — Visualización Avanzada y Automatización de Análisis de Datos

**Simulacro 1** | **Fecha:** 2026-02-20
**Plataforma:** Hexam | **Duración:** 2 horas
**Entregable:** Archivo `.pbix` + respuestas escritas
**Herramienta permitida:** Power BI Desktop (o Tableau). Excel solo para inspección inicial.
**Dataset:** `data/Base de datos examen.xlsx`

---

## ESCENARIO DE NEGOCIO

La consultora **Nexus Analytics** ha sido contratada por **GlobalPlay Entertainment**, un grupo editorial de videojuegos que opera en Norteamérica, Europa, Japón y otros mercados. La dirección quiere un dashboard analítico para responder a preguntas estratégicas sobre el rendimiento histórico de sus ventas por plataforma, género y mercado geográfico.

Te han entregado el archivo **"Base de datos examen.xlsx"** con 3 hojas de datos.

---

## PARTE PRÁCTICA (60%)

### Fase 1 — Revisión y Pre-análisis (10%)

**P1.** Describe brevemente el dataset: ¿cuántas hojas tiene, qué contiene cada una, cuántas filas/columnas, y cuáles son las variables principales?

> *Respuesta:*
>

**P2.** ¿Cómo se relacionan las 3 hojas entre sí? Explica qué estrategia usarás para combinarlas y por qué.

> *Respuesta:*
>

**P3.** Identifica al menos **4 problemas de calidad de datos** que habrá que resolver antes de visualizar.

> *Respuesta:*
>

---

### Fase 2 — Limpieza y Transformación en Power Query (20%)

Realiza las siguientes tareas. **Todos los pasos deben quedar visibles en "Pasos Aplicados" de Power Query.**

**T1.** Combina las hojas Sales y Platform en una sola tabla con todas las columnas.

> *Método utilizado y justificación:*
>

**T2.** Normaliza la columna `Genre`: corrige las inconsistencias que hayas detectado.

> *Pasos aplicados:*
>

**T3.** Revisa y corrige la columna `Platform_Name`: trata los valores anómalos.

> *Pasos aplicados:*
>

**T4.** Asegúrate de que los tipos de datos sean correctos en todas las columnas (especialmente Year y las columnas de ventas).

> *Tipos asignados:*
>

**T5.** Crea una columna calculada `Total_Sales` que sume las ventas de las 4 regiones.

> *Fórmula o paso utilizado:*
>

**T6.** Decide y aplica una estrategia para los valores nulos en `Year`. Justifica tu decisión por escrito.

> *Estrategia y justificación:*
>

---

### Fase 3 — Dashboard (15%)

Construye un dashboard con estas **4 visualizaciones**:

**V1.** Gráfico de barras: **Top 10 plataformas por ventas totales globales**.

> *Tipo de gráfico elegido y configuración:*
>

**V2.** Gráfico de líneas: **Evolución de ventas globales por año** (serie temporal).

> *Tipo de gráfico elegido y configuración:*
>

**V3.** Gráfico de barras apiladas o agrupadas: **Ventas por región geográfica** (NA, EU, JP, Other) **para los 5 géneros con más ventas**.

> *Tipo de gráfico elegido y configuración:*
>

**V4.** Gráfico de tu elección que responda a: **¿Qué publishers dominan el mercado?** (Top 10 publishers por ventas totales).

> *Tipo de gráfico elegido y justificación:*
>

---

### Fase 4 — Interpretación (15%)

Mirando tu dashboard, responde:

**I1.** ¿Cuál es la plataforma con mayores ventas globales y en qué región geográfica concentra su fuerza?

> *Respuesta:*
>

**I2.** ¿Se observa alguna tendencia o patrón en la evolución temporal de ventas? ¿Hay algún periodo de crecimiento o caída notable?

> *Respuesta:*
>

**I3.** ¿Qué género domina en Japón frente a Norteamérica? ¿Hay diferencias significativas?

> *Respuesta:*
>

**I4.** Un directivo te pregunta: "¿Deberíamos centrarnos en el mercado japonés?" ¿Qué le responderías basándote en los datos?

> *Respuesta:*
>

---

## PARTE TEÓRICA (40%)

**PT1.** Explica qué es un **mapa coroplético**, para qué tipo de datos es adecuado y pon un ejemplo de uso empresarial. ¿Por qué se recomienda representar ratios en vez de valores absolutos?

> *Respuesta:*
>

**PT2.** Diferencia entre **PCA** y **t-SNE**: ¿cuándo usarías cada uno? Indica si son técnicas lineales o no lineales.

> *Respuesta:*
>

**PT3.** En Power Automate, ¿cuáles son los 3 componentes clave de un flujo de automatización? Pon un ejemplo aplicado a un escenario de negocio.

> *Respuesta:*
>

**PT4.** ¿Qué diferencia hay entre **Power BI Desktop** y **Power BI Service**? ¿Cuál necesitas para automatizar y publicar?

> *Respuesta:*
>

**PT5.** Nombra **2 errores comunes** en proyectos de Business Intelligence según lo visto en clase y explica por qué son problemáticos.

> *Respuesta:*
>

---

## EVALUACIÓN (uso interno del corrector)

| Sección | Peso | Nota | Comentarios |
|---------|------|------|-------------|
| Fase 1 — Pre-análisis | 10% | | |
| Fase 2 — ETL | 20% | | |
| Fase 3 — Dashboard | 15% | | |
| Fase 4 — Interpretación | 15% | | |
| Parte Teórica | 40% | | |
| **TOTAL** | **100%** | | |
