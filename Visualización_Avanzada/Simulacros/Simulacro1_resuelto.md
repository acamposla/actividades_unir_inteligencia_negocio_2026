# EXAMEN FINAL — Visualización Avanzada y Automatización de Análisis de Datos

**Simulacro 1 — RESUELTO** | **Fecha:** 2026-02-24
**Dataset:** `data/Base de datos examen.xlsx`

---

## ESCENARIO DE NEGOCIO

La consultora **Nexus Analytics** ha sido contratada por **GlobalPlay Entertainment**, un grupo editorial de videojuegos que opera en Norteamérica, Europa, Japón y otros mercados. La dirección quiere un dashboard analítico para responder a preguntas estratégicas sobre el rendimiento histórico de sus ventas por plataforma, género y mercado geográfico.

Te han entregado el archivo **"Base de datos examen.xlsx"** con 3 hojas de datos.

---

## PARTE PRÁCTICA (60%)

### Fase 1 — Revisión y Pre-análisis (10%)

**P1.** Describe brevemente el dataset: ¿cuántas hojas tiene, qué contiene cada una, cuántas filas/columnas, y cuáles son las variables principales?

> *Respuesta:*
>
> El archivo contiene **3 hojas**:
>
> | Hoja | Filas | Columnas | Contenido |
> |------|-------|----------|-----------|
> | **Sales** | 16,598 | 8 | Tabla principal de ventas: `Game_ID`, `Game_Name`, `Year`, `Genre`, `NA_Sales`, `EU_Sales`, `JP_Sales`, `Other_Sales` |
> | **Platform** | 16,598 | 2 | Contiene `Platform_Name` y `Publisher_Name`, pero sin clave para unirla a Sales |
> | **Publisher** | 14,097 | 2 | Tabla de dimensión: `Game_Name` y `Publisher_Name` |
>
> Las variables principales son: el nombre del juego como identificador, el año de lanzamiento, el género, y las ventas desglosadas por 4 regiones geográficas (Norteamérica, Europa, Japón y Otros mercados). Los valores de ventas están expresados en millones de dólares.

**P2.** ¿Cómo se relacionan las 3 hojas entre sí? Explica qué estrategia usarás para combinarlas y por qué.

> *Respuesta:*
>
> - **Sales y Publisher** se relacionan por la columna `Game_Name`, que es común a ambas. Publisher actúa como tabla de dimensión que asigna un editor (publisher) a cada juego. La estrategia es hacer un **Left Outer Join** desde Sales hacia Publisher por `Game_Name` para traer `Publisher_Name` a la tabla principal.
>
> - **Platform NO se puede unir** a Sales de forma fiable. Aunque ambas tienen 16,598 filas, no comparten ninguna columna clave (no hay Game_ID, Game_Name ni ningún identificador en Platform). Además, al verificar los datos, las filas **no están alineadas por índice**: por ejemplo, la fila 16 de Sales corresponde a "Wii Fit Plus" pero Platform indica "PS3", lo cual es incorrecto. Solo un ~4% de coincidencias se da por azar. La hoja Platform es inutilizable y se documenta como **problema de calidad de datos**.
>
> - **Precaución crítica con el merge**: Publisher tiene 2,610 nombres de juego duplicados (juegos multi-plataforma con distintos publishers). Es imprescindible **deduplicar Publisher por Game_Name antes del merge** para evitar una expansión de filas de 16,598 a 26,363, lo que multiplicaría falsamente las cifras de ventas.

**P3.** Identifica al menos **4 problemas de calidad de datos** que habrá que resolver antes de visualizar.

> *Respuesta:*
>
> 1. **Géneros inconsistentes** en `Genre`: existen 3 pares de valores que representan lo mismo con distinta grafía — `SPORT` / `Sports`, `Role-P` / `Role-Playing`, `Simulat.` / `Simulation`. Hay 15 valores únicos cuando deberían ser 12.
>
> 2. **Hoja Platform inutilizable**: no tiene columna clave para hacer join con Sales y las filas están desordenadas. Esto imposibilita el análisis por plataforma.
>
> 3. **297 valores nulos en `Year`** (1,79% del dataset): filas con datos de ventas válidos pero sin año de lanzamiento. Afectará a cualquier análisis temporal.
>
> 4. **26 filas completamente vacías**: tienen nulos simultáneos en `Genre`, `NA_Sales`, `EU_Sales`, `JP_Sales` y `Other_Sales`. Son registros basura sin información útil.
>
> 5. *(Adicional)* **Duplicados en Publisher**: `Game_Name` no es clave única en la tabla Publisher. Un merge sin deduplicar previamente infla el dataset un 59%.
>
> 6. *(Adicional)* **Valor `0` como Platform_Name y Publisher_Name**: existen filas con el valor literal "0" donde debería haber texto, lo que indica datos corruptos o placeholders.

