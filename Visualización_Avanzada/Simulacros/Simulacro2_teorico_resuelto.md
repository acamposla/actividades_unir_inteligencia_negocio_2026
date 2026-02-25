# SIMULACRO 2 — Examen Teórico Resuelto

**Fecha:** 2026-02-25
**Enfoque:** Parte teórica (40% del examen real)
**Formato:** Preguntas de desarrollo/respuesta corta. NO tipo test. Objetivas.
**Fuente:** Conceptos extraídos directamente de las clases y presentaciones del profesor.

---

## BLOQUE 1: Visualización Avanzada y Diseño (Temas 1-2)

### P1. Gráfico de burbujas

**Pregunta:** Explica qué es un gráfico de burbujas, cuántas dimensiones permite representar simultáneamente y cuáles son. Pon un ejemplo de uso empresarial.

> **Respuesta:**
>
> Un gráfico de burbujas es una técnica de visualización multivariante que permite representar hasta **4 dimensiones** en un solo gráfico:
>
> 1. **Eje X** — primera variable (posición horizontal)
> 2. **Eje Y** — segunda variable (posición vertical)
> 3. **Tamaño de la burbuja** — tercera variable (magnitud relativa)
> 4. **Color de la burbuja** — cuarta variable (categoría o escala)
>
> Se puede añadir una 5ª dimensión usando la **forma** (cuadrados, triángulos, círculos) para distinguir categorías adicionales.
>
> **Ejemplo empresarial:** Análisis de campañas de publicidad donde el eje X es la inversión publicitaria, el eje Y es el retorno en ventas, el tamaño es la audiencia alcanzada y el color indica el canal (TV, digital, radio). Esto permite ver de un vistazo qué campañas tienen mejor ROI y priorizar acciones.

---

### P2. Perfiles de usuario

**Pregunta:** ¿Qué diferencia hay entre diseñar un dashboard para un perfil ejecutivo y para un perfil analista? Da un ejemplo de qué necesita cada uno.

> **Respuesta:**
>
> | | Perfil Ejecutivo (CEO) | Perfil Analista/Técnico |
> |---|---|---|
> | **Necesita** | KPIs agregados, tendencias macro, excepciones | Granularidad, filtros, capacidad de drill-down |
> | **Nivel de detalle** | Bajo — resumen y visión global | Alto — datos desagregados para explorar |
> | **Interacción** | Mínima — debe entenderse de un vistazo | Alta — filtros, selecciones, niveles de profundidad |
>
> **Ejemplo ejecutivo:** Un dashboard con 4 tarjetas KPI (ventas del mes, margen, clientes nuevos, NPS) y una línea de tendencia de 12 meses. El CEO ve en 10 segundos si las cosas van bien o mal.
>
> **Ejemplo analista:** Un dashboard con filtros por región, producto, vendedor y fecha, con drill-down desde categoría hasta SKU individual. El analista puede investigar por qué las ventas cayeron en una zona concreta.
>
> **Clave:** Hay que decidir el perfil de usuario ANTES de diseñar el dashboard, no después. Mezclar ambos perfiles en un solo dashboard es un error común — el ejecutivo se pierde en el detalle y el analista echa de menos los filtros.

---

### P3. Principios Gestalt

**Pregunta:** Nombra y explica brevemente 3 principios de la Gestalt aplicados al diseño de visualizaciones. ¿Por qué son relevantes para un dashboard?

