# Análisis de Datos Masivos en R — Máster BI (UNIR)

## Propósito
Sacar un 10 en el examen. Dos misiones en paralelo:
1. **Simulacros de examen**: Practicar con ejercicios realistas hasta que salgan automáticos
2. **Chuleta definitiva**: Construir la mejor referencia posible para llevar al examen

## Modo por defecto: modo-estudio

## Formato del examen (confirmado en clases 14 y 15)
- **Duración**: 2 horas
- **Material permitido**: RStudio + apuntes impresos o Word (NO IA)
- **Entrega**: Respuestas en cuadros de texto del PDF + adjuntar archivo .R
- **Datasets**: 2 archivos (CSV/XLSX) protegidos por contraseña. Vienen en inglés, pocas columnas
- **Preguntas**: 15-20 (muchas cortas + bloques de modelos)
- **Corrección**: Por PLANTEAMIENTO, no por resultado. Si el código falla, escribir los pasos
- **Criterio de suspenso**: Código sin interpretación de negocio = suspenso

## Qué ENTRA seguro (confirmado por la profesora)
| Tema | Probabilidad | Bloque |
|------|-------------|--------|
| Filtros (dplyr/corchetes) | SEGURO | Puntos fáciles |
| table / prop.table | SEGURO | Puntos fáciles |
| Detectar/eliminar nulos | SEGURO | Preparación datos |
| Convertir a factor / ifelse | SEGURO | Preparación datos |
| Regresión logística (glm) | SEGURO | Modelo clasificación |
| Árbol de decisión (rpart) | SEGURO | Modelo clasificación |
| Matriz de confusión | SEGURO | Evaluación modelo |
| Clustering (kmeans + NbClust) | SEGURO | Modelo no supervisado |
| Correlaciones | PROBABLE | Análisis descriptivo |
| Regresión lineal (lm) | PROBABLE | Modelo supervisado |

## Qué NO ENTRA
- Series temporales (confirmado clase 14 y 15: "no entrarían salvo novedad")
- Varianza como pregunta directa (raro)
- Diagramas de cajas (excluido explícitamente)
- Fechas / conversión de fechas

## Datasets del examen (análisis forense)
Los archivos del examen son `diabetes_dataset.zip` y `clientesmarketing.zip`:
- **diabetes** → Pima Indians (99% probabilidad). Trampa: ceros que son nulos
- **clientesmarketing** → Mall Customers (90% probabilidad). Tarea: clustering

## Trampas conocidas de la profesora
1. **glm da decimales, rpart da clases**: glm necesita round() antes de confusionMatrix; rpart con method="class" NO
2. **confusionMatrix necesita factores**: Convertir predicciones y reales a factor
3. **NbClust se cuelga**: Si pasa, usar método del codo. Datasets del examen son pequeños
4. **Clustering solo numéricas**: Seleccionar solo columnas numéricas antes de kmeans
5. **Comillas de Word**: Al copiar de Word, las comillas tipográficas rompen el código
6. **Bloques independientes**: Un fallo en regresión no arrastra al clustering. Seguir adelante
7. **Si no te piden train/test, no lo hagas**: Solo dividir si lo pide el enunciado

## Archivos clave

| Archivo | Descripción | Para qué |
|---------|-------------|----------|
| `Simulacros/` | Carpeta con simulacros de examen | Practicar |
| `Chuleta_R.qmd` | Referencia para llevar al examen | Copiar/pegar en examen |
| `PREGUNTAS_EXAMEN.md` | Preguntas probables recopiladas | Saber qué estudiar |
| `Guia_Estudio_2.md` | Resumen conciso por temas | Repasar conceptos |
| `Guía Maestra de Estudios.md` | Resumen extenso | Consulta profunda |
| `Apuntes_R.pdf` | PDF oficial de la profesora | Referencia de sintaxis |
| `datasets/Posibles_Datasets.md` | Análisis forense de datasets del examen | Preparar trampas |

## Workflow de simulacro
1. Claude presenta el simulacro (enunciado completo)
2. Alumno resuelve en RStudio pregunta a pregunta
3. Claude corrige cada respuesta: código + interpretación
4. Al final: nota estimada + gaps identificados → mejoras a la Chuleta

## Aplicación profesional

Lo aprendido en esta asignatura (EDA, clustering, regresión logística, árboles de decisión) se aplica profesionalmente en:

**`~/Proyectos/IMPREX/analitica-comercial/`** — Sistema de inteligencia comercial para Imprex (B2B FMCG). Combina la implementación técnica de esta asignatura con el marco teórico de la asignatura hermana (`EstrategiaYGestiónEmpresarial`). Los frameworks con código R listo para adaptar están en `docs/metodologia/`:
- `framework-segmentacion.md` — K-Means + NbClust + perfilado con árboles sobre datos SAP
- `framework-scoring.md` — glm + rpart + caret + matriz de confusión aplicados a propensión comercial
- `framework-bep.md` — Función R para calcular BEP y matrices de escenarios

Cuando el alumno aprende una técnica aquí, puede aplicarla con datos reales allí.

---

## Contexto técnico
- Stack: R, RStudio
- Librerías permitidas: readxl, readr, dplyr, ggplot2, caret, rpart, rpart.plot, factoextra, NbClust, forecast
- Regla: R base + estas librerías. No tidyverse completo.
- set.seed(123) SIEMPRE antes de operaciones aleatorias
- Split por defecto: 80/20 si no dicen lo contrario