---

### Fase 2 — Limpieza y Transformación en Power Query (20%)

**T1.** Combina las hojas Sales y Platform en una sola tabla con todas las columnas.

> *Método utilizado y justificación:*
>
> **No se combinan Sales y Platform.** Al inspeccionar los datos se detecta que Platform no tiene columna clave compartida con Sales y las filas no están alineadas (verificado con juegos conocidos). Unirlas por índice de fila produciría datos incorrectos.
>
> En su lugar, se realiza el merge **Sales + Publisher** por `Game_Name`:
>
> 1. En Power Query, seleccionar la consulta `Publisher`
> 2. Eliminar duplicados en la columna `Game_Name` (clic derecho > Quitar duplicados)
> 3. En la consulta `Sales`, ir a Inicio > Combinar consultas > Merge
> 4. Seleccionar `Game_Name` de Sales y `Game_Name` de Publisher
> 5. Tipo de combinación: **Left Outer Join** (mantener todas las filas de Sales)
> 6. Expandir solo la columna `Publisher_Name`
> 7. Verificar que el resultado sigue teniendo **16,598 filas**
>
> Código M relevante del merge:
> ```
> = Table.NestedJoin(Sales, {"Game_Name"}, Publisher_Dedup, {"Game_Name"}, "Publisher", JoinKind.LeftOuter)
> ```

**T2.** Normaliza la columna `Genre`: corrige las inconsistencias que hayas detectado.

> *Pasos aplicados:*
>
> Tres reemplazos de valor en la columna `Genre`:
>
> | Valor original | Valor corregido |
> |---|---|
> | `SPORT` | `Sports` |
> | `Role-P` | `Role-Playing` |
> | `Simulat.` | `Simulation` |
>
> En Power Query: seleccionar columna `Genre` > Transformar > Reemplazar valores, tres veces.
>
> Código M equivalente:
> ```
> = Table.ReplaceValue(#"Paso anterior", "SPORT", "Sports", Replacer.ReplaceText, {"Genre"})
> = Table.ReplaceValue(#"Paso anterior", "Role-P", "Role-Playing", Replacer.ReplaceText, {"Genre"})
> = Table.ReplaceValue(#"Paso anterior", "Simulat.", "Simulation", Replacer.ReplaceText, {"Genre"})
> ```
>
> Resultado: de 15 géneros únicos se pasa a **12 géneros normalizados**.

**T3.** Revisa y corrige la columna `Platform_Name`: trata los valores anómalos.

> *Pasos aplicados:*
>
> La columna `Platform_Name` pertenece a la hoja Platform, que se ha descartado en T1 por no poderse unir a Sales de forma fiable. No se aplican correcciones porque la hoja no se utiliza en el análisis.
>
> Se documenta para el registro que Platform contenía valores anómalos:
> - `2600` (probablemente "Atari 2600" truncado, 40 registros)
> - `0` (valor placeholder/basura, 26 registros)

**T4.** Asegúrate de que los tipos de datos sean correctos en todas las columnas (especialmente Year y las columnas de ventas).

> *Tipos asignados:*
>
> | Columna | Tipo |
> |---------|------|
> | `Game_ID` | Número entero |
> | `Game_Name` | Texto |
> | `Year` | **Número entero** (no decimal, son años) |
> | `Genre` | Texto |
> | `NA_Sales` | Número decimal |
> | `EU_Sales` | Número decimal |
> | `JP_Sales` | Número decimal |
> | `Other_Sales` | Número decimal |
> | `Publisher_Name` | Texto |
>
> En Power Query: seleccionar cada columna > Transformar > Tipo de datos.
> Es especialmente importante que `Year` sea entero y no texto, para que la serie temporal funcione correctamente en los gráficos.

**T5.** Crea una columna calculada `Total_Sales` que sume las ventas de las 4 regiones.

