# Resumen de Sesión de Estudio - R para Análisis de Datos Masivos

**Fecha**: 1 de febrero de 2026
**Objetivo**: Preparar examen de "Análisis de Datos Masivos" (Profesora Amparo García)

---

## Contexto

- Modo estudio activo (socrático, active recall)
- Enfoque: R base principalmente, con conocimiento de dplyr/ggplot2
- El código vale 50%, la interpretación el otro 50%
- Archivo de práctica: `Estudiar.Rmd`
- Chuleta creada: `Chuleta_R.qmd` (ir actualizando)

---

## Lo que hemos cubierto

### 1. Fundamentos (Active Recall)
- Diferencia vector vs data.frame (vector = un solo tipo, data.frame = tabla)
- Acceso a columnas: `datos$columna`
- Factores: cuándo convertir (categorías, no identificadores)
- Semilla: `set.seed(123)` para reproducibilidad

### 2. Exploración de datos
- `str()`, `summary()`, `dim()`, `nrow()`, `ncol()`
- `unique()` para explorar valores
- Detección de NAs: `colSums(is.na(datos))`, `sum(is.na(datos))`

### 3. Frecuencias
- `table()` para frecuencia absoluta
- `prop.table(table()) * 100` para porcentaje

### 4. Filtrado con subset()
- Sintaxis: `subset(datos, condicion)` (no repetir `datos$` dentro)
- Condiciones: `&` para AND, `|` para OR
- Seleccionar columnas: `select = c(col1, col2)`

### 5. Dataset usado
- Aguacates: `Actividades/Actividad_1/Actividad 1 – Grupo3 - Análisis de datos de aguacate.csv`
- Creamos subset: aguacates orgánicos de Albany

---

## Ejercicio pendiente

Con el subset de aguacates orgánicos de Albany (`aguacates_org`):

1. Calcular desviación estándar del precio: `sd(aguacates_org$average_price)`
2. Calcular correlación precio vs volumen: `cor(aguacates_org$average_price, aguacates_org$total_volume)`
3. **Interpretar**: ¿Correlación positiva o negativa? ¿Qué significa para el negocio?

---

## Próximos temas a cubrir

- [ ] Correlación e interpretación
- [ ] Regresión lineal (`lm()`)
- [ ] Partición train/test (`createDataPartition`)
- [ ] Árboles de decisión (`rpart`)
- [ ] Matriz de confusión
- [ ] Clustering
- [ ] Series temporales

---

## Archivos relevantes

| Archivo | Descripción |
|---------|-------------|
| `Estudiar.Rmd` | Práctica principal con ejercicios |
| `Chuleta_R.qmd` | Chuleta para el examen (ir actualizando) |
| `Guia_Estudio_2.md` | Resumen del curso |
| `Apuntes_R.pdf` | Apuntes de la profesora |
| `Actividades/` | Actividades resueltas de referencia |
| `datasets/` | Datasets para práctica (diabetes, clientes) |

---

## Para continuar

Decir a Claude:
> "Continuamos la sesión de estudio de R. Lee SESION_ACTUAL.md para contexto. Retomamos con el ejercicio pendiente de correlación."
