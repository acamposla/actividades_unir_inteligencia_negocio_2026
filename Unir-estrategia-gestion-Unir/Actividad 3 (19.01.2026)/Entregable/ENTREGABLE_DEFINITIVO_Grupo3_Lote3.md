# Análisis Estratégico de Clientes: AdventureWorks
## Grupo 3 – Lote 3
**Integrantes:** Leticia, Alejandro, Iván

---

## 1. Análisis Exploratorio con IA

### 1.1 Metodología de Interacción con IA

Se utilizó IA (Claude/ChatGPT) para realizar el análisis exploratorio inicial del dataset. Las preguntas clave formuladas fueron:

1. *"Analiza el dataset de AdventureWorks e identifica los principales patrones de segmentación de clientes y su relación con la compra de bicicletas"*
2. *"¿Qué variables tienen mayor correlación con la decisión de compra (BikePurchase)?"*
3. *"Propón hipótesis de negocio relevantes para un e-commerce de deportes"*

**Output clave de la IA:** La IA identificó una correlación negativa entre número de hijos (TotalChildren) y compra de bicicletas (r = -0,127), sugiriendo que la carga familiar reduce la propensión al consumo. También recomendó analizar la segmentación geográfica y ocupacional.

### 1.2 Reflexión Crítica sobre el Uso de IA

| Aspecto | Evaluación |
|---------|------------|
| **Fortalezas** | Identificación rápida de correlaciones estadísticas. Cálculo preciso del coeficiente de regresión (-0,039). Automatización del análisis exploratorio inicial. |
| **Limitaciones** | Sugirió hipótesis genéricas (ej: "hombres gastan más que mujeres") que descartamos por falta de profundidad estratégica. No detectó automáticamente el insight de Pacific como mercado premium. |
| **Mejoras aplicadas** | Validamos manualmente cada conclusión de la IA contra los datos. Corregimos interpretaciones sesgadas (ej: "concentración en NA" cuando la distribución es equilibrada). Complementamos con análisis que la IA omitió. |

**Aprendizaje:** La IA es útil como punto de partida, pero requiere validación crítica y complemento humano para insights estratégicos de valor.

---

## 2. KPIs Definidos y Metodología

| KPI | Fórmula | Beneficio para la Toma de Decisiones |
|-----|---------|--------------------------------------|
| **Tasa de Conversión por Segmento** | (Compradores bici / Total clientes) × 100 | Identifica qué segmentos tienen mayor propensión a comprar, priorizando inversión en marketing |
| **Ticket Medio por Región** | Σ TotalAmount / N clientes (por Group) | Detecta mercados premium para estrategias de pricing diferenciado |
| **Índice de Propensión Familiar** | Tasa compra por TotalChildren | Cuantifica el impacto de la estructura familiar en ventas para segmentación |
| **ARPU (Avg Revenue Per User)** | Σ TotalAmount / N clientes únicos | Mide el valor medio por cliente para evaluar rentabilidad |
| **Ratio Conversión/Educación** | Tasa compra por nivel Education | Identifica correlación educación-consumo para targeting en medios |

---

## 3. Análisis del Dashboard e Insights Clave

**[INSERTAR PANTALLAZO DEL DASHBOARD AQUÍ]**

### 3.1 Hallazgos Principales

**Insight 1: Pacific es el mercado premium (no Norteamérica)**

| Región | % Ventas | Ticket Medio | Tasa Conversión |
|--------|----------|--------------|-----------------|
| North America | 38,7% | 1.211€ | 45% |
| **Pacific** | 30,9% | **2.523€** | **60%** |
| Europe | 30,4% | 1.623€ | 50% |

Pacific (Australia) tiene el doble de ticket medio y la mejor conversión. Estratégicamente es el mercado más rentable por cliente.

**Insight 2: El pico de conversión está en familias con 1 hijo**

La relación hijos-compra no es lineal: familias con 1 hijo tienen 60% de conversión (máximo), descendiendo a 31% con 5 hijos. Esto sugiere que el primer hijo activa la compra de bicicletas (posiblemente como actividad familiar).

**Insight 3: Clerical supera a Professional en conversión**

| Ocupación | Tasa Conversión |
|-----------|-----------------|
| Clerical | **56%** |
| Professional | 50% |
| Skilled Manual | 49% |

El segmento Clerical, tradicionalmente ignorado, presenta la mejor conversión.

**Insight 4: La educación predice fuertemente la compra**

Bachelors (56%) y Graduate (53%) duplican la tasa de Partial High School (31%). El nivel educativo es un predictor robusto para segmentación.

---

## 4. Recomendaciones Estratégicas

### Hipótesis Predictiva: La tendencia demográfica impulsará las ventas

Aplicando el coeficiente de regresión (-0,039), una reducción del 10% en la natalidad media generaría +407.335€ en ventas adicionales sin cambio estratégico.

### Acciones Concretas de Negocio

| Acción | Segmento Target | Potencial Estimado |
|--------|-----------------|-------------------|
| **Campaña "Primera Bici Familiar"** | Familias con 1 hijo sin bicicleta (1.447 clientes) | 868 conversiones × 3.146€ = **2,7M€** |
| **Expansión Premium en Pacific** | Clientes Australia sin bici (1.436 clientes) | 861 conversiones × 3.146€ = **2,7M€** |
| **Targeting Clerical + Edu Alta** | Clerical con Bachelors/Graduate sin bici | Segmento de alta conversión (56%) infraexplotado |

**Recomendación prioritaria:** Redirigir el 20% del presupuesto de marketing de Norteamérica a Pacific, donde cada cliente genera el doble de valor con mejor tasa de conversión.

---

*Nota: El análisis fue validado mediante IA para cálculos estadísticos y complementado con revisión crítica manual para garantizar la precisión de las interpretaciones estratégicas.*