> *Fórmula o paso utilizado:*
>
> En Power Query: Agregar columna > Columna personalizada:
>
> ```
> = [NA_Sales] + [EU_Sales] + [JP_Sales] + [Other_Sales]
> ```
>
> Nombre: `Total_Sales`, tipo: Número decimal.
>
> Alternativa en DAX (si se prefiere hacer en el modelo):
> ```
> Total_Sales = Sales[NA_Sales] + Sales[EU_Sales] + Sales[JP_Sales] + Sales[Other_Sales]
> ```
>
> La opción de Power Query es preferible porque la columna queda materializada en el dataset y no depende del motor DAX.

**T6.** Decide y aplica una estrategia para los valores nulos en `Year`. Justifica tu decisión por escrito.

> *Estrategia y justificación:*
>
> **Decisión: mantener las filas, no eliminarlas.**
>
> Son 297 filas (1,79% del total) que tienen datos de ventas válidos — eliminarlas significaría perder información real de ventas que afecta a los totales por género, publisher y región.
>
> Estas filas simplemente no aparecerán en el gráfico de evolución temporal (V2), pero sí contribuirán correctamente al resto de visualizaciones (V1, V3, V4) que no dependen del año.
>
> Sí se eliminan las **26 filas** que tienen nulos simultáneos en `Genre` y en las 4 columnas de ventas, ya que son registros sin información útil.
>
> Pasos en Power Query:
> 1. Seleccionar columna `Genre`
> 2. Inicio > Quitar filas > Quitar filas en blanco (elimina las 26 basura)
> 3. NO filtrar nulos en `Year`

---

### Fase 3 — Dashboard (15%)

**V1.** Gráfico de barras: **Top 10 plataformas por ventas totales globales**.

> *Tipo de gráfico elegido y configuración:*
>
> **No es posible con este dataset.** La hoja Platform no se puede unir a Sales (sin clave, filas desordenadas), por lo que no disponemos de la variable `Platform_Name` en nuestra tabla de trabajo.
>
> **Alternativa propuesta:** Gráfico de barras horizontales con **Top 10 Géneros por ventas totales globales**.
> - Eje Y: `Genre`
> - Eje X (valor): `Sum(Total_Sales)`
> - Filtro visual: Top N = 10 por Sum(Total_Sales)
> - Ordenar descendente por ventas
>
> Si el examen exigiera estrictamente plataformas, se documentaría el problema de calidad de datos y se explicaría por qué no es posible.

**V2.** Gráfico de líneas: **Evolución de ventas globales por año** (serie temporal).

> *Tipo de gráfico elegido y configuración:*
>
> Gráfico de **líneas** (Line Chart).
> - Eje X: `Year` (filtrado para excluir nulos y años posteriores a 2016 por datos incompletos)
> - Eje Y (valor): `Sum(Total_Sales)`
> - Sin leyenda (una sola serie)
> - Título: "Evolución de ventas globales de videojuegos por año"
>
> Consideraciones:
> - Filtrar el rango útil (~1995-2016) para evitar colas con datos escasos
> - Las 297 filas sin año quedan excluidas automáticamente
> - Los datos post-2015 están claramente incompletos (2017: 3 juegos, 2020: 1 juego), lo que se debe señalar

**V3.** Gráfico de barras apiladas o agrupadas: **Ventas por región geográfica** (NA, EU, JP, Other) **para los 5 géneros con más ventas**.

> *Tipo de gráfico elegido y configuración:*
>
> Gráfico de **barras agrupadas** (Clustered Bar Chart).
> - Eje Y: `Genre` (filtrado con Top N = 5 por Sum(Total_Sales))
> - Eje X (valores): `Sum(NA_Sales)`, `Sum(EU_Sales)`, `Sum(JP_Sales)`, `Sum(Other_Sales)`
> - Leyenda: por región (4 colores)
> - Título: "Ventas por región para los 5 géneros principales"
>
> Los 5 géneros resultantes y su distribución regional:
>
> | Género | NA | EU | JP | Other |
> |--------|----|----|-------|-------|
> | Action | 50% | 30% | 9% | 11% |
> | Sports | 51% | 28% | 10% | 10% |
> | Shooter | **56%** | 30% | **4%** | 10% |
> | Role-Playing | 35% | 20% | **38%** | 6% |
> | Platform | 54% | 24% | 16% | 6% |
>
> Se elige barras agrupadas en vez de apiladas porque permite comparar mejor las magnitudes absolutas entre regiones dentro de cada género. Las apiladas serían mejor si el foco fuera ver el total por género.