> **Respuesta:**
>
> Los principios de la Gestalt explican cómo el cerebro humano organiza y agrupa la información visual de forma automática. Son relevantes porque un dashboard bien diseñado aprovecha estos principios para que la interpretación sea intuitiva.
>
> 1. **Proximidad:** Los elementos que están cerca entre sí se perciben como un grupo. En un dashboard, los KPIs relacionados deben colocarse juntos (ej: ventas y margen uno al lado del otro, no separados por un gráfico de otra temática).
>
> 2. **Semejanza:** Los elementos con el mismo color, forma o tamaño se perciben como pertenecientes al mismo grupo. Si uso el color azul para "ingresos" en un gráfico, debo mantenerlo en todos los gráficos del dashboard. Cambiar colores entre gráficos confunde al usuario.
>
> 3. **Cierre:** El cerebro tiende a completar formas incompletas. Esto permite usar diseños minimalistas — no hace falta dibujar cada borde o línea de una tabla, el cerebro completa la estructura. Menos elementos visuales = menos ruido.
>
> **Relevancia:** Violar estos principios genera sobrecarga cognitiva. El usuario tarda más en interpretar y comete más errores de lectura.

---

### P4. Grafos de red

**Pregunta:** Define qué es un grafo de red, cuáles son sus elementos principales y pon un ejemplo.

> **Respuesta:**
>
> Un grafo de red es una visualización que representa **relaciones entre entidades**. Sus dos elementos principales son:
>
> - **Nodos** (puntos): representan las entidades o actores del sistema. Se pueden dimensionar por tamaño para indicar importancia o volumen.
> - **Aristas** (líneas que conectan nodos): representan las relaciones o conexiones entre entidades. Pueden tener dirección (arista dirigida) y grosor para indicar intensidad.
>
> **Ejemplo:** Una red de rutas aéreas donde los nodos son aeropuertos y las aristas son las rutas entre ellos. El tamaño del nodo indica el volumen de pasajeros y el grosor de la arista indica la frecuencia de vuelos. Esto permite detectar hubs principales y rutas más transitadas.
>
> **Otros ejemplos válidos:** Redes de ciberseguridad (ordenadores y conexiones), redes sociales (usuarios y sus interacciones), cadenas de suministro (proveedores y flujos de mercancía).

---

### P5. Tipos de gráficos especiales

**Pregunta:** Explica qué es un diagrama de Sankey y para qué tipo de análisis es útil. ¿Qué representa el grosor de las líneas?

> **Respuesta:**
>
> Un diagrama de Sankey es una visualización de **flujos** entre estados, etapas o categorías. Se compone de nodos (las etapas) conectados por bandas cuyo **grosor representa el volumen o magnitud** del flujo entre ellos.
>
> Es útil para:
> - Visualizar **cuellos de botella**: dónde se pierde volumen entre etapas
> - Analizar **conversiones**: ej. un funnel de ventas (visitas → leads → oportunidades → cierre)
> - Rastrear **distribuciones de recursos**: ej. cómo se distribuye un presupuesto entre departamentos
>
> **Ejemplo:** Análisis del proceso de compra online — se ve cuántos usuarios entran en la web, cuántos añaden al carrito, cuántos inician pago y cuántos finalizan la compra. El estrechamiento de las bandas revela en qué etapa se pierden más clientes.

---

### P6. Series temporales

**Pregunta:** ¿Qué es la estacionalidad en una serie temporal? ¿Qué impacto tuvo el COVID en las series temporales históricas y por qué es relevante saberlo?

> **Respuesta:**
>
> La **estacionalidad** es un patrón que se repite periódicamente en los datos a lo largo del tiempo. Por ejemplo, las ventas de cerveza suben en verano y bajan en invierno cada año, o la audiencia de televisión cae en vacaciones y sube en otoño. Detectar la estacionalidad permite separar el efecto cíclico de la tendencia real del negocio.
>
> **Impacto del COVID:** La pandemia fue un **evento disruptivo** que rompió las series temporales históricas. Los confinamientos cambiaron radicalmente los comportamientos de compra, consumo y movilidad. Esto tiene dos consecuencias:
>
> 1. Los datos pre-COVID ya no sirven directamente como base para predicciones porque los patrones cambiaron (ej. la compra online creció bruscamente y no volvió a niveles anteriores).
> 2. Los años 2020-2021 generan "picos" o "valles" anómalos que distorsionan tendencias si no se tratan.
>
> **Relevancia:** Al trabajar con series temporales hay que decidir si incluir o excluir el periodo COVID, o tratarlo como anomalía. Desde el COVID han pasado ya años suficientes para construir un nuevo histórico post-pandemia.

