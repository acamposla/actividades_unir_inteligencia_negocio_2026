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
Simulacros/         # Simulacros de examen (enunciado + respuesta + corrección)
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

## Cómo ayudar en este proyecto

- Priorizar comprensión relacional de conceptos sobre memorización de definiciones.
- Para repasos, usar active-recall forzando reconstrucción desde memoria.
- En ejercicios de interpretación, simular outputs reales (tablas de medias de clusters, árboles, matrices de confusión) y pedir análisis en rol de analista.
- Valorar síntesis: las respuestas de examen deben ser concisas y estructuradas (esquemas > párrafos largos).
- Las actividades en `Actividades/` sirven como referencia del nivel esperado.