**V4.** Gráfico de tu elección que responda a: **¿Qué publishers dominan el mercado?** (Top 10 publishers por ventas totales).

> *Tipo de gráfico elegido y justificación:*
>
> Gráfico de **barras horizontales** (Horizontal Bar Chart).
> - Eje Y: `Publisher_Name`
> - Eje X (valor): `Sum(Total_Sales)`
> - Filtro visual: Top N = 10 por Sum(Total_Sales)
> - Ordenar descendente
> - Título: "Top 10 Publishers por ventas globales (M$)"
>
> Se elige barras horizontales porque los nombres de publishers son largos y se leen mejor en el eje vertical. Un treemap sería alternativa válida si se quisiera mostrar proporción visual del mercado.
>
> Resultado esperado:
>
> | Publisher | Ventas (M$) |
> |-----------|-------------|
> | Nintendo | 1,767 |
> | Electronic Arts | 1,212 |
> | Activision | 753 |
> | Sony Computer Entertainment | 589 |
> | Ubisoft | 491 |
> | Take-Two Interactive | 392 |
> | THQ | 320 |
> | Sega | 283 |
> | Konami Digital Entertainment | 281 |
> | Namco Bandai Games | 256 |
>
> Nintendo domina con un 46% más de ventas que EA (segundo lugar).

---

### Fase 4 — Interpretación (15%)

**I1.** ¿Cuál es la plataforma con mayores ventas globales y en qué región geográfica concentra su fuerza?

> *Respuesta:*
>
> No es posible responder sobre plataformas específicas porque la hoja Platform no se pudo unir al dataset (problema de calidad documentado en la Fase 1).
>
> Sin embargo, analizando por **publisher como proxy**: **Nintendo** es el líder con 1,767 M$ en ventas globales. Dada la naturaleza de sus títulos (Wii Sports, Mario, Pokemon), su fuerza se concentra en **Norteamérica y Japón**. Japón es un mercado donde Nintendo tiene una presencia especialmente dominante gracias a la tradición de consolas japonesas y franquicias como Pokemon y Mario.

**I2.** ¿Se observa alguna tendencia o patrón en la evolución temporal de ventas? ¿Hay algún periodo de crecimiento o caída notable?

> *Respuesta:*
>
> Sí, se observa un patrón claro en forma de **campana**:
>
> - **Crecimiento sostenido** desde principios de los 2000 hasta 2008, impulsado por la generación de consolas PS3/Xbox 360/Wii.
> - **Pico en 2008** con 678 M$ en ventas globales y 1,428 juegos lanzados.
> - **Declive progresivo a partir de 2009**, cayendo cada año de forma consistente.
> - El descenso más pronunciado se da entre 2011-2012 (de 516 M$ a 363 M$, un -30%).
>
> **Nota importante**: los datos a partir de 2015-2016 están claramente incompletos (muy pocos juegos registrados), por lo que la caída extrema en esos años no refleja la realidad del mercado sino una limitación del dataset.
>
> La tendencia general sugiere un cambio de modelo en la industria: la migración hacia ventas digitales, free-to-play y microtransacciones, que probablemente no se capturan en este dataset centrado en ventas físicas.

**I3.** ¿Qué género domina en Japón frente a Norteamérica? ¿Hay diferencias significativas?

> *Respuesta:*
>
> Sí, hay diferencias muy significativas que reflejan preferencias culturales distintas:
>
> - **Japón**: domina **Role-Playing** con 352 M$ — casi el doble que el segundo género (Action, 160 M$). Esto responde a la fuerte tradición japonesa de JRPGs (Final Fantasy, Dragon Quest, Pokemon).
>
> - **Norteamérica**: domina **Action** con 878 M$, seguido de **Sports** (683 M$) y **Shooter** (583 M$). Los shooters son especialmente reveladores: representan el 56% de sus ventas globales en NA, pero apenas un 4% en Japón.
>
> - **El contraste clave**: Shooter es el 3er género en NA y es prácticamente inexistente en Japón. Role-Playing es el 1er género en Japón pero solo el 4to en NA. Esto tiene implicaciones directas para la estrategia de lanzamiento por mercado.