---

### P7. Sobrecarga visual

**Pregunta:** El profesor insiste en el "riesgo de sobrecarga visual". ¿Qué significa y cómo se evita? ¿Cuántas variables se pueden representar razonablemente en un solo gráfico?

> **Respuesta:**
>
> La sobrecarga visual ocurre cuando se meten demasiadas variables, categorías o elementos en un solo gráfico, haciendo que sea difícil o imposible de interpretar. "Nos venimos arriba" e intentamos que un gráfico lo muestre todo, y el resultado es que no muestra nada con claridad.
>
> **Cómo se evita:**
> - Usar **varias vistas coordinadas** en vez de un solo gráfico saturado — varios gráficos pequeños con la misma escala (small multiples) o un dashboard con gráficos complementarios
> - Limitar el número de variables por gráfico: un gráfico de burbujas aguanta 4-5 dimensiones; un gráfico de barras, 2-3 como máximo
> - Utilizar **filtros interactivos** para que el usuario seleccione qué ver, en vez de mostrarlo todo a la vez
>
> **¿Cuántas variables?** Depende del tipo de gráfico, pero como regla general: más allá de 4-5 variables en un mismo gráfico, la interpretación se degrada. Si tienes 10 variables, la respuesta correcta es distribuirlas en varias vistas coordinadas y facetadas, no forzarlas en un solo gráfico.

---

### P8. Coordenadas paralelas

**Pregunta:** Describe qué es un gráfico de coordenadas paralelas y para qué sirve. Pon un ejemplo de un insight que se podría extraer de este tipo de gráfico.

> **Respuesta:**
>
> Un gráfico de coordenadas paralelas presenta varias variables como **ejes verticales paralelos**, y cada observación (individuo, producto, etc.) se representa como una **línea que cruza todos los ejes**. Es útil cuando tienes muchas variables y quieres detectar patrones, agrupaciones o anomalías cruzando todas ellas a la vez.
>
> **Ejemplo del profesor:** Un gráfico con 3 ejes — gasto del cliente, frecuencia de compra y NPS (satisfacción). Cada línea es un producto. Si detecto una línea donde el gasto es alto, la frecuencia es alta, pero el NPS es bajo, estoy ante un producto en riesgo: los clientes gastan mucho y a menudo, pero están insatisfechos. Es candidato a que dejen de comprarlo.
>
> **Utilidad principal:** Detectar combinaciones peligrosas o valiosas entre variables que no se verían mirando cada variable por separado.

---

### P9. Mapas de calor

**Pregunta:** ¿Qué es un mapa de calor y en qué se diferencia de un mapa coroplético? Pon un ejemplo de uso.

> **Respuesta:**
>
> Un **mapa de calor** (heatmap) usa gradaciones de color para representar intensidad de valores en una **matriz bidimensional** (dos ejes categoriales). No requiere componente geográfico — los ejes pueden ser cualquier variable (horas del día, días de la semana, categorías de producto, etc.).
>
> Un **mapa coroplético** es un tipo específico de mapa de calor que SÍ tiene componente geográfico: colorea áreas de un mapa real (países, regiones) según el valor de una variable.
>
> **Diferencia clave:** El mapa de calor es una tabla coloreada; el coroplético es un mapa geográfico coloreado.
>
> **Ejemplo:** Un mapa de calor con días de la semana en un eje y franjas horarias en el otro, coloreado por actividad de usuarios en una web. Color oscuro = más actividad. Resultado: detectas que los martes entre 12:00-14:00 tienen el pico de actividad → es el mejor momento para publicar contenido o lanzar campañas.

---

### P10. Pilares de la visualización

