# Framework de Segmentación de Clientes

## Principio

El mercado es heterogéneo: diferentes clientes requieren diferente tratamiento. La segmentación previa es **imprescindible** antes de cualquier acción comercial porque el BEP es distinto por segmento.

## Dos contextos de segmentación

### Imprex — B2B (Clustering multivariable)

Los clientes B2B no se segmentan bien con RFM clásico porque la relación es más compleja (múltiples categorías, variación estacional, negociación de precios).

**Variables propuestas para clustering:**

| Variable | Para qué sirve | Fuente SAP | SQL orientativo |
|----------|----------------|------------|-----------------|
| Volumen anual (€) | Tamaño del cliente | Facturación acumulada | `SUM(neto)` por cliente |
| Frecuencia de pedido | Engagement | Nº pedidos / periodo | `COUNT(DISTINCT pedido)` |
| Nº categorías | Profundidad de relación | Líneas distintas | `COUNT(DISTINCT categoria)` |
| Ticket medio | Perfil de compra | Valor medio pedido | `AVG(neto_pedido)` |
| Tendencia | Riesgo de fuga | Comparar periodos | `ratio_periodo_actual / anterior` |
| Margen que deja | Rentabilidad real | Coste vs precio | `SUM(neto - coste)` |

**Nota**: La segmentación actual de Imprex es solo por RAMO (canal SAP: ferretería, bricolaje, etc.). RAMO es una variable administrativa, no de comportamiento. Un clustering sobre variables de comportamiento revelará segmentos transversales a los RAMOs.

### Garza — D2C (RFM desde Shopify)

| Dimensión | Significado | Variable Shopify |
|-----------|-------------|-----------------|
| Recency | Cuándo fue la última compra | Fecha último pedido |
| Frequency | Con qué frecuencia compra | Nº pedidos totales |
| Monetary | Cuánto gasta | Valor acumulado |

RFM es más simple pero suficiente para D2C con compra esporádica.

## Implementación técnica en R

### Paso 1: Preparación de datos

```r
library(dplyr)

# Construir tabla de segmentación desde datos SAP
clientes_seg <- datos_pedidos %>%
  group_by(cliente_id) %>%
  summarise(
    volumen_anual = sum(neto),
    frecuencia = n_distinct(pedido_id),
    n_categorias = n_distinct(categoria),
    ticket_medio = mean(neto_pedido),
    margen_total = sum(neto - coste)
  )

# Escalar variables (imprescindible antes de K-Means)
clientes_scaled <- scale(clientes_seg[, -1])  # Excluir ID
```

### Paso 2: Selección óptima de k

```r
library(NbClust)
library(factoextra)

# Método 1: NbClust (voto mayoritario)
nb <- NbClust(clientes_scaled, min.nc = 2, max.nc = 8, method = "kmeans")

# Método 2: Elbow (backup si NbClust tarda)
fviz_nbclust(clientes_scaled, kmeans, method = "wss")
```

### Paso 3: Clustering K-Means

```r
set.seed(123)
k_optimo <- 4  # Resultado de NbClust
km <- kmeans(clientes_scaled, centers = k_optimo, nstart = 25)

clientes_seg$cluster <- as.factor(km$cluster)
```

### Paso 4: Perfilado de segmentos

```r
# Medias por cluster (en escala original, no escalada)
perfil <- clientes_seg %>%
  group_by(cluster) %>%
  summarise(across(where(is.numeric), mean))

print(perfil)
# Interpretar: poner nombre a cada cluster según su perfil
# Ej: "VIP", "En riesgo", "Nuevos", "Dormidos"
```

### Paso 5: "Engañar al ordenador" — Explicar clusters con árbol

```r
library(rpart)
library(rpart.plot)

# Usar el cluster como variable objetivo (supervisado sobre no supervisado)
arbol_clusters <- rpart(cluster ~ ., data = clientes_seg[, -1], method = "class")
rpart.plot(arbol_clusters)

# Resultado: reglas legibles tipo:
# "Si volumen > 50k€ y frecuencia > 24 pedidos/año → Cluster VIP (92%)"
```

Esto permite que el equipo comercial clasifique clientes sin necesidad de ejecutar el modelo.

## Del segmento a la acción

Cada segmento entra en el **ciclo de vida del cliente** en un punto distinto:

| Fase | Objetivo | Tipo de acción |
|------|----------|----------------|
| **Captación** | Activar nuevos/dormidos | Cross-selling, primera compra incentivada |
| **Desarrollo** | Aumentar valor | Up-selling, ampliar categorías |
| **Retención** | Evitar fuga | Programa fidelización, descuento condicionado |

El BEP se calcula **por separado para cada segmento** porque tienen distinto margen, ticket y frecuencia base.

## Origen

- Teoría: Asignatura Estrategia y Gestión Empresarial (UNIR, prof. Herranz)
- Técnica R: Asignatura Análisis de Datos Masivos (UNIR)
- Aplicación: Datos reales de Imprex (SAP/Oracle)
