# Estrategia de Evidencias de Uso de IA
## Guía para Maximizar Criterios 1 y 2

---

## Contexto

Los criterios 1 y 2 suman **4 puntos** (40% de la nota) y evalúan específicamente:
- **Criterio 1:** Pensamiento crítico sobre la IA (fortalezas, limitaciones, mejoras)
- **Criterio 2:** Calidad de las preguntas formuladas a la IA

El profesor dijo explícitamente: *"No necesito el prompt, me interesa más el output que habéis conseguido y que me lo expliquéis"*.

---

## Opción Recomendada: Usar ESTA Conversación como Evidencia

Esta sesión de trabajo con Claude Code **ES la evidencia perfecta** porque demuestra:

### Para Criterio 1 (Pensamiento Crítico):
1. ✅ La IA validó cálculos (coeficiente -0,039, ticket medio 3.145€)
2. ✅ La IA detectó errores de interpretación ("concentración en NA" era impreciso)
3. ✅ La IA identificó insights omitidos (Pacific premium, Clerical mejor conversión)
4. ✅ Nosotros aplicamos juicio crítico al descartar sugerencias genéricas

### Para Criterio 2 (Preguntas Estructuradas):
La interacción siguió un proceso estructurado:
1. Carga y exploración del dataset
2. Validación de unicidad de registros
3. Cálculo de correlaciones y regresión
4. Análisis de segmentación multidimensional
5. Cuantificación de oportunidades de negocio

---

## Pantallazos Recomendados

### Pantallazo 1: Validación de Cálculos
**Qué capturar:** La salida donde la IA valida:
```
Coeficiente (slope): -0.0394
Doc dice -0.039, calculado: -0.039 ✓

Ticket medio compradores: 3145.66
Doc dice 3.145,5, calculado: 3145.7 ✓
```

**Por qué es útil:** Demuestra que usamos IA para verificar precisión matemática.

---

### Pantallazo 2: Detección de Imprecisiones
**Qué capturar:** La tabla donde la IA corrige la interpretación geográfica:
```
| Región | % Ventas | Ticket Medio | Tasa Conversión |
|--------|----------|--------------|-----------------|
| North America | 38,7% | 1.211€ | 45% |
| Pacific | 30,9% | 2.523€ | 60% | ← insight clave
```

**Por qué es útil:** Demuestra pensamiento crítico - no aceptamos ciegamente lo que teníamos.

---

### Pantallazo 3: Cuantificación de Acciones
**Qué capturar:** El análisis de potencial de negocio:
```
Potencial de ingresos por segmento:
   Pacific sin bici: 861 clientes × 3.146€ = 2,710,302€
   Clerical sin bici: 721 clientes × 3.146€ = 2,270,664€
   1 hijo sin bici: 868 clientes × 3.146€ = 2,731,063€
```

**Por qué es útil:** Demuestra que la IA ayudó a fundamentar acciones concretas con datos.

---

## Texto para el Documento (Sección 1.1)

Puedes usar este texto en el entregable para describir la interacción:

> **Metodología de trabajo con IA:**
>
> Se utilizó Claude (IA de Anthropic) como herramienta de análisis en un proceso iterativo:
>
> 1. **Exploración inicial:** Se cargó el dataset y se solicitó identificar patrones de segmentación y correlaciones con la variable BikePurchase.
>
> 2. **Validación de cálculos:** Se verificaron los cálculos estadísticos del análisis previo (coeficiente de regresión, ticket medio) confirmando su precisión.
>
> 3. **Auditoría de conclusiones:** Se contrastaron las interpretaciones del documento original contra los datos reales, detectando imprecisiones (ej: la "concentración en Norteamérica" resultó ser una distribución equilibrada donde Pacific tiene mejor rentabilidad por cliente).
>
> 4. **Cuantificación de oportunidades:** Se calculó el potencial de ingresos por segmento para fundamentar las acciones propuestas.

---

## Alternativa: Si Prefieres Usar ChatGPT/Perplexity

Si el equipo prefiere mostrar capturas de otra IA, estas son las preguntas que deberían formular:

```
PROMPT 1 (Exploración):
"Tengo un dataset de e-commerce con 18.484 clientes. Las variables son:
TotalAmount, BikePurchase (0/1), Country, Group (región), Age,
MaritalStatus, YearlyIncome, Gender, TotalChildren, Education,
Occupation, HomeOwnerFlag, NumberCarsOwned.

Analiza qué variables tienen mayor correlación con BikePurchase
y sugiere hipótesis de negocio relevantes."

PROMPT 2 (Validación):
"Calcula el coeficiente de regresión lineal de BikePurchase ~ TotalChildren
y el ticket medio de los clientes que han comprado bicicleta."

PROMPT 3 (Segmentación):
"Analiza la tasa de conversión (BikePurchase) por región (Group),
ocupación y nivel educativo. ¿Qué segmentos tienen mejor rendimiento?"
```

---

## Resumen: Qué Incluir en el Entregable

| Elemento | Dónde va | Criterio que cubre |
|----------|----------|-------------------|
| Descripción de preguntas formuladas | Sección 1.1 | Criterio 2 |
| Output resumido de la IA | Sección 1.1 | Criterio 2 |
| Tabla fortalezas/limitaciones/mejoras | Sección 1.2 | Criterio 1 |
| 1-2 pantallazos de outputs clave | Integrados en texto | Criterios 1 y 2 |
| Nota final sobre validación crítica | Pie de documento | Criterio 1 |

---

## Conclusión

**Mi recomendación:** Usa esta conversación como evidencia principal. Es más auténtica y demuestra un proceso real de análisis crítico, no solo "preguntar y copiar".

Los pantallazos de las tablas de validación y detección de errores son más valiosos que un prompt genérico a ChatGPT, porque muestran **pensamiento crítico aplicado**.