**Pregunta:** El profesor menciona tres pilares para que una representación gráfica sea excelente. ¿Cuáles son? Explica brevemente cada uno.

> **Respuesta:**
>
> 1. **Sensibilidad gráfica:** Entender la psicología de la percepción humana — colores, formas, densidades. Los códigos visuales deben ser coherentes e intuitivos. Ejemplo: verde = bueno, rojo = malo (código semáforo). Si cambias los colores entre gráficos de un mismo informe, pierdes coherencia y confundes al lector. La psicología del color importa: un cero en rojo transmite alarma, en azul transmite calma.
>
> 2. **Rigor analítico:** Interpretar datos correctamente con fundamentos estadísticos y conocimiento del dominio de negocio. Evitar manipulaciones de escala que distorsionen la realidad (ej: cambiar la escala del eje Y para que una diferencia mínima parezca enorme). Conocer el negocio del cliente es tan importante como dominar la herramienta — sin contexto, las interpretaciones pueden ser erróneas.
>
> 3. **Dominio técnico:** Conocer las capacidades y limitaciones de las herramientas (Power BI, Tableau, R, Python). Cuanto más domines la herramienta, más rápido y mejor podrás plasmar tus ideas. Pero el profesor insiste: la herramienta cambia, la filosofía de visualización es inalterable.

---

## BLOQUE 2: Preprocesamiento y Calidad del Dato (Tema 3)

### P11. Tidy Data

**Pregunta:** Define qué es Tidy Data y sus tres reglas. ¿Por qué es importante cumplirlas antes de visualizar?

> **Respuesta:**
>
> Tidy Data (datos ordenados) es un estándar de organización de datos tabulares definido por tres reglas:
>
> 1. **Cada variable es una columna** — no mezclar variables en una misma columna (ej: no poner "Madrid-2024" en una sola celda si son ciudad y año)
> 2. **Cada observación es una fila** — cada registro individual ocupa una fila completa
> 3. **Cada valor es una celda** — cada celda contiene un único valor atómico
>
> **Importancia:** Si los datos no cumplen Tidy Data, las herramientas de visualización no los interpretan correctamente. Por ejemplo, si las ventas de cada mes están en columnas separadas (Ene, Feb, Mar...) en vez de tener una columna "Mes" y otra "Ventas", Power BI no puede hacer un gráfico temporal directamente — necesitas primero "despivotear" la tabla. Cumplir Tidy Data desde el origen ahorra transformaciones y reduce errores.

---

### P12. Preprocesamiento

**Pregunta:** ¿Qué porcentaje del tiempo de un proyecto de datos se invierte en preprocesamiento según la estimación real de negocio? ¿Qué significa "basura entra, basura sale"?

> **Respuesta:**
>
> Se estima que **más del 60-70% del tiempo** de un proyecto de datos se invierte en la fase de preprocesamiento (limpieza, transformación, normalización de datos). Es la fase más larga y donde más valor se genera, aunque no sea la más visible.
>
> **"Basura entra, basura sale"** (garbage in, garbage out) significa que si los datos de entrada tienen errores, duplicados, nulos o inconsistencias, todo lo que se construya sobre ellos — dashboards, modelos predictivos, informes — estará igualmente comprometido. No importa lo sofisticado que sea tu gráfico: si los datos están sucios, las conclusiones serán erróneas.
>
> Por eso la limpieza de datos es una fase obligatoria e irrenunciable. Es también una parte importante del examen — el profesor da datasets "guarreados" a propósito para comprobar que el alumno sabe detectar y corregir errores antes de visualizar.

---

### P13. Errores con tipos de datos

**Pregunta:** ¿Por qué no se deben poner los teléfonos o códigos postales como variables numéricas? ¿Qué error se produce?

