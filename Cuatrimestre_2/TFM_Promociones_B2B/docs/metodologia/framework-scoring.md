# Framework de Scoring Predictivo

## Principio

El scoring asigna una **probabilidad** a cada cliente de que ocurra un evento de interés (churn, respuesta a promo, compra de categoría nueva). Permite priorizar acciones comerciales: actuar primero sobre los clientes con mayor probabilidad de responder o mayor riesgo de irse.

## Dos modelos clave

### Regresión logística (glm)

- **Tipo**: Supervisado, variable objetivo binaria (Sí/No, 0/1)
- **Output**: Probabilidad entre 0 y 1
- **Interpretación**: Los coeficientes y p-valores indican qué variables influyen. P < 0.05 = significativa.
- **Ventaja**: Interpretable, coeficientes con significado estadístico
- **Uso en Imprex**: Scoring de propensión a responder a una promo, scoring de riesgo de churn

### Árbol de decisión (rpart)

- **Tipo**: Supervisado, clasificación o regresión
- **Output**: Reglas jerárquicas tipo "Si X > umbral Y → clase Z"
- **Interpretación**: Nodo raíz = variable más discriminante. Hojas = probabilidad final.
- **Ventaja**: Genera reglas de negocio directamente accionables
- **Uso en Imprex**: Explicar segmentos (post-clustering), identificar perfiles de clientes rentables

**Son modelos DISTINTOS.** El árbol genera reglas legibles. La regresión logística genera probabilidades con significancia estadística. No son intercambiables.

## Técnica: "Engañar al ordenador"

Usar un modelo **supervisado** (árbol) para explicar el resultado de un modelo **no supervisado** (clusters K-Means).

```
Clustering (no supervisado) → genera grupos
Árbol de decisión (supervisado) → usa el grupo como variable objetivo → genera reglas
```

Resultado: reglas legibles que el equipo comercial puede aplicar sin ejecutar modelos.

## Implementación en R

### Regresión logística — Scoring de propensión

```r
library(caret)

# Variable objetivo: respondio_promo (1/0) de una campaña anterior
# Dividir en train/test
set.seed(123)
idx <- createDataPartition(datos$respondio_promo, p = 0.8, list = FALSE)
train <- datos[idx, ]
test  <- datos[-idx, ]

# Entrenar modelo
modelo_logit <- glm(respondio_promo ~ volumen + frecuencia + n_categorias + ticket_medio,
                    data = train, family = "binomial")
summary(modelo_logit)  # Ver p-valores: ¿qué variables son significativas?

# Predecir probabilidades
test$score <- predict(modelo_logit, test, type = "response")

# Clasificar con umbral 0.5
test$prediccion <- ifelse(test$score > 0.5, 1, 0)
test$prediccion <- as.factor(test$prediccion)
test$respondio_promo <- as.factor(test$respondio_promo)

# Evaluar
confusionMatrix(test$prediccion, test$respondio_promo)
```

### Árbol de decisión — Reglas de negocio

```r
library(rpart)
library(rpart.plot)

# Entrenar árbol
arbol <- rpart(respondio_promo ~ volumen + frecuencia + n_categorias + ticket_medio,
               data = train, method = "class")

# Visualizar reglas
rpart.plot(arbol)

# Predecir (devuelve clases directamente, no necesita round())
test$pred_arbol <- predict(arbol, test, type = "class")

# Evaluar
confusionMatrix(test$pred_arbol, test$respondio_promo)
```

### Comparar modelos

```r
# Accuracy de cada modelo
acc_logit  <- confusionMatrix(test$prediccion, test$respondio_promo)$overall["Accuracy"]
acc_arbol  <- confusionMatrix(test$pred_arbol, test$respondio_promo)$overall["Accuracy"]

cat("Logit:", acc_logit, "\n")
cat("Árbol:", acc_arbol, "\n")

# No solo mirar accuracy: revisar sensibilidad y especificidad
# En contexto comercial, un falso negativo (no ofrecer a quien habría respondido)
# tiene un coste de oportunidad distinto a un falso positivo (gastar promo en quien no responde)
```

## Matriz de confusión — Interpretación de negocio

|  | Predicho: Responde | Predicho: No responde |
|--|--------------------|-----------------------|
| **Real: Responde** | Verdadero Positivo (bien) | Falso Negativo (oportunidad perdida) |
| **Real: No responde** | Falso Positivo (coste desperdiciado) | Verdadero Negativo (bien) |

En promociones, el coste del Falso Positivo = coste de la oferta sin retorno. El coste del Falso Negativo = margen que no capturaste.

## Del score a la acción comercial

1. Calcular score para todos los clientes del segmento
2. Ordenar de mayor a menor probabilidad
3. Aplicar oferta solo a clientes con score > umbral (el umbral depende del BEP)
4. El umbral óptimo es donde: `P(respuesta) × Margen_incremental > Coste_oferta`

Esto conecta directamente con el **framework BEP**: el score refinaapor quién recibe la oferta, el BEP define cuánto puedes gastar.

## Trampas técnicas (de la asignatura de R)

1. `glm()` devuelve decimales → necesita `round()` o `ifelse()` antes de `confusionMatrix()`
2. `rpart()` con `method="class"` devuelve clases directamente (no necesita round)
3. `confusionMatrix()` requiere factores en ambos argumentos
4. Correlación ≠ causalidad: que una variable sea significativa en el modelo no prueba que cause el evento

## Origen

- Teoría: Asignatura Estrategia y Gestión Empresarial (UNIR) — interpretación de modelos, ciclo intelligence-action
- Técnica R: Asignatura Análisis de Datos Masivos (UNIR) — implementación glm, rpart, caret
- Aplicación: Datos reales de Imprex
