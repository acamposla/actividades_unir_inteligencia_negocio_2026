# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Proyecto

Repositorio de estudio para la asignatura **"Estrategia y Gestión Empresarial Basada en Análisis de Datos"** del Máster BI en UNIR. No contiene código ejecutable.

**Objetivo**: Preparar el examen final mediante simulacros realistas que el usuario redacta y Claude corrige/explica. El ciclo es: simulacro -> corrección detallada -> identificación de lagunas -> refuerzo dirigido.

## Modo de interacción

**Modo por defecto: modo-estudio.** Este es un proyecto académico de consolidación de conocimientos.

Skills prioritarios: `modo-estudio`, `active-recall`, `generador-ejercicios`.

## Estructura

```
Resumenes/          # Resúmenes de estudio (Markdown)
Transcripciones/    # Transcripciones de sesiones (.txt) + presentaciones (.pdf)
Actividades/        # Actividades de evaluación continua (.docx) + datasets
Simulacros/
  simulacro_01.md                         # Simulacro 01 (enunciado + respuesta + corrección)
  ejercicio_BEP_01.csv                    # BEP básico con datos genéricos (completado y corregido)
  ejercicio_BEP_01.xls                    # Rehecho por el alumno con datos propios (completado)
  ejercicio_BEP_02_matriz_escenarios.csv  # Matriz de escenarios nivel 2, dos ofertas (en asimilación)
  Ejercicio_BEP_02_Matrix_escenarios.xlsx # Versión Excel del ejercicio de matriz de escenarios
explicacion-examen.md  # Formato y logística del examen final
```

## Contexto del examen

- **Formato**: 2 ejercicios de desarrollo/análisis (NO tipo test), 120 minutos, espacio limitado (~1 cara por ejercicio).
- **Sin código**: No se programa. Se pide **interpretar** outputs (árboles de decisión, clusters, matrices de confusión, correlaciones).
- **Sin material**: Examen a libro cerrado.
- **Fuente de preguntas**: Sección "Ideas Clave" de los temas.

## Bloques temáticos (4 pilares)

1. **Estrategia y Negocio**: HIPPO vs Data-Driven, Customer Centricity, KPIs SMART, ciclo de vida del cliente, BEP (Break Even Point) de promociones.
2. **Gobierno del Dato y Ética**: RGPD, principios de protección de datos, caso Cambridge Analytica, Business Compliance, tipos de datos personales.
3. **Infraestructura BI**: ETL (Extract-Transform-Load), Data Warehouse, modelos Estrella vs Copo de Nieve, Golden Record, 5 elementos del BI (procesos, tecnología, herramientas, personas, capacidades).
4. **Interpretación Analítica**: Clustering (K-Means, no supervisado), Árboles de Decisión (supervisado), Regresión Logística (P-valor), Series Temporales (ARIMA), correlación vs causalidad.

## Actividades de evaluación continua

Referencia para entender el nivel y estilo que espera el profesor:
- **Actividad 1**: Caso práctico con dataset Airbnb NYC (análisis de negocio, HIPPO vs Data-Driven).
- **Actividad 2**: Ética y RGPD (análisis de casos legales).
- **Actividad 3**: Estrategia empresarial aplicada.

## Flujo de simulacros de examen

1. Claude genera un enunciado realista (2 ejercicios, estilo del profesor) basado en los bloques temáticos y el formato descrito en `explicacion-examen.md`.
2. El usuario redacta su respuesta (sin consultar material).
3. Claude corrige con criterio del profesor: relación de conceptos, interpretación analítica, síntesis, ortografía.
4. Se guarda en `Simulacros/` como `simulacro_XX.md` (enunciado + respuesta + corrección + nota orientativa).

## Aplicación profesional

Lo aprendido en esta asignatura (BEP, customer centricity, ciclo intelligence-action, segmentación, KPIs SMART) se aplica profesionalmente en:

**`~/Proyectos/IMPREX/analitica-comercial/`** — Sistema de inteligencia comercial para Imprex (B2B FMCG). Combina el marco teórico de esta asignatura con la implementación técnica en R de la asignatura hermana (`Estudiar_R`). Los frameworks metodológicos están en `docs/metodologia/`:
- `framework-bep.md` — BEP, matrices de escenarios, threshold (de esta asignatura)
- `framework-segmentacion.md` — Clustering + ciclo de vida del cliente
- `framework-scoring.md` — Árboles, logit, del score a la acción comercial

Cuando el alumno aprende un concepto aquí, puede aplicarlo con datos reales allí.

---

## Estado actual del estudio

**Fecha de última actualización**: 2026-02-18

### Simulacros
- **Simulacro 01**: Completado. Todos los apartados respondidos y corregidos (enunciado + respuesta + corrección + respuesta modelo). Nota global: ~5,5/10.

### Laguna identificada y trabajada: BEP de promociones
Se detectó que el alumno no dominaba el cálculo de BEP en el contexto de promociones. Se trabajó en profundidad con tres ejercicios prácticos:

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `ejercicio_BEP_01.csv` | BEP básico con datos genéricos | Completado y corregido |
| `ejercicio_BEP_01.xls` | Rehecho por el alumno con datos propios | Completado |
| `ejercicio_BEP_02_matriz_escenarios.csv` | Matriz de escenarios nivel 2, dos ofertas | Estudiado, en asimilación |

### Lo que el alumno ya domina (BEP)
- Cálculo de margen destruido por la promoción.
- BEP en clientes nuevos necesarios para cubrir el coste.
- BEP en incremento de ticket medio necesario.
- Fórmula y lógica de la matriz de escenarios.

### Lo que necesita más práctica
- Construir matrices completas de escenarios en Excel desde cero.
- Aplicar el análisis BEP a datos reales de negocio.
- Diferenciar con precisión entre incremento de facturación e incremento de margen.

### Lagunas identificadas en Simulacro 01 (pendientes de trabajar)
1. **Árbol de decisión vs Regresión logística**: Confundió árbol con modelo logit. Dominar "engañar al ordenador".
2. **RGPD**: Solo identificó 1 principio de 4 en un caso. Repasar: limitación finalidad, minimización, transparencia, consentimiento.
3. **Citar datos numéricos**: Cuando interpreta una tabla, incluir los números concretos como evidencia.
4. **Respuestas completas**: Si la pregunta tiene 3 partes, responder las 3.
5. **Ortografía**: grave/grabe, dirigidos/dirijidos, obtenidos/opténidos, asiduidad/asuidad.

---

## Conceptos clave trabajados — BEP de promociones

Referencia rápida para el examen. Estos son los principios que hay que poder explicar y aplicar:

1. **Toda promoción es destrucción voluntaria de margen** para compensar con mayor volumen.
2. **BEP = punto donde `Margen Incremental - Coste Promoción >= 0`**.
3. **Dos palancas del BEP**:
   - **Respuesta (r)**: tasa de conversión — cuántos clientes responden a la oferta.
   - **Gasto (g)**: ticket medio — cuánto más gastan por cliente convertido.
4. **Fórmula de la matriz de escenarios**: `Margen Neto = N × r × (Margen × g - Coste_oferta)`
   - Donde N = tamaño del segmento objetivo.
5. **La exigencia (threshold) minimiza el coste de dilución**: evita regalar descuentos a clientes que habrían comprado igual (respuesta espontánea).
6. **BEP por oferta** = `Coste_oferta / Margen_por_cliente`
7. **Más respuesta amplifica en ambos sentidos**: si la oferta es rentable, escala bien; si no lo es, pierde más.
8. **La segmentación previa es imprescindible**: el BEP es distinto por segmento (distinto margen, distinto comportamiento de compra).

---

## Cómo ayudar en este proyecto

- Priorizar comprensión relacional de conceptos sobre memorización de definiciones.
- Para repasos, usar active-recall forzando reconstrucción desde memoria.
- En ejercicios de interpretación, simular outputs reales (tablas de medias de clusters, árboles, matrices de confusión) y pedir análisis en rol de analista.
- Valorar síntesis: las respuestas de examen deben ser concisas y estructuradas (esquemas > párrafos largos).
- Las actividades en `Actividades/` sirven como referencia del nivel esperado.
