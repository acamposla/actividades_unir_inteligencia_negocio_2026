201~200~¡Hola! Como tu profesor experto en **Análisis de Datos Masivos**, he analizado exhaustivamente todas las transcripciones de las sesiones. He destilado el contenido eliminando el ruido administrativo para entregarte esta **Guía Maestra de Estudio**.

Esta guía no sigue el orden cronológico de las clases, sino el **flujo lógico de un proyecto de datos**, priorizando lo que será evaluado en el examen (interpretación y programación en R).

---

# 📘 GUÍA MAESTRA DE ESTUDIO: Análisis de Datos con R

## 1. PREPARACIÓN Y LIMPIEZA DE DATOS (El cimiento)

Antes de modelar, debes entender y limpiar los datos. Si los datos son basura, el modelo será basura ("Garbage in, Garbage out").

### Conceptos Clave
*   **Tipos de Variables:**
    *   **Numéricas (`int`, `num`):** Para cálculos matemáticos (medias, correlaciones).
        *   **Factor (`factor`):** Crucial para variables categóricas (texto con opciones limitadas, ej: "Sí/No", "Rojo/Verde"). R asigna un código interno a cada categoría.
        *   **Valores Nulos (`NA`):** Deben tratarse antes de modelar. Opciones: Eliminar la fila (si son pocos datos) o imputar (reemplazar por la media o cero).

        ### Código Recurrente
        ```R
        # Carga de datos
        library(readxl)
        datos <- read_excel("ruta/archivo.xlsx") # Para Excel
        datos <- read.csv("ruta/archivo.csv")    # Para CSV (más estándar)

        # Exploración inicial (¡OBLIGATORIO!)
        dim(datos)      # Dimensiones (filas, columnas)
        str(datos)      # Estructura y tipos de datos
        summary(datos)  # Resumen estadístico (Media, Mediana, Cuantiles)

        # Tratamiento de Nulos
        colSums(is.na(datos))       # Cuenta nulos por columna
        datos_limpios <- na.omit(datos) # Elimina filas con nulos (Recomendado para examen si hay pocos)

        # Conversión a Factor (Vital para Clasificación)
        datos$columna_texto <- as.factor(datos$columna_texto)
        ```

        ---

        ## 2. ANÁLISIS DESCRIPTIVO Y RELACIONAL

        ### Métricas Clave
        *   **Media vs. Mediana:** Si son muy diferentes, indica presencia de **Outliers** (valores anómalos). La mediana es más robusta a outliers.
        *   **Cuantiles:**
            *   *1er Cuantil:* El 25% de los datos es menor o igual a este valor.
                *   *3er Cuantil:* El 75% de los datos es menor o igual a este valor.
                *   **Covarianza:** Indica el **signo** de la relación (positiva o negativa), pero no la fuerza.
                *   **Correlación (Pearson):** Indica **fuerza** y signo. Va de -1 a 1.
                    *   `0`: Independientes.
                        *   `0 a 0.5`: Débil.
                            *   `0.5 a 1`: Fuerte.
                                *   *Nota:* **Correlación no implica causalidad**.

                                ### Código Recurrente
                                ```R
                                # Solo con variables numéricas
                                cor(datos_num) # Matriz de correlación
                                cov(datos_num) # Matriz de covarianza

                                # Selección de numéricas (con dplyr)
                                library(dplyr)
                                datos_num <- select_if(datos, is.numeric)
                                ```

                                ---

                                ## 3. APRENDIZAJE SUPERVISADO (Predicción y Clasificación)

                                **Concepto:** Tienes una columna "objetivo" (solución) y datos históricos. Buscas predecir ese valor. Requiere dividir en **Entrenamiento (Training)** y **Testeo (Test)**.

                                ### A. Regresión Lineal (`lm`)
                                *   **Objetivo:** Predecir un número continuo (ej. Precio, Ventas).
                                *   **Interpretación:**
                                    *   **P-valor (Pr(>|t|)):** Si es **< 0.05**, la variable es **significativa** (importante). Si es mayor, se puede despreciar.
                                        *   **R-cuadrado ($R^2$):** Qué porcentaje de la variabilidad explica el modelo (cerca de 1 es bueno).
                                            *   **Coeficiente:** Cuánto aumenta la variable objetivo si aumenta en 1 la variable explicativa.

                                            ### B. Clasificación (Logística y Árboles)
                                            *   **Objetivo:** Predecir una categoría (Sí/No, 0/1).
                                            *   **Regresión Logística (`glm`):** Solo para 2 categorías (Binomial). Da una probabilidad. Corte habitual en 0.5.
                                            *   **Árboles de Decisión (`rpart`):** Reglas visuales. Sirve para más de 2 categorías.
                                            *   **Validación (Matriz de Confusión):**
                                                *   **Accuracy:** % de aciertos totales.
                                                    *   **Sensibilidad:** Capacidad de detectar Positivos (ej. enfermos).
                                                        *   **Especificidad:** Capacidad de detectar Negativos (ej. sanos).

                                                        ### Código Recurrente
                                                        ```R
                                                        # División Train/Test (Crucial)
                                                        library(caret)
                                                        set.seed(123) # Para reproducibilidad
                                                        indice <- createDataPartition(datos$VariableObjetivo, p=0.8, list=FALSE)
                                                        train <- datos[indice, ]
                                                        test <- datos[-indice, ]

                                                        # Regresión Lineal
                                                        modelo_lm <- lm(Y ~ ., data = train)
                                                        summary(modelo_lm) # Para ver p-valores y R2

                                                        # Regresión Logística
                                                        modelo_glm <- glm(Y ~ ., data = train, family = "binomial")
                                                        prediccion_prob <- predict(modelo_glm, newdata = test, type = "response")
                                                        prediccion_clase <- ifelse(prediccion_prob > 0.5, 1, 0) # Convertir a 0/1

                                                        # Árbol de Decisión
                                                        library(rpart); library(rpart.plot)
                                                        modelo_arbol <- rpart(Y ~ ., data = train, method = "class")
                                                        rpart.plot(modelo_arbol) # Dibujo del árbol

                                                        # Matriz de Confusión
                                                        confusionMatrix(as.factor(prediccion_clase), as.factor(test$Y))
                                                        ```

                                                        ---

                                                        ## 4. APRENDIZAJE NO SUPERVISADO (Agrupación)

                                                        **Concepto:** No hay columna objetivo (no hay solución previa). Buscas patrones o grupos. **NO** se divide en Train/Test.

                                                        ### Clustering (K-Means)
                                                        *   **Objetivo:** Agrupar datos por similitud.
                                                        *   **Elección de K (Número de grupos):**
                                                            *   **Método del Codo:** Donde la curva dobla.
                                                                *   **Función `nbclust`:** Regla de la mayoría (Recomendada).
                                                                *   **Interpretación:** Usar un Árbol de Decisión sobre el resultado del clúster para entender las características de cada grupo (el "truco").

                                                                ### Código Recurrente
                                                                ```R
                                                                library(factoextra); library(NbClust)
                                                                # Calcular número óptimo
                                                                NbClust(datos_num, min.nc=2, max.nc=8, method="kmeans")

                                                                # Ejecutar K-Means
                                                                modelo_km <- kmeans(datos_num, centers = 2) # Si elegimos 2
                                                                datos$cluster <- modelo_km$cluster # Guardar resultado
                                                                ```

                                                                ---

                                                                ## 5. SERIES TEMPORALES

                                                                **Concepto:** Datos ordenados cronológicamente. Importante definir la **frecuencia**.

                                                                ### Componentes y Predicción
                                                                *   **Componentes:** Tendencia, Ciclo, Estacionalidad, Ruido.
                                                                *   **Modelo:** Usamos `auto.arima` para que ajuste automáticamente.
                                                                *   **Predicción:** Usamos `forecast`.

                                                                ### Código Recurrente
                                                                ```R
                                                                library(forecast)
                                                                # Crear objeto serie temporal (ej. mensual frecuencia 12)
                                                                serie <- ts(datos$valor, start=c(2000,1), frequency=12)

                                                                # Modelo y Predicción
                                                                modelo_arima <- auto.arima(serie)
                                                                prediccion <- forecast(modelo_arima, h=12) # Predecir 12 periodos
                                                                plot(prediccion)
                                                                ```

                                                                ---

                                                                ## 📚 LIBRERÍAS ESENCIALES

                                                                | Librería | Función Principal | Contexto de Uso |
                                                                | :--- | :--- | :--- |
                                                                | **`readxl`** | `read_excel` | Leer archivos de Excel (.xlsx). |
                                                                | **`readr`** | `read_csv` | Leer archivos CSV (más rápido y estándar). |
                                                                | **`dplyr`** | `select`, `filter`, `%>%` | Manipulación de datos (filtros, selección, tuberías). |
                                                                | **`caret`** | `createDataPartition`, `confusionMatrix` | Machine Learning: dividir datos y evaluar modelos (matriz de confusión). |
                                                                | **`rpart`** | `rpart` | Crear Árboles de Decisión. |
                                                                | **`rpart.plot`**| `rpart.plot` | Visualizar (dibujar) el árbol de decisión. |
                                                                | **`factoextra`**| `fviz_nbclust` | Visualización para determinar el número de clusters (codo). |
                                                                | **`NbClust`** | `NbClust` | Calcular el número óptimo de clusters por votación/mayoría. |
                                                                | **`forecast`** | `auto.arima`, `forecast` | Series temporales: modelado automático y predicción futura. |
                                                                | **`ggplot2`** | `ggplot` | Gráficos avanzados (dispersión, líneas, etc.). |

                                                                ---

                                                                ## 🔥 PREGUNTAS DE EXAMEN PROBABLES
                                                                *(Basadas en el énfasis repetitivo del profesor durante las sesiones)*

                                                                1.  **Interpretación de Regresión:**
                                                                    *   *"Dado el siguiente `summary`, ¿es significativa la variable precio?"*
                                                                        *   **Respuesta:** Mirar el **p-valor**. Si es < 0.05, SÍ es significativa. Si tiene asteriscos (***), es muy significativa.

                                                                        2.  **Diferencia Supervisado vs. No Supervisado:**
                                                                            *   *"¿Qué algoritmo usarías para segmentar clientes sin conocer grupos previos? ¿Y para predecir si un cliente abandonará (Sí/No)?"*
                                                                                *   **Respuesta:** Segmentar = Clustering (No supervisado). Abandono = Clasificación/Logística (Supervisado).

                                                                                3.  **Matriz de Confusión:**
                                                                                    *   *"Interpreta la Sensibilidad o calcula el Accuracy."*
                                                                                        *   **Respuesta:** Accuracy = (Aciertos / Total). Sensibilidad = Capacidad de detectar positivos (recordar ejemplo Test COVID).

                                                                                        4.  **Elección de K en Clustering:**
                                                                                            *   *"Según la salida de `NbClust`, ¿cuántos grupos deberíamos formar?"*
                                                                                                *   **Respuesta:** Mirar el número que vota la mayoría ("According to the majority rule...").

                                                                                                5.  **Interpretación de Coeficientes:**
                                                                                                    *   *"Si el coeficiente de la variable 'Habitaciones' es 0.5 en una regresión de precio, ¿qué significa?"*
                                                                                                        *   **Respuesta:** Si las habitaciones aumentan en 1 unidad, el precio aumenta en 0.5 unidades (manteniendo el resto constante).

                                                                                                        6.  **Tratamiento de Nulos y Factores:**
                                                                                                            *   *"¿Qué debes hacer antes de lanzar un modelo con variables de texto?"*
                                                                                                                *   **Respuesta:** Convertirlas a `factor` (o numéricas) y tratar los valores nulos (`NA`).
