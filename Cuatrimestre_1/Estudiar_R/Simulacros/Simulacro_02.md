# SIMULACRO DE EXAMEN 02 — Datasets reales del examen

## Análisis de Datos Masivos para el Negocio

**Duración**: 2 horas
**Material permitido**: RStudio, apuntes, chuleta impresa o Word
**Entrega**: Respuestas en los cuadros de texto + archivo .R adjunto
**Datasets**: `diabetes_dataset.xlsx`

---

**INSTRUCCIONES**: Se te proporciona una base de datos con información clínica de pacientes. Responde a cada pregunta con el código R necesario y una interpretación del resultado. Se evalúa el planteamiento y la interpretación, no solo que el código funcione. Si un código no te funciona, escribe los pasos que seguirías.

**IMPORTANTE**: Adjunta el archivo .R al finalizar.

---

## BASE DE DATOS: diabetes_dataset.xlsx

Contiene datos clínicos de pacientes para determinar si padecen diabetes.

**Descripción de variables**:

- **Pregnancies**: Número de embarazos
- **Glucose**: Concentración de glucosa en sangre (mg/dL)
- **BloodPressure**: Presión arterial diastólica (mm Hg)
- **SkinThickness**: Grosor del pliegue cutáneo del tríceps (mm)
- **Insulin**: Nivel de insulina en sangre (mu U/ml)
- **BMI**: Índice de masa corporal (peso en kg / altura en m^2)
- **DiabetesPedigreeFunction**: Función de pedigrí de diabetes (probabilidad hereditaria)
- **Age**: Edad en años
- **Outcome**: Si el paciente tiene diabetes (Sí/No)

---

### Pregunta 1 — Carga de datos
Carga el dataset `diabetes_dataset.xlsx` en R. ¿Cuántas filas y columnas tiene? Inspecciona la estructura del dataset.

---

### Pregunta 2 — Detección de anomalías
¿Existen celdas vacías (NA) en la base de datos? Indica cuántas hay por columna. ¿Observas alguna columna que no debería estar? En caso afirmativo, elimínala.

---

### Pregunta 3 — Valores sospechosos
Las variables Glucose, BloodPressure, SkinThickness, Insulin y BMI representan mediciones clínicas. ¿Tiene sentido clínico que alguna de ellas tenga valor 0? ¿Cuántos ceros hay en cada una? Limpia el dataset eliminando las filas donde Glucose o BMI valgan 0.

---

### Pregunta 4 — Frecuencias
¿Cuántos pacientes tienen diabetes y cuántos no? ¿Qué porcentaje de pacientes tiene diabetes?

---

### Pregunta 5 — Filtrado
¿Cuántos pacientes mayores de 50 años tienen diabetes? ¿Qué porcentaje representan sobre el total de pacientes mayores de 50?

---

### Pregunta 6 — Filtrado y estadístico
¿Cuál es el nivel medio de glucosa de los pacientes que NO tienen diabetes? ¿Y el de los que SÍ tienen? Compara e interpreta el resultado.

---

### Pregunta 7 — Filtrado combinado
¿Cuántos pacientes con BMI mayor de 30 y Glucose mayor de 140 tienen diabetes?

---

### Pregunta 8 — Correlación
¿Entre qué variables numéricas existe mayor correlación? ¿Consideras dicha correlación fuerte? Razona la respuesta.

---

### Pregunta 9 — Crear variable
Crea una nueva variable llamada `diabetes_num` que asigne un 1 a los pacientes que SÍ tienen diabetes y un 0 a los que NO. Esta variable la usarás como variable dependiente en los modelos.

---

### Pregunta 10 — Regresión logística
Divida el dataset en 80% entrenamiento y 20% testeo. Realice una regresión logística utilizando como variable dependiente `diabetes_num` y como variables independientes Glucose, BloodPressure, BMI, Age y DiabetesPedigreeFunction (NO incluya Pregnancies, SkinThickness ni Insulin). ¿Qué variables son estadísticamente significativas?

---

### Pregunta 11 — Interpretación del modelo
Según los coeficientes del modelo logístico, ¿cuánto aumentan las odds de tener diabetes si la glucosa aumenta en 10 unidades? Ayuda: use `exp(coef())`.

---

### Pregunta 12 — Predicción individual
Con el modelo de regresión logística, determine la probabilidad de tener diabetes de un paciente con las siguientes características: Glucose = 150, BloodPressure = 80, BMI = 33, Age = 45, DiabetesPedigreeFunction = 0.5. ¿Le diagnosticarías diabetes?

---

### Pregunta 13 — Matriz de confusión (glm)
Calcule la matriz de confusión del modelo logístico sobre los datos de test. ¿Cuál es el Accuracy? ¿Y la Sensitivity? En un contexto médico, ¿qué es más importante, la Sensitivity o la Specificity? Justifique.

---

### Pregunta 14 — Árbol de decisión
Con las mismas variables del modelo logístico, estime un árbol de decisión. Dibuje el árbol. ¿Cuál es la variable más importante? Describa el perfil del nodo con mayor probabilidad de diabetes.

---

### Pregunta 15 — Comparación de modelos
Calcule la matriz de confusión del árbol de decisión. Compare el Accuracy y la Sensitivity de ambos modelos. ¿Cuál recomendaría al hospital? Justifique.

---

### Pregunta 16 — Clustering
Seleccione las variables numéricas del dataset. Escale los datos con `scale()`. Determine el número óptimo de clusters usando NbClust (si se cuelga, use el método del codo). Ejecute kmeans con el número óptimo. Muestre los centros de cada grupo e interprete los perfiles en lenguaje de negocio (como si le explicara al director del hospital qué tipo de pacientes tiene).

---

## RESUMEN

| Bloque | Preguntas | Peso |
|--------|-----------|------|
| Exploración y limpieza | 1, 2, 3 | Puntos fáciles |
| Frecuencias y filtros | 4, 5, 6, 7 | Puntos fáciles |
| Correlación | 8 | Medio |
| Crear variable | 9 | Fácil |
| Regresión logística | 10, 11, 12, 13 | Núcleo del examen |
| Árbol de decisión | 14, 15 | Núcleo del examen |
| Clustering | 16 | Núcleo del examen |

**Recordatorio**: Cada bloque es independiente. Si fallas en regresión, sigue con el árbol y el clustering. Se corrige por planteamiento.