**I4.** Un directivo te pregunta: "¿Deberíamos centrarnos en el mercado japonés?" ¿Qué le responderías basándote en los datos?

> *Respuesta:*
>
> **No como mercado principal**, pero sí como mercado estratégico para ciertos géneros. Los datos muestran:
>
> 1. **Japón representa solo el 14,5% de las ventas globales**, frente al 49,3% de Norteamérica y el 27,3% de Europa. En volumen, NA genera 3,4 veces más ventas que Japón.
>
> 2. **Sin embargo**, Japón es un mercado de alto valor para **Role-Playing**: el 38% de las ventas globales de RPGs se generan allí. Si nuestro catálogo incluye RPGs, Japón no es opcional.
>
> 3. **Estrategia recomendada**: no centrarse en Japón como mercado general, sino tener una **estrategia de nicho** — lanzar títulos RPG adaptados al mercado japonés mientras se mantiene el foco principal en NA y EU para Action, Sports y Shooter.
>
> 4. **Riesgo de ignorar Japón**: perder un tercio del mercado potencial de RPGs, que es el 4to género global con 927 M$ en ventas.

---

## PARTE TEÓRICA (40%)

**PT1.** Explica qué es un **mapa coroplético**, para qué tipo de datos es adecuado y pon un ejemplo de uso empresarial. ¿Por qué se recomienda representar ratios en vez de valores absolutos?

> *Respuesta:*
>
> Un **mapa coroplético** es una visualización geográfica que utiliza **gradaciones de color** para representar el valor de una variable sobre áreas delimitadas (países, regiones, provincias, códigos postales).
>
> Es adecuado para datos que tienen una **dimensión geográfica** y donde interesa comparar zonas entre sí: densidad de ventas, tasas de penetración, incidencias por región, etc.
>
> **Ejemplo empresarial**: Una cadena de distribución quiere visualizar la cuota de mercado por comunidad autónoma en España. Cada comunidad se colorea según su porcentaje de cuota: verde oscuro para alta cuota, verde claro para baja, rojo para zonas donde no hay presencia.
>
> **Se recomienda representar ratios (tasas, porcentajes) en vez de valores absolutos** porque las áreas geográficas tienen tamaños y poblaciones muy diferentes. Si representamos valores absolutos (ej. número de ventas), Madrid y Barcelona siempre dominarán simplemente por tener más población, no por un rendimiento superior. Un ratio (ventas per cápita, cuota de mercado, tasa de penetración) normaliza la comparación y permite detectar dónde realmente se rinde mejor o peor, independientemente del tamaño del área.

**PT2.** Diferencia entre **PCA** y **t-SNE**: ¿cuándo usarías cada uno? Indica si son técnicas lineales o no lineales.

> *Respuesta:*
>
> Ambas son técnicas de **reducción de dimensionalidad** — permiten representar datos con muchas variables en un espacio de pocas dimensiones (típicamente 2D) para poder visualizarlos.
>
> | Característica | PCA | t-SNE |
> |---|---|---|
> | **Tipo** | **Lineal** | **No lineal** |
> | **Qué preserva** | Varianza global, estructura general | Relaciones locales entre vecinos, clústeres |
> | **Velocidad** | Rápido, escalable | Lento, costoso computacionalmente |
> | **Interpretabilidad** | Alta (los componentes tienen significado) | Baja (los ejes no tienen interpretación directa) |
>
> **Cuándo usar PCA**: cuando quiero resumir muchas variables en pocas componentes manteniendo la máxima información posible. Útil como paso previo a otros análisis, para reducir ruido, o para entender qué variables explican más variabilidad. Ejemplo: resumir 20 métricas financieras de clientes en 2-3 factores principales.
>
> **Cuándo usar t-SNE**: cuando quiero **visualizar agrupaciones naturales** (clústeres) en datos de alta dimensionalidad. Excelente para ver si los datos se separan en grupos distintos. Ejemplo: visualizar si los clientes de un banco se agrupan naturalmente en segmentos según su comportamiento.
>
> **Regla rápida**: PCA para resumir y entender estructura global; t-SNE para visualizar si hay clústeres locales.

**PT3.** En Power Automate, ¿cuáles son los 3 componentes clave de un flujo de automatización? Pon un ejemplo aplicado a un escenario de negocio.

