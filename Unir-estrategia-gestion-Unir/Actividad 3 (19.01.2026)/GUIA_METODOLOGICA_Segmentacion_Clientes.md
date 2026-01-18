# Guía Metodológica: Segmentación de Clientes y Descubrimiento de Patrones
## Enfoques Analíticos para Encontrar Segmentos de Alto Valor

**Autor:** Alejandro Campos
**Fecha:** Enero 2026
**Contexto:** Recurso de referencia para análisis de segmentación sin dependencia de IA

---

## Índice

1. [Introducción: El Problema de Segmentación](#1-introducción-el-problema-de-segmentación)
2. [Enfoque 1: Análisis Manual (Power BI / Excel)](#2-enfoque-1-análisis-manual-power-bi--excel)
3. [Enfoque 2: Árboles de Decisión](#3-enfoque-2-árboles-de-decisión)
4. [Enfoque 3: Clustering](#4-enfoque-3-clustering)
5. [Enfoque 4: Regresión Logística](#5-enfoque-4-regresión-logística)
6. [Enfoque 5: Association Rules](#6-enfoque-5-association-rules)
7. [Combinación de Enfoques: Recetas Prácticas](#7-combinación-de-enfoques-recetas-prácticas)
8. [Árbol de Decisión Metodológico: ¿Qué Enfoque Usar?](#8-árbol-de-decisión-metodológico-qué-enfoque-usar)
9. [Implementación en Python, R y Power BI](#9-implementación-en-python-r-y-power-bi)
10. [Caso Práctico: AdventureWorks](#10-caso-práctico-adventureworks)

---

## 1. Introducción: El Problema de Segmentación

### 1.1 ¿Qué es la segmentación de clientes?

La segmentación de clientes consiste en dividir una base de clientes en grupos homogéneos que comparten características similares. El objetivo es identificar grupos con comportamientos diferenciados para:

- **Marketing dirigido:** Campañas específicas para cada segmento
- **Personalización:** Ofertas adaptadas a las necesidades de cada grupo
- **Optimización de recursos:** Invertir más en segmentos de mayor valor
- **Predicción:** Anticipar comportamientos futuros

### 1.2 Dos Paradigmas Fundamentales

Antes de elegir una técnica, debes identificar en qué paradigma estás:

| Paradigma | Pregunta que responde | Tienes variable objetivo | Técnicas |
|-----------|----------------------|--------------------------|----------|
| **Supervisado** | "¿Quién va a comprar/abandonar/convertir?" | SÍ (ej: BikePurchase 0/1) | Árboles, Regresión, Random Forest |
| **No Supervisado** | "¿Qué tipos de clientes tengo?" | NO | Clustering, PCA, Association Rules |

**Clave:** Si tienes una variable objetivo clara (compra, abandono, conversión), usa técnicas supervisadas. Si quieres explorar sin objetivo predefinido, usa técnicas no supervisadas.

### 1.3 El Problema de las Interacciones

El análisis univariante (una variable a la vez) tiene una limitación fundamental: **no detecta interacciones**.

Ejemplo real del caso AdventureWorks:
- Variable "1 hijo" aislada: 60% conversión
- Variable "Pacific" aislada: 60% conversión
- Cruce "Pacific + 1 hijo": 78% conversión

La interacción añade +18 puntos porcentuales que no verías analizando cada variable por separado. Este documento te enseña técnicas que detectan automáticamente estas interacciones.

---

## 2. Enfoque 1: Análisis Manual (Power BI / Excel)

### 2.1 Descripción

El análisis manual consiste en explorar los datos mediante tablas dinámicas, filtros y visualizaciones, cruzando variables y observando patrones.

### 2.2 Cuándo usarlo

- Exploración inicial de los datos
- Datasets pequeños (<10.000 registros)
- Pocas variables categóricas (<5)
- Necesitas resultados rápidos sin programar
- Quieres entender los datos antes de aplicar técnicas avanzadas

### 2.3 Cómo hacerlo en Power BI

**Paso 1: Crear medidas de conversión**
```
Tasa Conversión = DIVIDE(SUM(BikePurchase), COUNT(CustomerID), 0) * 100
Ticket Medio = AVERAGE(TotalAmount)
```

**Paso 2: Crear matriz de cruces**
- Filas: Variable 1 (ej: Group/Región)
- Columnas: Variable 2 (ej: Occupation)
- Valores: Tasa de Conversión

**Paso 3: Añadir segmentadores (slicers)**
- Filtrar por tercera variable (ej: TotalChildren)
- Observar cómo cambia la matriz al filtrar

**Paso 4: Documentar hallazgos**
- Anotar combinaciones con conversión >X%
- Registrar tamaño de cada segmento (N clientes)

### 2.4 Cómo hacerlo en Excel

**Paso 1: Tabla dinámica básica**
- Filas: Región
- Columnas: Ocupación
- Valores: Promedio de BikePurchase (esto te da la tasa)

**Paso 2: Añadir filtros de informe**
- Añadir TotalChildren como filtro
- Ir cambiando el filtro y anotar cómo cambia la matriz

**Paso 3: Crear tabla resumen**
Manualmente crear una tabla con las combinaciones más interesantes:

| Región | Ocupación | Hijos | Tasa Conv. | N Clientes |
|--------|-----------|-------|------------|------------|
| Pacific | Manual | 1 | 97% | 62 |
| Pacific | Clerical | 0 | 92% | 108 |
| ... | ... | ... | ... | ... |

### 2.5 Limitaciones

- **Tedioso:** Con 5 variables y múltiples valores, hay cientos de combinaciones
- **Subjetivo:** Dependes de tu intuición para saber qué cruzar
- **No escalable:** Imposible con muchas variables
- **Sin validación estadística:** No sabes si las diferencias son significativas

### 2.6 Cuándo NO usarlo

- Más de 5 variables categóricas relevantes
- Necesitas automatizar el proceso
- Requieres validación estadística
- El dataset es muy grande

---

## 3. Enfoque 2: Árboles de Decisión

### 3.1 Descripción

Un árbol de decisión es un algoritmo de machine learning supervisado que divide los datos en grupos cada vez más homogéneos respecto a la variable objetivo. Genera reglas del tipo "SI condición ENTONCES resultado".

### 3.2 Por qué es ideal para segmentación

1. **Detecta interacciones automáticamente:** El árbol encuentra que "Pacific + 1 hijo" es mejor que cada variable por separado
2. **Genera reglas interpretables:** Fáciles de explicar a negocio
3. **Prioriza variables:** Te dice qué variable es más importante
4. **Maneja variables mixtas:** Categóricas y numéricas sin problema
5. **No requiere normalización:** A diferencia de otros algoritmos

### 3.3 Cómo funciona (conceptualmente)

El algoritmo:
1. Busca la variable y el punto de corte que mejor separa compradores de no compradores
2. Divide los datos en dos grupos
3. Repite el proceso en cada grupo
4. Para cuando se alcanza un criterio (profundidad máxima, mínimo de observaciones, etc.)

**Ejemplo visual:**
```
                    [Todos los clientes]
                    Tasa conversión: 49%
                    N = 18,484
                           |
              ¿Región = Pacific?
                    /          \
                  SÍ            NO
                  |              |
         [Pacific]          [Otros]
         Conv: 60%          Conv: 45%
         N: 3,591           N: 14,893
              |
      ¿Hijos = 1?
        /      \
       SÍ       NO
       |        |
   [Pacific,   [Pacific,
    1 hijo]    otros hijos]
   Conv: 78%   Conv: 55%
   N: 531      N: 3,060
```

### 3.4 Métricas para evaluar splits

El árbol decide cómo dividir usando métricas de "impureza":

**Gini Index:**
- Mide la probabilidad de clasificar incorrectamente
- Gini = 0 significa grupo puro (todos compradores o todos no compradores)
- Fórmula: Gini = 1 - Σ(pi)²

**Entropía (Information Gain):**
- Mide la "sorpresa" o incertidumbre
- Entropía = 0 significa grupo puro
- Fórmula: Entropía = -Σ(pi × log2(pi))

**En la práctica:** Ambas dan resultados similares. Gini es más común en implementaciones por defecto.

### 3.5 Hiperparámetros importantes

| Parámetro | Qué controla | Recomendación |
|-----------|--------------|---------------|
| `max_depth` | Profundidad máxima del árbol | 3-5 para interpretabilidad, más para precisión |
| `min_samples_split` | Mínimo de muestras para dividir un nodo | 50-100 para evitar overfitting |
| `min_samples_leaf` | Mínimo de muestras en nodo final | 20-50 para segmentos significativos |
| `criterion` | Métrica de impureza | 'gini' o 'entropy' |

### 3.6 Interpretación del output

El árbol te da:
1. **Feature importance:** Ranking de qué variables predicen mejor
2. **Reglas:** Camino desde la raíz hasta cada hoja
3. **Probabilidades:** En cada hoja, % de cada clase

**Ejemplo de regla extraída:**
```
SI Region = 'Pacific'
   Y TotalChildren = 1
   Y Occupation = 'Manual'
ENTONCES probabilidad_compra = 97%
         (62 clientes, 60 compradores)
```

### 3.7 Ventajas y limitaciones

**Ventajas:**
- Muy interpretable (puedes explicarlo a negocio)
- Detecta interacciones no lineales
- No requiere preprocesamiento de datos
- Rápido de entrenar

**Limitaciones:**
- Puede sobreajustar (overfitting) si no se controla
- Sensible a pequeños cambios en los datos
- Genera fronteras de decisión "rectangulares"
- Un solo árbol puede ser inestable

### 3.8 Variantes más robustas

**Random Forest:**
- Entrena múltiples árboles con muestras aleatorias
- Promedia sus predicciones
- Más robusto pero menos interpretable

**Gradient Boosting (XGBoost, LightGBM):**
- Entrena árboles secuencialmente, corrigiendo errores
- Mayor precisión pero caja negra

**Para segmentación:** Un solo árbol con profundidad limitada (3-4) suele ser suficiente y más interpretable.

---

## 4. Enfoque 3: Clustering

### 4.1 Descripción

El clustering es una técnica no supervisada que agrupa observaciones similares entre sí. No necesita variable objetivo: descubre estructura en los datos.

### 4.2 Cuándo usarlo

- **No tienes variable objetivo clara:** No sabes qué predecir
- **Exploración pura:** Quieres descubrir "tipos" de clientes
- **Preprocesamiento:** Crear variable de segmento para usar después
- **Reducción de complejidad:** Pasar de 18,000 clientes a 5 perfiles

### 4.3 Algoritmos principales

#### K-Means

**Cómo funciona:**
1. Elige K centroides iniciales aleatoriamente
2. Asigna cada punto al centroide más cercano
3. Recalcula centroides como media de los puntos asignados
4. Repite hasta convergencia

**Características:**
- Rápido y escalable
- Requiere especificar K (número de clusters)
- Sensible a outliers
- Asume clusters esféricos

**Elegir K:**
- Método del codo (elbow): Graficar inercia vs K, buscar el "codo"
- Silhouette score: Mide cohesión y separación (mayor es mejor)

#### Clustering Jerárquico

**Cómo funciona:**
1. Empieza con cada punto como su propio cluster
2. Une los dos clusters más cercanos
3. Repite hasta tener un solo cluster
4. El dendrograma muestra el proceso

**Características:**
- No requiere especificar K a priori
- Dendrograma ayuda a visualizar estructura
- Más lento que K-means
- Permite diferentes métricas de distancia

#### DBSCAN

**Cómo funciona:**
1. Define "densidad" como puntos en un radio ε
2. Puntos con suficientes vecinos son "core points"
3. Clusters se forman conectando core points cercanos
4. Puntos aislados son "ruido"

**Características:**
- Detecta clusters de forma arbitraria
- Identifica outliers automáticamente
- No requiere especificar K
- Sensible a parámetros ε y min_samples

### 4.4 Preprocesamiento necesario

**Crítico para clustering:**

1. **Normalización/Estandarización:**
   - K-means usa distancias euclidianas
   - Variables en diferentes escalas dominarán
   - Usar StandardScaler o MinMaxScaler

2. **Codificación de categóricas:**
   - One-hot encoding para nominales
   - O usar K-modes para categóricas puras
   - O Gower distance para mixtas

3. **Tratamiento de outliers:**
   - Pueden distorsionar centroides
   - Considerar winsorización o eliminación

### 4.5 Interpretación de clusters

Una vez tienes los clusters, debes **perfilarlos**:

```python
# Añadir etiqueta de cluster al dataframe
df['Cluster'] = modelo.labels_

# Calcular medias por cluster
perfiles = df.groupby('Cluster').mean()

# Calcular distribución de categóricas
df.groupby('Cluster')['Occupation'].value_counts(normalize=True)
```

**Ejemplo de perfil:**
```
Cluster 0 - "El Familiar Deportista":
- 85% en Pacific
- Media de 1.2 hijos
- 70% Skilled Manual
- Ticket medio: 3,200€
- Tasa conversión: 75%

Cluster 1 - "El Profesional Urbano":
- 60% en North America
- Media de 0.3 hijos
- 80% Professional
- Ticket medio: 1,800€
- Tasa conversión: 52%
```

### 4.6 Limitaciones del clustering

- **No optimiza para tu objetivo:** Los clusters pueden no correlacionar con conversión
- **Interpretación subjetiva:** Nombrar y describir clusters es manual
- **Sensible a preprocesamiento:** Resultados cambian según normalización
- **K arbitrario:** El número de clusters es una decisión tuya

### 4.7 Clustering + Variable objetivo (Receta)

**El truco:** Usar clustering como **paso previo**, luego analizar la variable objetivo por cluster.

```python
# 1. Clustering (sin usar BikePurchase)
X = df[['Age', 'TotalChildren', 'Income_encoded', ...]]  # Sin BikePurchase
modelo = KMeans(n_clusters=5)
df['Cluster'] = modelo.fit_predict(X)

# 2. Ahora analizar conversión por cluster
df.groupby('Cluster')['BikePurchase'].mean()
```

Esto te da lo mejor de ambos mundos:
- Clusters basados en características del cliente
- Análisis de qué clusters convierten mejor

---

## 5. Enfoque 4: Regresión Logística

### 5.1 Descripción

La regresión logística modela la probabilidad de un evento binario (compra/no compra) en función de variables predictoras. Es una técnica supervisada.

### 5.2 Cuándo usarla

- Quieres **cuantificar** el impacto de cada variable
- Necesitas **probabilidades** de conversión
- Requieres **validación estadística** (p-values, intervalos de confianza)
- El objetivo es **entender relaciones**, no solo predecir

### 5.3 Cómo funciona

Modela el log-odds de la probabilidad:

```
log(p / (1-p)) = β₀ + β₁X₁ + β₂X₂ + ... + βₙXₙ
```

Donde:
- p = probabilidad de compra
- β₀ = intercepto
- βᵢ = coeficiente de la variable Xᵢ

### 5.4 Interpretación de coeficientes

**Coeficiente positivo:** Aumenta la probabilidad de compra
**Coeficiente negativo:** Disminuye la probabilidad de compra

**Odds Ratio (OR):** e^β
- OR > 1: La variable aumenta las odds de compra
- OR < 1: La variable disminuye las odds de compra
- OR = 1: Sin efecto

**Ejemplo:**
```
Variable: Region_Pacific
Coeficiente: 0.45
Odds Ratio: e^0.45 = 1.57

Interpretación: Estar en Pacific multiplica las odds de compra por 1.57
                (57% más probable que las otras regiones)
```

### 5.5 Validación estadística

La regresión logística te da:

| Métrica | Qué indica |
|---------|------------|
| **p-value** | Si el efecto es estadísticamente significativo (<0.05) |
| **Intervalo de confianza** | Rango probable del verdadero efecto |
| **Pseudo R²** | Qué % de varianza explica el modelo |
| **AIC/BIC** | Para comparar modelos (menor es mejor) |

### 5.6 Limitaciones

- **Asume linealidad:** Relación lineal entre log-odds y predictores
- **No captura interacciones automáticamente:** Debes crearlas manualmente
- **Sensible a multicolinealidad:** Variables correlacionadas entre sí
- **Requiere más preprocesamiento:** Encoding, normalización

### 5.7 Cómo añadir interacciones

Para capturar efectos como "Pacific + 1 hijo":

```python
# Crear variable de interacción manualmente
df['Pacific_x_1hijo'] = (df['Region'] == 'Pacific') & (df['TotalChildren'] == 1)

# Incluir en el modelo
modelo = LogisticRegression()
modelo.fit(df[['Region_Pacific', 'TotalChildren_1', 'Pacific_x_1hijo']], df['BikePurchase'])
```

Esto es tedioso si tienes muchas variables. Por eso los árboles de decisión son mejores para detectar interacciones.

---

## 6. Enfoque 5: Association Rules

### 6.1 Descripción

Las reglas de asociación descubren patrones del tipo "Si A entonces B" en datos transaccionales. Originalmente para market basket analysis ("quienes compran pan también compran leche").

### 6.2 Cuándo usarlas

- Datos transaccionales o de comportamiento
- Quieres descubrir co-ocurrencias
- No tienes variable objetivo específica
- Buscas patrones interpretables

### 6.3 Métricas principales

**Soporte (Support):**
- Frecuencia de la regla en el dataset
- Support(A→B) = P(A y B)

**Confianza (Confidence):**
- Probabilidad de B dado A
- Confidence(A→B) = P(B|A) = P(A y B) / P(A)

**Lift:**
- Cuánto más probable es B cuando ocurre A vs. sin A
- Lift(A→B) = P(B|A) / P(B)
- Lift > 1: Asociación positiva
- Lift = 1: Independientes
- Lift < 1: Asociación negativa

### 6.4 Aplicación a segmentación

Transformar datos de cliente a formato transaccional:

```python
# Cada cliente es una "transacción" con sus características
# Cliente 1: {Pacific, 1_hijo, Clerical, Compró_bici}
# Cliente 2: {Europe, 0_hijos, Professional, No_compró}

from mlxtend.frequent_patterns import apriori, association_rules

# Encontrar itemsets frecuentes
frequent_itemsets = apriori(df_encoded, min_support=0.05)

# Generar reglas
rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1.5)

# Filtrar reglas que terminan en "Compró_bici"
rules[rules['consequents'].apply(lambda x: 'BikePurchase_1' in x)]
```

### 6.5 Ejemplo de output

```
Regla: {Pacific, 1_hijo, Manual} → {BikePurchase_1}
Soporte: 0.003 (0.3% del dataset)
Confianza: 0.97 (97% de este grupo compró)
Lift: 1.96 (casi 2x más probable que la media)
```

### 6.6 Limitaciones

- Genera muchas reglas (necesitas filtrar)
- Requiere discretizar variables continuas
- Computacionalmente costoso con muchas variables
- Puede encontrar patrones espurios

---

## 7. Combinación de Enfoques: Recetas Prácticas

### 7.1 Receta 1: Clustering → Árbol de Decisión

**Cuándo usar:** Quieres segmentos interpretables que también predigan comportamiento.

**Proceso:**

```
Paso 1: Clustering para descubrir tipos de clientes
        (sin usar variable objetivo)
        ↓
Paso 2: Perfilar clusters (características de cada grupo)
        ↓
Paso 3: Analizar variable objetivo por cluster
        (¿qué clusters convierten más?)
        ↓
Paso 4: Árbol de decisión DENTRO de clusters interesantes
        (¿qué sub-segmentos son aún mejores?)
```

**Ejemplo práctico:**

```python
# Paso 1: Clustering
from sklearn.cluster import KMeans
X_cluster = df[['Age', 'TotalChildren', 'Income_encoded', 'Region_encoded']]
kmeans = KMeans(n_clusters=5, random_state=42)
df['Cluster'] = kmeans.fit_predict(X_cluster)

# Paso 2-3: Analizar conversión por cluster
conversion_por_cluster = df.groupby('Cluster').agg({
    'BikePurchase': 'mean',
    'CustomerID': 'count'
}).rename(columns={'BikePurchase': 'Tasa_Conv', 'CustomerID': 'N'})
print(conversion_por_cluster)

# Resultado ejemplo:
# Cluster 2 tiene 72% conversión, N=1,200 → Interesante!
# Cluster 4 tiene 35% conversión, N=3,500 → Menos interesante

# Paso 4: Árbol dentro del cluster interesante
from sklearn.tree import DecisionTreeClassifier
cluster_2 = df[df['Cluster'] == 2]
X_tree = cluster_2[['Occupation_encoded', 'Education_encoded', 'TotalChildren']]
y_tree = cluster_2['BikePurchase']

tree = DecisionTreeClassifier(max_depth=3)
tree.fit(X_tree, y_tree)
# → Encuentra sub-segmentos dentro del cluster de alta conversión
```

**Valor añadido:**
- Clusters dan visión macro (tipos de cliente)
- Árbol da visión micro (reglas específicas dentro de cada tipo)

---

### 7.2 Receta 2: Árbol de Decisión → Validación Estadística

**Cuándo usar:** Has encontrado segmentos con el árbol y quieres validar que las diferencias son reales.

**Proceso:**

```
Paso 1: Árbol de decisión para encontrar segmentos
        ↓
Paso 2: Extraer las reglas/segmentos más prometedores
        ↓
Paso 3: Test estadístico para validar diferencias
        (chi-cuadrado, test de proporciones)
        ↓
Paso 4: Calcular intervalos de confianza
```

**Ejemplo práctico:**

```python
# Paso 1-2: El árbol encontró que Pacific + 1 hijo tiene 78% conversión
segmento = df[(df['Group'] == 'Pacific') & (df['TotalChildren'] == 1)]
resto = df[~((df['Group'] == 'Pacific') & (df['TotalChildren'] == 1))]

# Paso 3: Test chi-cuadrado
from scipy.stats import chi2_contingency
tabla = pd.crosstab(
    df['es_pacific_1hijo'],  # True/False
    df['BikePurchase']       # 0/1
)
chi2, p_value, dof, expected = chi2_contingency(tabla)
print(f"Chi2: {chi2:.2f}, p-value: {p_value:.6f}")
# Si p-value < 0.05, la diferencia es estadísticamente significativa

# Paso 4: Intervalo de confianza para la tasa
from statsmodels.stats.proportion import proportion_confint
conversiones = segmento['BikePurchase'].sum()
n = len(segmento)
ci_low, ci_high = proportion_confint(conversiones, n, alpha=0.05)
print(f"Tasa: {conversiones/n:.1%}, IC 95%: [{ci_low:.1%}, {ci_high:.1%}]")
```

**Valor añadido:**
- Árbol encuentra patrones rápidamente
- Tests estadísticos confirman que no es azar

---

### 7.3 Receta 3: Regresión Logística → Árbol de Decisión

**Cuándo usar:** Quieres entender qué variables importan (regresión) y luego encontrar combinaciones específicas (árbol).

**Proceso:**

```
Paso 1: Regresión logística con todas las variables
        ↓
Paso 2: Identificar variables significativas (p < 0.05)
        ↓
Paso 3: Árbol de decisión solo con variables significativas
        ↓
Paso 4: Comparar importancia en ambos modelos
```

**Ejemplo práctico:**

```python
# Paso 1: Regresión logística
import statsmodels.api as sm
X = df[['Region_Pacific', 'TotalChildren', 'Occupation_Clerical',
        'Education_Bachelors', 'Age', 'HomeOwnerFlag']]
X = sm.add_constant(X)
y = df['BikePurchase']

modelo_log = sm.Logit(y, X).fit()
print(modelo_log.summary())

# Paso 2: Filtrar significativas
# Supongamos que Region_Pacific, TotalChildren y Occupation_Clerical
# tienen p < 0.05

# Paso 3: Árbol solo con esas variables
from sklearn.tree import DecisionTreeClassifier
X_arbol = df[['Region_Pacific', 'TotalChildren', 'Occupation_Clerical']]
arbol = DecisionTreeClassifier(max_depth=4)
arbol.fit(X_arbol, y)

# → La regresión dice QUÉ variables importan
# → El árbol dice CÓMO se combinan
```

**Valor añadido:**
- Regresión reduce dimensionalidad (descarta variables no significativas)
- Árbol encuentra interacciones entre las variables que sí importan

---

### 7.4 Receta 4: Análisis Exploratorio → Clustering → Acción

**Cuándo usar:** No tienes hipótesis previas, quieres descubrir estructura y luego actuar.

**Proceso:**

```
Paso 1: EDA (Exploratory Data Analysis)
        - Distribuciones, correlaciones, outliers
        ↓
Paso 2: Clustering para descubrir tipos de clientes
        ↓
Paso 3: Perfilar cada cluster (quiénes son)
        ↓
Paso 4: Analizar métricas de negocio por cluster
        (conversión, ticket, frecuencia)
        ↓
Paso 5: Definir acciones por cluster
```

**Matriz de acción típica:**

| Cluster | Perfil | Conversión | Acción |
|---------|--------|------------|--------|
| 0 | Jóvenes urbanos sin hijos | 45% | Campaña lifestyle |
| 1 | Familias con hijos | 65% | Campaña familiar |
| 2 | Profesionales senior | 55% | Campaña premium |
| 3 | Bajo engagement | 20% | Reactivación o abandono |

---

### 7.5 Receta 5: Full Pipeline de Segmentación

**El proceso completo para un proyecto real:**

```
FASE 1: ENTENDER
├── 1.1 Definir objetivo de negocio
├── 1.2 Identificar variable objetivo (si existe)
└── 1.3 EDA: calidad de datos, distribuciones, correlaciones

FASE 2: EXPLORAR
├── 2.1 Si hay variable objetivo → Árbol de Decisión rápido
├── 2.2 Si no hay variable objetivo → Clustering
└── 2.3 Análisis manual en Power BI para intuición

FASE 3: MODELAR
├── 3.1 Seleccionar técnica según objetivo
├── 3.2 Entrenar modelo(s)
├── 3.3 Validar resultados (cross-validation, tests estadísticos)
└── 3.4 Iterar: ajustar parámetros, probar combinaciones

FASE 4: INTERPRETAR
├── 4.1 Extraer reglas/segmentos/perfiles
├── 4.2 Validar con negocio (¿tiene sentido?)
├── 4.3 Calcular potencial de cada segmento
└── 4.4 Priorizar segmentos

FASE 5: ACTIVAR
├── 5.1 Definir acciones por segmento
├── 5.2 Diseñar test A/B si es posible
├── 5.3 Implementar campañas
└── 5.4 Medir resultados y retroalimentar
```

---

## 8. Árbol de Decisión Metodológico: ¿Qué Enfoque Usar?

Usa este diagrama para decidir qué técnica aplicar:

```
¿Tienes variable objetivo clara?
(ej: compra sí/no, abandono sí/no)
            │
      ┌─────┴─────┐
      │           │
     SÍ          NO
      │           │
      ▼           ▼
¿Necesitas       Clustering
interpretabilidad? (descubrir tipos)
      │               │
  ┌───┴───┐           │
  │       │           ▼
 SÍ      NO      Perfilar clusters
  │       │      y analizar métricas
  ▼       ▼           │
Árbol   Random        ▼
de      Forest /   ¿Algún cluster
Decisión XGBoost   interesa?
  │       │           │
  │       │      ┌────┴────┐
  │       │      │         │
  ▼       ▼     SÍ        NO
Extraer Usar para │         │
reglas  predicción▼         ▼
  │       │    Árbol     Iterar
  │       │    dentro    clustering
  ▼       │    del       (cambiar K,
¿Quieres  │    cluster   algoritmo)
validar   │
estadíst? │
  │       │
  ▼       │
Test      │
chi²,     │
IC        │
```

**Resumen rápido:**

| Situación | Técnica recomendada |
|-----------|---------------------|
| Predecir quién compra + explicar por qué | Árbol de Decisión |
| Solo predecir (no importa explicar) | Random Forest / XGBoost |
| Descubrir tipos de clientes | Clustering |
| Cuantificar impacto de cada variable | Regresión Logística |
| Encontrar patrones de co-ocurrencia | Association Rules |
| Validar que diferencias son reales | Tests estadísticos |

---

## 9. Implementación en Python, R y Power BI

### 9.1 Python

#### Árbol de Decisión
```python
from sklearn.tree import DecisionTreeClassifier, plot_tree, export_text
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt

# Preparar datos
X = df[['Region_encoded', 'TotalChildren', 'Occupation_encoded', 'Education_encoded']]
y = df['BikePurchase']

# Entrenar
arbol = DecisionTreeClassifier(
    max_depth=4,
    min_samples_split=50,
    min_samples_leaf=25,
    random_state=42
)
arbol.fit(X, y)

# Visualizar
plt.figure(figsize=(20,10))
plot_tree(arbol, feature_names=X.columns, class_names=['No', 'Sí'], filled=True)
plt.savefig('arbol.png', dpi=150, bbox_inches='tight')

# Extraer reglas en texto
reglas = export_text(arbol, feature_names=list(X.columns))
print(reglas)

# Importancia de variables
importancia = pd.DataFrame({
    'Variable': X.columns,
    'Importancia': arbol.feature_importances_
}).sort_values('Importancia', ascending=False)
print(importancia)
```

#### Clustering (K-Means)
```python
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt

# Preparar datos (normalizar)
X = df[['Age', 'TotalChildren', 'Income_numeric', 'NumberCarsOwned']]
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Método del codo para elegir K
inercias = []
for k in range(2, 11):
    kmeans = KMeans(n_clusters=k, random_state=42)
    kmeans.fit(X_scaled)
    inercias.append(kmeans.inertia_)

plt.plot(range(2, 11), inercias, marker='o')
plt.xlabel('Número de clusters (K)')
plt.ylabel('Inercia')
plt.title('Método del Codo')
plt.savefig('elbow.png')

# Entrenar con K elegido
kmeans = KMeans(n_clusters=5, random_state=42)
df['Cluster'] = kmeans.fit_predict(X_scaled)

# Perfilar clusters
perfiles = df.groupby('Cluster').agg({
    'Age': 'mean',
    'TotalChildren': 'mean',
    'TotalAmount': 'mean',
    'BikePurchase': 'mean',
    'CustomerID': 'count'
}).round(2)
print(perfiles)
```

#### Regresión Logística
```python
import statsmodels.api as sm

# Preparar datos
X = df[['Region_Pacific', 'TotalChildren', 'Occupation_Clerical',
        'Education_Bachelors', 'Age']]
X = sm.add_constant(X)  # Añadir intercepto
y = df['BikePurchase']

# Entrenar
modelo = sm.Logit(y, X).fit()

# Ver resultados completos
print(modelo.summary())

# Extraer odds ratios
odds_ratios = np.exp(modelo.params)
print("\nOdds Ratios:")
print(odds_ratios)
```

### 9.2 R

#### Árbol de Decisión
```r
library(rpart)
library(rpart.plot)

# Entrenar árbol
arbol <- rpart(
    BikePurchase ~ Region + TotalChildren + Occupation + Education,
    data = df,
    method = "class",
    control = rpart.control(maxdepth = 4, minsplit = 50, cp = 0.01)
)

# Visualizar
rpart.plot(arbol, type = 4, extra = 104, fallen.leaves = TRUE)

# Extraer reglas
rpart.rules(arbol)

# Importancia de variables
arbol$variable.importance
```

#### Clustering
```r
library(factoextra)
library(cluster)

# Preparar datos
X <- scale(df[, c("Age", "TotalChildren", "Income_numeric", "NumberCarsOwned")])

# Método del codo
fviz_nbclust(X, kmeans, method = "wss") +
    labs(title = "Método del Codo")

# Entrenar
set.seed(42)
kmeans_result <- kmeans(X, centers = 5, nstart = 25)
df$Cluster <- kmeans_result$cluster

# Visualizar clusters (2D con PCA)
fviz_cluster(kmeans_result, data = X)

# Perfilar
aggregate(. ~ Cluster, data = df, FUN = mean)
```

#### Regresión Logística
```r
# Entrenar
modelo <- glm(
    BikePurchase ~ Region + TotalChildren + Occupation + Education + Age,
    data = df,
    family = binomial(link = "logit")
)

# Ver resultados
summary(modelo)

# Odds ratios con intervalos de confianza
exp(cbind(OR = coef(modelo), confint(modelo)))
```

### 9.3 Power BI (DAX y Visualización)

#### Crear segmentos con DAX
```dax
// Crear columna de segmento basada en reglas del árbol
Segmento =
SWITCH(
    TRUE(),
    'Tabla'[Region] = "Pacific" && 'Tabla'[TotalChildren] = 1, "Pacific 1 hijo",
    'Tabla'[Region] = "Pacific" && 'Tabla'[Occupation] = "Manual", "Pacific Manual",
    'Tabla'[Region] = "Europe" && 'Tabla'[Occupation] = "Clerical", "Europe Clerical",
    "Otros"
)
```

#### Medidas de conversión por segmento
```dax
Tasa Conversión =
DIVIDE(
    CALCULATE(COUNTROWS('Tabla'), 'Tabla'[BikePurchase] = 1),
    COUNTROWS('Tabla'),
    0
) * 100

Potencial € =
VAR NoCompradores = CALCULATE(COUNTROWS('Tabla'), 'Tabla'[BikePurchase] = 0)
VAR TasaConv = [Tasa Conversión] / 100
VAR TicketMedio = AVERAGE('Tabla'[TotalAmount])
RETURN NoCompradores * TasaConv * TicketMedio
```

#### Visualización recomendada
1. **Matriz:** Filas = Región, Columnas = Ocupación, Valores = Tasa Conversión
2. **Treemap:** Tamaño = N clientes, Color = Tasa Conversión
3. **Scatter plot:** X = Ticket Medio, Y = Tasa Conversión, Tamaño = N clientes

---

## 10. Caso Práctico: AdventureWorks

### 10.1 Aplicación del Full Pipeline

**Contexto:** Dataset de 18,484 clientes de e-commerce con variable BikePurchase (0/1).

**FASE 1: ENTENDER**
- Objetivo: Encontrar segmentos de alta conversión para campañas
- Variable objetivo: BikePurchase (supervisado)
- EDA: Verificada unicidad CustomerID/PersonID, detectada fragmentación USA

**FASE 2: EXPLORAR**
- Árbol de decisión inicial reveló: Region y TotalChildren son las más importantes
- Análisis manual mostró patrones por región y ocupación

**FASE 3: MODELAR**
- Árbol con max_depth=4 encontró segmentos de >85% conversión
- Validación: segmentos con N>50 para significancia

**FASE 4: INTERPRETAR**

| Segmento | Regla | Conversión | N |
|----------|-------|------------|---|
| Estrella | Pacific + Manual + 1 hijo | 97% | 62 |
| Premium | Pacific + Clerical + 0 hijos | 92% | 108 |
| Alto valor | Pacific + Professional + 2 hijos | 87% | 192 |
| Oportunidad | Europe + Clerical + 0 hijos | 75% | 569 |

**FASE 5: ACTIVAR**
- Acción 1: Campaña "Primera Bici Familiar" → Pacific + 1 hijo
- Acción 2: Targeting Clerical Europa → 246K€ potencial
- Acción 3: Premium Professionals Pacific → 539K€ potencial

### 10.2 Comparación de enfoques en este caso

| Enfoque | Qué encontró | Tiempo | Interpretabilidad |
|---------|--------------|--------|-------------------|
| Manual (Power BI) | Patrones univariantes | 2-3 horas | Alta |
| Árbol de Decisión | Reglas con interacciones | 30 min | Alta |
| Clustering | 5 perfiles de cliente | 1 hora | Media |
| Regresión Logística | Variables significativas | 30 min | Alta (con stats) |
| IA (Claude) | Todo lo anterior | 1 hora | Alta |

**Conclusión del caso:** Para este problema (variable objetivo clara, pocas variables, necesidad de interpretabilidad), el **árbol de decisión** es el enfoque más eficiente.

---

## Anexo: Checklist de Proyecto de Segmentación

```
□ Definir objetivo de negocio claro
□ Identificar si hay variable objetivo
□ EDA: calidad, distribuciones, correlaciones
□ Elegir técnica según objetivo
□ Preprocesar datos (encoding, normalización si aplica)
□ Entrenar modelo con parámetros conservadores
□ Interpretar resultados
□ Validar estadísticamente (si aplica)
□ Calcular potencial de negocio por segmento
□ Priorizar segmentos
□ Definir acciones concretas
□ Documentar metodología y hallazgos
```

---

**Fin del documento**

*Este documento es un recurso vivo. Actualizar con nuevos aprendizajes y casos prácticos.*