> **Respuesta:**
>
> Porque los números que empiezan por cero **pierden ese cero inicial** al ser tratados como numéricos. Un teléfono como `00 34 612345678` se convierte en `34612345678` (pierde los ceros). Un código postal como `08080` (Barcelona) se convierte en `8080`, que no es un código postal válido y genera ambigüedad (¿es 08080, 18080, 28080?).
>
> Estos campos son **identificadores**, no magnitudes — no tiene sentido sumarlos, promediarlos ni operar con ellos matemáticamente. Deben tratarse siempre como **texto** para preservar su formato original completo, incluyendo ceros a la izquierda.

---

## BLOQUE 3: Modelización y Análisis Exploratorio (Tema 4)

### P14. Descriptiva vs Predictiva

**Pregunta:** Diferencia entre analítica descriptiva y predictiva. Usa las metáforas que el profesor utiliza en clase.

> **Respuesta:**
>
> - **Analítica descriptiva = mirar por el retrovisor.** Explica qué ha pasado y por qué, basándose en datos históricos. Busca patrones, tendencias y anomalías en lo que ya ocurrió. Ejemplo: "Las ventas cayeron un 15% en Q3 porque perdimos al cliente X."
>
> - **Analítica predictiva = mirar con prismáticos.** Estima qué pasará en el futuro, basándose en modelos estadísticos o de machine learning. Ejemplo: "Según la tendencia y estacionalidad, las ventas de Q4 serán un 8% superiores al año anterior."
>
> La descriptiva es la base: sin entender bien qué pasó, no puedes predecir qué pasará. En el contexto de la asignatura, el análisis exploratorio visual es fundamentalmente descriptivo — mirar los datos, explorarlos visualmente y sacar insights accionables.

---

### P15. Clustering: K-Means vs Jerárquico

**Pregunta:** Compara K-Means y Clustering Jerárquico: ¿en qué se basan y cuándo usarías cada uno?

> **Respuesta:**
>
> | | K-Means | Clustering Jerárquico |
> |---|---|---|
> | **Método** | Asigna datos al **centroide** más cercano; itera hasta estabilizar | Construye un **dendrograma** (árbol) fusionando o dividiendo grupos |
> | **Requiere** | Definir K (número de clústeres) de antemano | No requiere definir número de clústeres a priori |
> | **Resultado** | K grupos planos, sin estructura interna | Estructura jerárquica con niveles de agrupación |
> | **Escalabilidad** | Rápido, bueno para grandes volúmenes | Lento con muchos datos |
>
> **Cuándo usar K-Means:** Cuando quiero segmentar clientes en un número definido de grupos (ej: 3 segmentos — alto valor, medio, bajo) y tengo muchos datos. Es rápido y directo.
>
> **Cuándo usar Jerárquico:** Cuando no sé cuántos grupos hay y quiero explorar la estructura natural de agrupación. El dendrograma me permite decidir visualmente a qué nivel "cortar" el árbol.

---

### P16. PCA vs t-SNE

**Pregunta:** Diferencia entre PCA y t-SNE. ¿Cuál es lineal y cuál no? ¿Qué preserva cada una?

> **Respuesta:**
>
> | | PCA | t-SNE |
> |---|---|---|
> | **Tipo** | **Lineal** | **No lineal** |
> | **Preserva** | **Varianza global** — estructura general de los datos | **Relaciones locales** — vecindades y clústeres |
> | **Velocidad** | Rápido, escalable | Lento, costoso computacionalmente |
> | **Interpretabilidad** | Alta — cada componente tiene significado (% de varianza explicada) | Baja — los ejes del gráfico no tienen interpretación directa |
> | **Uso principal** | Resumir dimensiones, reducir ruido, paso previo a otros análisis | Visualizar en 2D si hay agrupaciones naturales en datos de alta dimensionalidad |
>
> **Regla rápida:** PCA para entender estructura global y resumir; t-SNE para ver si hay clústeres.
>
> **Ejemplo PCA:** Tengo 20 métricas financieras de clientes y quiero reducirlas a 2-3 factores que expliquen el 80% de la variabilidad. PCA me dice: "el factor 1 es rentabilidad, el factor 2 es riesgo."
>
> **Ejemplo t-SNE:** Tengo datos de comportamiento de 10,000 usuarios web con 50 variables y quiero ver si se agrupan naturalmente en segmentos. t-SNE me genera un gráfico 2D donde los clústeres son visibles.