> *Respuesta:*
>
> Los 3 componentes clave son:
>
> 1. **Trigger (Desencadenador)**: el evento que inicia el flujo. Es la condición que "dispara" la automatización. Puede ser temporal (cada día a las 8:00), basado en datos (un KPI baja de un umbral) o basado en eventos (llega un correo, se modifica un archivo).
>
> 2. **Conectores**: las herramientas/servicios que participan en el flujo. Son las integraciones con aplicaciones externas — Outlook, SharePoint, Excel, Power BI, Teams, SQL Server, etc. Cada conector permite leer o escribir en ese servicio.
>
> 3. **Acciones**: las tareas que el sistema ejecuta cuando se dispara el trigger. Son los pasos concretos: enviar un email, guardar un archivo, actualizar un registro, publicar un mensaje en Teams, refrescar un dataset.
>
> **Ejemplo de negocio**: En un departamento de ventas, se configura un flujo:
> - **Trigger**: una alerta de Power BI detecta que las ventas semanales de una región caen por debajo del 80% del objetivo.
> - **Conector**: Power BI (lee la alerta) + Outlook (envía email) + Teams (publica mensaje).
> - **Acciones**: (1) Se envía un email automático al responsable regional con el detalle de la caída. (2) Se publica un aviso en el canal de Teams del equipo comercial. (3) Se crea una tarea en Planner para hacer seguimiento.

**PT4.** ¿Qué diferencia hay entre **Power BI Desktop** y **Power BI Service**? ¿Cuál necesitas para automatizar y publicar?

> *Respuesta:*
>
> | | Power BI Desktop | Power BI Service |
> |---|---|---|
> | **Entorno** | Aplicación local (escritorio) | Plataforma en la nube (web) |
> | **Función principal** | Diseño y preparación: cargar datos, limpiar con Power Query, crear modelos, diseñar dashboards | Publicación y colaboración: compartir informes, automatizar, gestionar permisos |
> | **Acceso** | Instalación gratuita en Windows | Requiere cuenta Microsoft 365; automatización requiere licencia **Pro** o **Premium** |
> | **Automatización** | NO disponible | SÍ — refrescos programados, alertas, integración con Power Automate |
> | **Publicación** | NO — solo trabajo local | SÍ — publicar informes para que otros los vean |
>
> Para **automatizar y publicar** se necesita **Power BI Service** con licencia **Pro** como mínimo. Desktop es donde se diseña y prepara todo; Service es donde se despliega, se comparte y se automatiza.
>
> Un flujo típico profesional es: diseñar en Desktop → publicar en Service → configurar refresco automático de datos → compartir con el equipo con control de permisos (Row Level Security).

**PT5.** Nombra **2 errores comunes** en proyectos de Business Intelligence según lo visto en clase y explica por qué son problemáticos.

> *Respuesta:*
>
> **Error 1: No limpiar los datos antes de visualizar.**
> Es el error más grave y frecuente. Si los datos contienen duplicados, formatos inconsistentes, nulos no tratados o valores erróneos, todas las visualizaciones y conclusiones que se deriven estarán comprometidas. "Basura entra, basura sale." En nuestro propio dataset del examen, sin normalizar los géneros (SPORT/Sports, Role-P/Role-Playing) tendríamos 15 categorías en vez de 12, con valores artificialmente divididos que distorsionan cualquier ranking o comparativa.
>
> **Error 2: Automatizar sin validar.**
> Consiste en configurar refrescos automáticos de datos o flujos de Power Automate sin antes verificar que el proceso completo funciona correctamente. Si hay un error en la fuente de datos, en una transformación o en una fórmula DAX, la automatización lo va a propagar silenciosamente cada vez que se ejecute. El resultado es que directivos toman decisiones basándose en dashboards con datos erróneos sin saberlo. Siempre hay que testear el flujo completo manualmente antes de automatizarlo.

---

## EVALUACIÓN (uso interno del corrector)

| Sección | Peso | Nota | Comentarios |
|---------|------|------|-------------|
| Fase 1 — Pre-análisis | 10% | | |
| Fase 2 — ETL | 20% | | |
| Fase 3 — Dashboard | 15% | | |
| Fase 4 — Interpretación | 15% | | |
| Parte Teórica | 40% | | |
| **TOTAL** | **100%** | | |
