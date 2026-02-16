# Simulacro 01 — Estrategia y Gestión Empresarial Basada en Análisis de Datos

**Fecha**: 15/02/2026
**Duración**: 120 minutos
**Instrucciones**: Responda a los dos ejercicios. Dispone de aproximadamente una cara por ejercicio. Se valorará la capacidad de síntesis, la relación entre conceptos y la correcta interpretación analítica. Cuide la ortografía.

---

## Ejercicio 1 (5 puntos)

La empresa **FreshMarket**, una cadena de supermercados con 45 tiendas, quiere lanzar una campaña de fidelización. El Director Comercial propone, basándose en su experiencia de 20 años, invertir 200.000€ en un descuento del 15% en productos frescos para todos los clientes durante 3 meses, porque "los frescos son lo que más se vende y así vendrá más gente".

El departamento de datos, recién creado, sugiere que antes de lanzar la campaña se analicen los datos de los últimos 12 meses del programa de tarjeta de fidelización.

**Se pide:**

**a)** Identifique qué tipo de toma de decisión representa la propuesta del Director Comercial. Explique los riesgos de este enfoque y argumente por qué el proceso analítico propuesto por el departamento de datos sería más adecuado.

La toma de decisión parece arbitraria o basada en una sensación del Director Comercial, dado que no está justificada con datos. Este tipo de proceso de toma de decisión está basado en un sesgo de autoridad, donde aparantemente es la mejor decisión porque quién la toma es la persona que ocupa el puesto más alto en la jerarquía, pero eso no quiere decir que sea la correcta. 
El riesgo fundamental es equivocarse sin saber por qué. Esto implicaría no conseguir causar un cambio en el comportamiento del consumidor haciendo que la inversión no tuviera retorno. 
El proceso análitico sería más adecuado dado que es un proceso que sistematiza la toma de decisiones. 


**b)** Describa, paso a paso, el proceso que seguiría el departamento de datos para fundamentar (o refutar) la propuesta del Director Comercial. Incluya: qué datos necesitaría, qué tipo de análisis realizaría y qué KPIs definiría para medir el éxito de la campaña (proponga al menos dos KPIs SMART).

En primer lugar necesitariamos las tablas de sucesos y de dimensiones. Como tabla de sucesos necesitamos la tabla con las fact.dimensiones de volumen vendido en valor y cantidad, el ID del cliente que nos compró, la fehca de compra y el ID de producto comprado. 
Nuestras tablas de dimensiones deberían ser las de productos y clientes enriquecidas con el mayor número posible de dimensiones que nos permitan segmentar. Aquí es importante destacar que el enriquecimiento de los datos de las personas debe de ser anonimizado, de forma que no se puedan identificar directamente, evitando datos sensibles (por ejemplo, el dni)
Además los datos de los clientes se han tenido que previamente recojer con la aprobación explicita de estos, y deben de conocer que sus datos son usadados para fines comerciales en materia de mecadotécnia. 
Con estos datos el equipo de análisis crea un modelo de estrella para poder formular hipotésis que justifiquen determinadas acciones, en este caso "Disminución de un 15% del precio de los frescos aumentará el volumen de venta con un BEP de 200.000€"
En segundo lugar, describiriamos, mediante análisis descriptivo, cómo son los clientes desde el punto de vista demográfico y psicográfico. Esto implica cruzar diferentes las diferentes variables de estas tablas. Una forma eficiente de hacer esto, es mediante una regresión logística: crearíamos una variable booleana para "CompraVegetales" y elegiriamos las variables que pensamos que influyen más en este tipos de compra, opteniendo así, las variables predictoras. 
Con estas variables predictoras, podríamos hacer una clusterización, para encontrar los diferentes grupos que hay en torno a la compra de frescos,
Los KIPS para medir el éxito de la campaña sería el ROAS: return of advertising investment. En este caso, al estar intercambiando margen por volumen, necesitariamos aumentar o bien el ticket medio de las compras o bien la cantidad de pedidos. 
En el caso en el que el Bkreak even point de la campaña estaríamos siendo exitosos. 



**c)** El departamento de datos descubre que hay 3 segmentos de clientes claramente diferenciados. Explique por qué una promoción idéntica para todos los clientes puede ser ineficiente y qué enfoque alternativo propondría.

---

## Ejercicio 2 (5 puntos)

Una empresa de e-commerce ha realizado un análisis de segmentación (clustering K-Means) sobre su base de 50.000 clientes. El resultado ha generado **3 clústeres** con las siguientes medias:

| Variable              | Clúster 1 (n=22.000) | Clúster 2 (n=8.000) | Clúster 3 (n=20.000) |
|-----------------------|-----------------------|----------------------|-----------------------|
| Antigüedad (meses)    | 6                     | 38                   | 24                    |
| Gasto mensual (€)     | 15                    | 120                  | 45                    |
| Frecuencia compra/mes | 1.2                   | 5.8                  | 2.1                   |
| Tasa devolución (%)   | 18                    | 3                    | 22                    |
| Nº categorías compra  | 1.5                   | 6.2                  | 2.8                   |

**Se pide:**

**a)** Interprete los 3 clústeres: asigne un nombre descriptivo a cada grupo y justifique el perfil de cada uno basándose en los datos de la tabla. ¿Qué estrategia comercial diferenciada propondría para cada segmento dentro del ciclo de vida del cliente?

**b)** Para validar la segmentación, el equipo de datos ha utilizado un árbol de decisión posterior. La primera regla del árbol dice: *"Si Gasto mensual > 80€ y Antigüedad > 24 meses → Clúster 2 (probabilidad 94%)"*. Explique qué técnica se está aplicando aquí, por qué se usa un modelo supervisado para explicar un resultado no supervisado, y qué utilidad tiene esto para el negocio.

**c)** El departamento de marketing quiere utilizar los datos de navegación web, historial de compras y geolocalización de los clientes para enviarles ofertas personalizadas por SMS sin haber informado previamente a los clientes de este uso. Identifique qué principios del RGPD se estarían vulnerando y qué debería hacer la empresa para actuar correctamente.

---

*Fin del examen.*