---

### P17. Correlación vs Causalidad

**Pregunta:** ¿Qué diferencia hay entre correlación y causalidad? ¿Por qué es un error frecuente confundirlas?

> **Respuesta:**
>
> **Correlación** significa que dos variables se mueven juntas — cuando una sube, la otra sube (o baja). Se puede medir estadísticamente.
>
> **Causalidad** significa que una variable **provoca** el cambio en la otra. Implica un mecanismo de causa-efecto demostrable.
>
> **El error:** Asumir que porque dos variables están correlacionadas, una causa la otra. Ejemplo clásico: las ventas de helado y los ahogamientos en piscinas están correlacionados (ambos suben en verano), pero el helado no causa ahogamientos — la variable oculta es el calor/verano que afecta a ambas.
>
> **En el contexto de dashboards:** Si un gráfico de dispersión muestra correlación entre inversión en marketing y ventas, no puedes concluir automáticamente que "más marketing = más ventas". Puede haber factores confusores (estacionalidad, precio, competencia). Para establecer causalidad se necesitan experimentos controlados o análisis más rigurosos.

---

## BLOQUE 4: Automatización y Gobernanza (Tema 5)

### P18. Componentes de Power Automate

**Pregunta:** ¿Cuáles son los 3 componentes clave de un flujo en Power Automate? Describe cada uno y pon un ejemplo completo de un flujo aplicado a negocio.

> **Respuesta:**
>
> 1. **Trigger (Desencadenador):** El evento que inicia el flujo. Puede ser:
>    - Automatizado: basado en un evento (llega un correo, se modifica un archivo)
>    - Programado: basado en tiempo (cada día a las 9h, cada viernes)
>    - Instantáneo: bajo demanda del usuario
>
> 2. **Conectores:** Los servicios o herramientas que participan en el flujo. Ejemplos: Outlook, SharePoint, OneDrive, Excel, Power BI, Teams, SQL Server. Power Automate tiene miles de conectores disponibles.
>
> 3. **Acciones:** Las tareas que se ejecutan cuando se dispara el trigger. Son verbos: enviar email, guardar archivo, actualizar registro, publicar mensaje, refrescar dataset.
>
> **Ejemplo completo:**
> - **Trigger:** Cada lunes a las 8:00 (programado)
> - **Conectores:** Power BI + Outlook + Teams
> - **Acciones:** (1) Refrescar el dataset de ventas semanales en Power BI. (2) Exportar el dashboard como PDF. (3) Enviar el PDF por Outlook al director comercial. (4) Publicar un resumen en el canal de Teams del equipo.
>
> **Característica clave:** Power Automate permite automatizar sin código — los flujos se configuran visualmente, sin programar.

---

### P19. Tipos de trigger

**Pregunta:** Nombra los 3 tipos de trigger que existen en Power Automate y da un ejemplo de cada uno.

> **Respuesta:**
>
> 1. **Automatizado** — se dispara cuando ocurre un evento específico.
>    - Ejemplo: "Cuando llega un email con un archivo adjunto .xlsx a la bandeja de entrada, guárdalo en OneDrive y actualiza el dataset."
>
> 2. **Programado** — se ejecuta en intervalos fijos definidos por el usuario.
>    - Ejemplo: "Todos los viernes a las 18:00, refresca el dashboard de KPIs semanales y envía el informe al equipo."
>
> 3. **Instantáneo** — se ejecuta bajo demanda, cuando el usuario pulsa un botón.
>    - Ejemplo: "El director comercial pulsa un botón en su móvil y recibe inmediatamente un resumen de las ventas del día."

---

### P20. Gobernanza y seguridad

