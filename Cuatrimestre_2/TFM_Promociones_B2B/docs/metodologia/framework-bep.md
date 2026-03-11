# Framework BEP — Break Even Point de Promociones

## Principio fundamental

Toda promoción es una **destrucción voluntaria de margen** con la esperanza de compensarlo con mayor volumen. El BEP es el punto donde el margen incremental generado por la promoción iguala su coste.

## Fórmula fundamental

```
Margen Neto de la Acción = Margen Incremental - Coste de la Promoción
BEP → Margen Neto = 0
```

## Fórmula matricial (forma canónica)

```
Margen Neto = N × r × (Margen_unitario × g - Coste_oferta)

Donde:
  N              = nº clientes del segmento objetivo
  r              = tasa de respuesta (% clientes que cambian comportamiento)
  g              = incremento de gasto en FACTURACIÓN (no en margen)
  Margen_unitario = margen habitual del segmento (€ por cliente)
  Coste_oferta   = coste real de la promo por cliente que responde

BEP (%) = Coste_oferta / Margen_unitario
```

**Clave**: `g` es incremento en facturación. El margen es consecuencia (% del extra facturado).

## Las dos palancas

| Palanca | Significado | Métrica |
|---------|-------------|---------|
| **Respuesta (r)** | Que compren más clientes | Tasa de conversión / Nº clientes activos |
| **Gasto (g)** | Que cada cliente gaste más | Ticket medio / Valor de pedido |

Más respuesta **amplifica en ambos sentidos**: si la oferta es rentable, escala; si no lo es, las pérdidas crecen.

## Matriz de escenarios

Se cruzan distintos % de incremento de respuesta (r) con distintos % de incremento de gasto (g). Cada celda = `N × r × (Margen × g - Coste_oferta)`.

- Columna donde el valor es 0 = **BEP**
- A la izquierda del BEP: pierdes
- A la derecha: ganas

Se construye una matriz por cada oferta candidata. La oferta que alcanza BEP con incrementos más bajos es más eficiente **a igualdad de respuesta**. Pero una oferta más cara puede ser mejor si genera significativamente más respuesta.

## Regla del threshold (exigencia)

La exigencia debe fijarse **por encima del comportamiento habitual** del segmento para minimizar dilución.

**Dilución** = regalar descuento a clientes que habrían comprado igual (respuesta espontánea).

Proxy práctico: media de los 3 tickets máximos del último trimestre como estimación del potencial real del cliente.

## Conceptos clave

1. **El coste del producto NO cambia con la promo**. Si cuesta 30€, cuesta 30€ vendas a 50 o a 42,50. Lo que cambia es tu margen.
2. **Incremento de facturación ≠ incremento de margen**. Puedes vender más y ganar menos si el coste de la promo supera el margen extra.
3. **El BEP es distinto por segmento** porque cada segmento tiene distinto margen, ticket y frecuencia.
4. **El BEP es distinto por oferta** porque cada oferta tiene distinto coste.

## Proceso completo

1. **Segmentación (periodo n-1)**: Identificar colectivos de interés del periodo anterior.
2. **Parámetros comerciales y escenarios**: Calcular niveles de exigencia por cliente. Simular diferentes ofertas.
3. **Resultados esperados ROI (periodo n)**: Estimar para cada binomio oferta-segmento el incremento necesario en r y g para alcanzar BEP.
4. **Selección del mejor binomio** Oferta-Segmento que aporte mayor contribución/ROI.
5. **Testeo piloto**: Probar con grupo reducido antes de escalar.
6. **Validación post-campaña**: Comparar ventas reales vs estimadas.

## Implementación en R

```r
# Función BEP para una oferta y un segmento
calcular_bep <- function(n_clientes, margen_unitario, coste_oferta, r_vals, g_vals) {
  # r_vals y g_vals son vectores de % (ej: c(0.01, 0.03, 0.05, 0.10))
  matriz <- outer(r_vals, g_vals, function(r, g) {
    n_clientes * r * (margen_unitario * g - coste_oferta)
  })
  rownames(matriz) <- paste0("r=", r_vals * 100, "%")
  colnames(matriz) <- paste0("g=", g_vals * 100, "%")

  list(
    matriz = round(matriz, 2),
    bep_pct = coste_oferta / margen_unitario,
    bep_euros = coste_oferta / margen_unitario * margen_unitario  # = coste_oferta (verificación)
  )
}
```

## Origen

Metodología del profesor Herranz (UNIR, asignatura Estrategia y Gestión Empresarial). Adaptada a contexto B2B de Imprex.
