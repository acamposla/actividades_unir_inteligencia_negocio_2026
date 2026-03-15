# Tablas para copiar al Word (E1)

## Tabla 1. Variables de segmentación a construir

| Variable | Cálculo | Fuente |
|----------|---------|--------|
| Volumen anual (€) | SUM(neto) por cliente | Facturación |
| Frecuencia de pedido | COUNT(DISTINCT pedido) por cliente | Pedidos |
| Nº categorías | COUNT(DISTINCT categoria) por cliente | Líneas de pedido |
| Ticket medio | AVG(neto_pedido) por cliente | Pedidos |
| Tendencia | Ratio periodo actual / anterior | Comparar periodos |
| Margen | SUM(neto - coste) por cliente | Facturación + costes |

## Tabla 2. Stack tecnológico

| Capa | Herramienta | Uso |
|------|-------------|-----|
| Fuente de datos | SAP / Oracle (esquema REPORTING) | Datos transaccionales reales |
| ETL y análisis | Python (pandas, scikit-learn, oracledb) | Extracción, limpieza, modelado |
| Queries | SQL | Consultas sobre Oracle |
| Visualización | Power BI | Dashboards interactivos |
| Documentación | Quarto / Word | Informes reproducibles |

## Figura 1. Pipeline metodológico

ETL (Python/SQL)  →  EDA (pandas/seaborn)  →  K-Means (scikit-learn)  →  Perfilado (árboles de decisión)  →  BEP (matrices de escenarios)  →  Dashboard (Power BI)