**Pregunta:** ¿Qué es Row Level Security en Power BI y por qué es importante en un entorno profesional? Menciona la normativa que obliga a proteger datos personales en Europa.

> **Respuesta:**
>
> **Row Level Security (RLS)** es un mecanismo de control de acceso a nivel de fila en Power BI. Permite que diferentes usuarios vean solo los datos que les corresponden dentro del mismo informe. Por ejemplo: el director comercial de la zona Norte solo ve datos de la zona Norte; el de la zona Sur solo ve datos de la zona Sur. Ambos acceden al mismo dashboard, pero los datos se filtran según su rol.
>
> **Importancia profesional:**
> - Evita que usuarios accedan a datos que no les corresponden (ej: un vendedor viendo los datos salariales de otro)
> - Permite compartir un único dashboard con toda la organización sin riesgo de fuga de información
> - Es la base de la gobernanza de datos en entornos colaborativos
>
> **Normativa:** En Europa, el **RGPD** (Reglamento General de Protección de Datos) obliga a controlar quién accede a datos personales, con qué fin y dejando registro de acceso. No cumplir el RGPD puede acarrear multas significativas. Esto aplica especialmente a datos médicos, financieros y de carácter personal.

---

## BLOQUE 5: Power BI y Herramientas (Temas 7-8)

### P21. Power BI Desktop vs Service

**Pregunta:** Completa la siguiente tabla comparativa y explica cuál es el flujo profesional típico de trabajo.

> **Respuesta:**
>
> | | Power BI Desktop | Power BI Service |
> |---|---|---|
> | **Entorno** | Local (escritorio, Windows) | Nube (web, app.powerbi.com) |
> | **Diseño de dashboards** | SÍ (función principal) | Limitado |
> | **Limpieza con Power Query** | SÍ (función principal) | Limitado |
> | **Publicar informes** | NO | SÍ |
> | **Automatizar refrescos** | NO | SÍ (requiere licencia Pro) |
> | **Power Automate** | NO | SÍ (requiere licencia Pro) |
> | **Compartir con otros** | NO (solo local) | SÍ (workspaces colaborativos) |
> | **Licencia** | Gratuita | Free / Pro / Premium |
>
> **Flujo profesional:** Diseñar y limpiar en Desktop → Publicar en Service → Configurar refresco automático → Compartir con control de permisos (RLS) → Monitorizar alertas.

---

### P22. Licencias Power BI

**Pregunta:** ¿Qué diferencia hay entre las licencias Free, Pro y Premium de Power BI? ¿Cuál necesitas para automatizar?

> **Respuesta:**
>
> - **Free:** Permite usar Power BI Desktop (diseño local) y Power BI Service con funcionalidades básicas. NO permite automatización, publicación compartida ni refrescos programados.
>
> - **Pro:** Añade capacidades profesionales — publicar en workspaces compartidos, configurar refrescos automáticos, integración con Power Automate, alertas y Row Level Security. Es la licencia mínima para trabajar en equipo y automatizar.
>
> - **Premium:** Capacidades dedicadas con mayor rendimiento, volúmenes de datos más grandes, y funciones avanzadas de IA y análisis. Para grandes organizaciones.
>
> **Para automatizar** se necesita como mínimo **licencia Pro**.

---

### P23. Importancia de Power Query

**Pregunta:** ¿Por qué el profesor insiste en que la limpieza debe hacerse en Power Query y no en Excel? ¿Qué ventaja tiene para el examen?

> **Respuesta:**
>
> Dos razones fundamentales:
>
> 1. **Documentación automática:** Power Query registra cada transformación en "Pasos Aplicados". El corrector puede ver exactamente qué limpieza se hizo, en qué orden y revertir cualquier paso. Si se limpia en Excel, no queda registro — no se puede verificar ni reproducir.
>
> 2. **Reproducibilidad y automatización:** Los pasos de Power Query se aplican automáticamente cada vez que se refrescan los datos. Si mañana llega un dataset actualizado, la misma limpieza se ejecuta sola. En Excel, habría que repetir todo manualmente.
>
> **Para el examen:** El entregable es un archivo `.pbix`. El corrector abrirá Power Query y comprobará los pasos aplicados. Si no hay pasos de transformación visibles, se pierde una parte significativa de la nota de la Fase 2 (ETL), aunque los datos estén limpios — porque no se puede demostrar QUÉ se hizo.

