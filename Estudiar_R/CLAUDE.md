# Análisis de Datos Masivos en R — Máster BI (UNIR)

## Propósito
Preparar el examen de la asignatura con la máxima calificación posible.

## Modo por defecto: modo-estudio

## Formato del examen
- **50% código R** (se puede usar RStudio con apuntes)
- **50% interpretación** (explicar resultados en lenguaje de negocio)
- Tipos: test + caso práctico en R
- Criterio de la profesora: "El código funciona, pero si no interpretas el porqué, suspendes"

## Progreso por temas

| # | Tema | Peso examen | Estado | Resumen | Transcripciones |
|---|------|-------------|--------|---------|-----------------|
| 1 | Fundamentos R y tipos de datos | Bajo | ✅ | Guia_Estudio_2.md §1 | Clases/1_1*, 2_1* |
| 2 | Limpieza y preparación datos | Medio | ✅ | Guia_Estudio_2.md §1 | Clases/3_1*, 4_1* |
| 3 | Estadística descriptiva y correlación | Medio | ✅ | Guia_Estudio_2.md §2 | Clases/5_1*, 6_1* |
| 4 | Regresión lineal (lm) | Alto (30%) | 🔄 | Guia_Estudio_2.md §3A | Clases/7_1*, 8_1* |
| 5 | Clasificación (glm, rpart) | Alto (20%) | ⬜ | Guia_Estudio_2.md §3B | Clases/9_1*, 10_1* |
| 6 | Clustering (k-means, NbClust) | Alto (20%) | ⬜ | Guia_Estudio_2.md §4 | Clases/11_1*, 12_1* |
| 7 | Series temporales (ARIMA, forecast) | Medio (10%) | ⬜ | Guia_Estudio_2.md §5 | Clases/13_1* |

## Cómo usar los materiales

Para REPASAR un tema:
1. Leer el resumen en `Guia_Estudio_2.md` (sección correspondiente)
2. Si necesito más detalle, leer `Guía Maestra de Estudios.md` (más extenso)
3. Si necesito la cita exacta de la profesora, buscar con Grep en `Clases/`

Para PRACTICAR:
- Usar datasets/ (diabetes.csv, Mall_Customers.csv, bank-additional-full.csv)
- Consultar Actividades/ como referencia de ejercicios resueltos
- Usar skill generador-ejercicios para crear ejercicios nuevos

Para REPASAR antes del examen:
- Usar skill active-recall con los temas marcados como ✅
- Consultar `Chuleta_R.qmd` (referencia de sintaxis permitida en examen)
- Revisar preguntas probables al final de ambas guías de estudio

## Archivos clave

| Archivo | Descripción | Estado |
|---------|-------------|--------|
| `Estudiar.Rmd` | Cuaderno de práctica principal | 🔄 En uso |
| `Chuleta_R.qmd` | Referencia de sintaxis para el examen | ✅ Actualizada |
| `Guia_Estudio_2.md` | Resumen conciso orientado a examen | ✅ Referencia |
| `Guía Maestra de Estudios.md` | Resumen extenso por módulos | ✅ Referencia |
| `SESION_ACTUAL.md` | Estado volátil entre sesiones | 🔄 |
| `Apuntes_R.pdf` | PDF oficial de la profesora Amparo | ✅ Referencia |

## Contexto técnico
- Stack: R, RStudio
- Librerías de la profesora: readxl, readr, dplyr, ggplot2, caret, rpart, rpart.plot, factoextra, NbClust, forecast
- Regla: usar R base + estas librerías. No usar tidyverse completo ni librerías no vistas en clase.

## Checkpoints anti-suspenso (de la profesora)
- Overfitting: SIEMPRE dividir en train/test con createDataPartition. Nunca validar con datos de entrenamiento.
- Ceguera de negocio: si correlación < 0.1, esa variable es ruido. No incluir en el modelo.
- Falsos factores: códigos postales, IDs numéricos → convertir a factor ANTES de modelar.
- Silencio interpretativo: gráfico sin explicación debajo = 0 puntos en la rúbrica.
- set.seed(123): SIEMPRE antes de cualquier operación aleatoria.

## Decisiones tomadas
- Usamos los datasets de la carpeta datasets/ para práctica (posiblemente similares a los del examen).
- La Chuleta_R.qmd es el documento que llevaremos al examen como referencia.
- Estudiar.Rmd es el cuaderno donde practicamos paso a paso cada tema.

## Próximos pasos
- [ ] Completar regresión lineal: interpretar summary(), ecuación, R², predicción
- [ ] Particionar train/test con createDataPartition
- [ ] Clasificación: glm (logística) y rpart (árboles)
- [ ] Matriz de confusión: accuracy, sensibilidad, especificidad
- [ ] Clustering: k-means, NbClust, interpretar centros
- [ ] Series temporales: ts(), auto.arima(), forecast()
- [ ] Simulacro de examen completo
