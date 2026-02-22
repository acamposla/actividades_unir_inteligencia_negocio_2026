# SIMULACRO 03 — Solo Modelos (Logit + Árbol + Clustering)

## Análisis de Datos Masivos para el Negocio

**Duración estimada**: 1 hora
**Dataset**: `clientes_marketing.csv`
**Objetivo**: Practicar exclusivamente el bloque de modelos (el núcleo del examen)

---

**INSTRUCCIONES**: El dataset ya está cargado y limpio. Se te proporciona el código de carga. Céntrate en los modelos, las predicciones, las matrices de confusión y la interpretación.

---

## Código de carga (copiar directamente)

```r
library(dplyr)
library(caret)
library(rpart)
library(rpart.plot)

datos <- read.csv("datasets/clientes_marketing.csv")

# Variable objetivo: convertir respondio_campaña a numérica
datos$respondio_num <- ifelse(datos$respondio_campaña == "Sí", 1, 0)
```

## Variables disponibles

- **edad**: Edad del cliente
- **genero**: Masculino / Femenino
- **educacion**: Secundaria / Universitaria / Posgrado
- **ingreso_mensual**: Ingreso mensual en USD
- **usa_tarjeta_credito**: Sí / No
- **visitas_web**: Número de visitas al sitio web
- **compras_previas**: Número de compras anteriores
- **respondio_campaña**: Si respondió a la campaña de marketing (Sí/No) — **variable objetivo**
- **respondio_num**: 1 si respondió, 0 si no (creada en la carga)

---

### Pregunta 1 — Train/Test split

Divide el dataset en 80% entrenamiento y 20% testeo usando `createDataPartition` sobre `respondio_num`. Usa `set.seed(123)`. ¿Cuántas filas tiene cada conjunto?

---

### Pregunta 2 — Regresión logística

Realiza una regresión logística con `respondio_num` como variable dependiente. Usa como variables independientes: `ingreso_mensual`, `usa_tarjeta_credito`, `visitas_web` y `compras_previas` (NO incluyas edad, genero ni educacion). ¿Qué variables son estadísticamente significativas? Indica el nivel de significancia de cada una.

---

### Pregunta 3 — Odds ratio (exp(coef))

Según el modelo logístico:
a) ¿Cuánto se multiplican las odds de responder a la campaña si el ingreso mensual aumenta en 100 dólares?
b) ¿Cuánto se multiplican las odds si el cliente usa tarjeta de crédito frente a no usarla?

Interpreta ambos resultados en lenguaje de negocio.

---

### Pregunta 4 — Predicción individual

Con el modelo logístico, determina la probabilidad de responder a la campaña de un cliente con: ingreso_mensual = 2500, usa_tarjeta_credito = "Sí", visitas_web = 6, compras_previas = 4. ¿Le incluirías en la campaña?

---

### Pregunta 5 — Matriz de confusión (glm)

Calcula la matriz de confusión del modelo logístico sobre los datos de test. Reporta:
- Accuracy
- Sensitivity
- Specificity

En este contexto de marketing, ¿qué es más importante, la Sensitivity o la Specificity? Justifica (piensa en el coste de cada tipo de error).

---

### Pregunta 6 — Árbol de decisión

Con las mismas variables independientes, estima un árbol de decisión. Dibuja el árbol. ¿Cuál es la variable más importante según `variable.importance`? Describe el perfil del nodo con mayor probabilidad de responder a la campaña.

---

### Pregunta 7 — Matriz de confusión (rpart)

Calcula la matriz de confusión del árbol sobre los datos de test. Compara Accuracy y Sensitivity con el modelo logístico. ¿Cuál recomendarías al director de marketing? Justifica.

**Recuerda**: rpart con `type = "class"` → NO necesita ifelse.

---

### Pregunta 8 — Clustering (preparación)

Selecciona solo las variables numéricas del dataset (sin `respondio_num`). Escala los datos con `scale()`. Determina el número óptimo de clusters con NbClust (si se cuelga, usa el método del codo). ¿Cuántos clusters recomienda?

---

### Pregunta 9 — Clustering (ejecución e interpretación)

Ejecuta kmeans con el número óptimo de clusters. Interpreta los resultados usando UNA de estas técnicas (o ambas):

a) **Tabla de medias**: `aggregate(. ~ cluster, data = datos_num, FUN = mean)` — ¿qué caracteriza a cada grupo?

b) **Árbol interpretativo**: Usa rpart con el cluster como variable dependiente (`method = "class"`, SIN train/test). ¿Qué reglas definen cada cluster?

Narra los perfiles como si se lo explicaras al director de marketing: "El grupo 1 son clientes que... por lo tanto deberíamos..."

---

## RESUMEN

| Bloque | Preguntas | Qué practica |
|--------|-----------|-------------|
| Split + Logit | 1, 2 | createDataPartition, glm, significancia |
| Interpretación logit | 3, 4 | exp(coef) para N unidades, predict individual |
| Evaluación logit | 5 | confusionMatrix, Sensitivity vs Specificity |
| Árbol | 6, 7 | rpart, type="class", comparar modelos |
| Clustering | 8, 9 | scale, NbClust, kmeans, aggregate, árbol interpretativo |

**Trampas a evitar**:
- glm: `type = "response"` + `ifelse(prob >= 0.5, 1, 0)`
- rpart: `type = "class"` (sin ifelse)
- confusionMatrix: `positive = "1"`
- Clustering: `set.seed(123)`, `nstart = 25`, `method = "class"` en el árbol interpretativo
- exp(coef) para N unidades: `exp(coef * N)`, NO `exp(coef) * N`