---

### P24. Errores comunes en BI

**Pregunta:** Nombra 4 errores comunes en proyectos de Business Intelligence según lo visto en clase.

> **Respuesta:**
>
> 1. **No limpiar datos antes de visualizar:** Generar dashboards con datos sucios produce conclusiones erróneas. "Basura entra, basura sale."
>
> 2. **Automatizar sin validar:** Configurar un refresco automático sin haber comprobado que todo el flujo (carga, transformación, cálculos) funciona correctamente. Los errores se propagan silenciosamente.
>
> 3. **Compartir sin control de permisos:** Publicar un dashboard sin Row Level Security ni control de acceso. Puede exponer datos sensibles a usuarios no autorizados, violando el RGPD.
>
> 4. **Sobrecarga visual:** Meter demasiadas variables en un solo gráfico, haciendo imposible su interpretación. "Menos es más" — mejor varias vistas coordinadas que un gráfico ilegible.
>
> *(Otros válidos: confundir correlación con causalidad, poner códigos postales/teléfonos como numéricos, no documentar las transformaciones, no decidir el perfil de usuario antes de diseñar)*

---

### P25. Análisis exploratorio

**Pregunta:** ¿Qué es el análisis exploratorio visual y por qué el profesor dice que NO es un extra sino la BASE de la visualización avanzada?

> **Respuesta:**
>
> El análisis exploratorio visual (AEV) es un proceso iterativo de investigación de datos mediante visualizaciones sucesivas. No se trata de hacer un gráfico y sacar una conclusión, sino de un ciclo:
>
> 1. **Visualización inicial** — representar los datos de forma básica
> 2. **Formular hipótesis** — "parece que en verano las ventas bajan"
> 3. **Refinar y profundizar** — añadir filtros, cambiar variables, ajustar escalas
> 4. **Descubrir patrones inesperados** — insights que no se veían en tablas
> 5. **Iterar** — volver al paso 1 con nueva información
>
> Es la BASE porque sin explorar los datos primero, el dashboard final puede estar mal diseñado (no responder a las preguntas correctas) o mostrar datos erróneos (no se detectaron anomalías). El profesor enfatiza que si solo entregas resultados finales sin mostrar el proceso exploratorio, el análisis falla conceptualmente — falta el "por qué" detrás del "qué".
>
> En el examen, la Fase 1 (pre-análisis) es precisamente esto: demostrar que has explorado los datos antes de lanzarte a hacer gráficos.

---

## RESUMEN: TOP 10 CONCEPTOS MÁS PROBABLES EN EL EXAMEN

| # | Concepto | Probabilidad |
|---|----------|-------------|
| 1 | Grafos de red (nodos, aristas, ejemplo) | Muy alta — el profesor lo puso como ejemplo de pregunta |
| 2 | PCA vs t-SNE (lineal vs no lineal) | Muy alta — comparativa directa |
| 3 | Trigger + Conectores + Acciones (Power Automate) | Muy alta — puede caer con pantallazo de flujo |
| 4 | Desktop vs Service (diferencias) | Alta |
| 5 | Errores comunes en BI (nombrar y explicar) | Alta |
| 6 | Gráfico de burbujas (dimensiones) | Alta |
| 7 | Perfiles de usuario (ejecutivo vs analista) | Alta |
| 8 | Tidy Data (3 reglas) | Media-alta |
| 9 | Mapa coroplético (ratios vs absolutos) | Media-alta |
| 10 | Correlación vs causalidad | Media |
