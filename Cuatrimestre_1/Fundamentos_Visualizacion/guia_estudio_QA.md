# Guia de Estudio — Fundamentos de Visualizacion

## Como usar esta guia

Cada seccion tiene formato **Pregunta / Respuesta**. Tapa la respuesta e intenta reconstruirla de memoria antes de mirar. Si fallas, marca la pregunta para repasarla.

---

## BLOQUE 1: Percepcion Visual y Cognicion

### P1. Que son el Sistema 1 y el Sistema 2 de Kahneman y como se aplican al diseno de dashboards?

**R:** Daniel Kahneman distingue dos modos de pensamiento:
- **Sistema 1**: Rapido, intuitivo, automatico. Ejemplo: reconocer una cara enfadada.
- **Sistema 2**: Lento, deliberado, requiere esfuerzo. Ejemplo: calcular 24 x 17.

**Aplicacion**: Un dashboard debe disenarse para el **Sistema 1**. Si el usuario tiene que pararse a descifrar ejes complejos, leyendas confusas o calcular mentalmente, el diseno ha fallado. Buscamos inmediatez perceptiva.

---

### P2. Que son los atributos preatentivos? Nombra al menos 5.

**R:** Son propiedades visuales que el cerebro procesa **antes de la atencion consciente** (en menos de 250ms), activando el Sistema 1. Incluyen:
1. **Color** (tono, saturacion)
2. **Forma** (circulo, cuadrado, triangulo)
3. **Tamano** (grande vs pequeno)
4. **Orientacion** (horizontal, vertical, diagonal)
5. **Movimiento** (parpadeo, desplazamiento)
6. **Posicion** (ubicacion en un plano)

Se usan para que ciertos datos "salten a la vista" sin esfuerzo cognitivo.

---

### P3. Cual es la jerarquia de precision de los atributos visuales segun Cleveland y McGill?

**R:** William Cleveland y Robert McGill demostraron que no todos los canales visuales tienen la misma precision para comparar datos:

**De mas a menos preciso:**
1. **Posicion** sobre escala comun (barras, puntos en eje)
2. **Posicion** sobre escalas no alineadas
3. **Longitud** (barras sin base comun)
4. **Angulo** (graficos de tarta)
5. **Area** (burbujas, treemaps)
6. **Saturacion de color** / sombreado

**Regla practica**: Usa **posicion** para datos criticos (KPIs). Reserva color y area para contexto o agrupacion, nunca para comparaciones finas.

---

### P4. Cuales son las principales Leyes de la Gestalt y como se aplican a visualizacion?

**R:** Las Leyes de la Gestalt explican como el cerebro organiza los estimulos visuales en patrones:

| Ley | Definicion | Aplicacion en dashboards |
|-----|-----------|--------------------------|
| **Proximidad** | Elementos cercanos se perciben como grupo | Usar espacio en blanco para separar secciones del dashboard |
| **Similitud** | Elementos parecidos (color, forma) se agrupan | Usar el mismo color para datos de la misma categoria |
| **Cierre** | El cerebro completa formas incompletas | Lineas de tendencia o patrones que el usuario "completa" |
| **Continuidad** | Seguimos lineas y curvas de manera natural | Graficos de lineas para series temporales |
| **Figura-Fondo** | Distinguimos un objeto (figura) del fondo | Resaltar KPIs sobre fondo neutro |

---

### P5. Que es el ratio datos-tinta de Tufte y por que importa?

**R:** Edward Tufte propuso que en toda visualizacion, la proporcion de tinta dedicada a datos reales debe ser **maxima**, y la tinta decorativa (bordes, fondos, sombras, 3D) debe ser **minima**.

**Formula conceptual**: Ratio datos-tinta = Tinta de datos / Tinta total

**Aplicacion**: Eliminar gridlines innecesarios, fondos decorativos, efectos 3D, bordes redundantes. "Menos es mas". Cada pixel de tinta debe justificarse con un dato.

---

### P6. Que es la carga cognitiva y como se minimiza?

**R:** Es el esfuerzo mental que requiere procesar informacion. En visualizacion, se minimiza:
- Usando atributos preatentivos (Sistema 1)
- Eliminando ruido visual (ratio datos-tinta)
- Limitando el numero de elementos en pantalla
- Usando patrones familiares (barras, lineas) en vez de graficos exoticos
- Aplicando Gestalt para que el cerebro organice la informacion automaticamente

---

## BLOQUE 2: Etica y Manipulacion Visual

### P7. Cuales son las principales tecnicas de manipulacion visual en graficos?

**R:**

1. **Eje Y cortado** (no empieza en 0): Exagera visualmente diferencias pequenas. Un incremento del 2% puede parecer un 200%.
2. **Graficos 3D innecesarios**: Distorsionan por perspectiva. Los trozos de tarta en primer plano parecen mayores. Las barras de atras parecen menores.
3. **Doble eje**: Confunde al lector al usar escalas diferentes. Mejor hacer dos graficos separados.
4. **Escala no proporcional**: Cambiar la gradacion de la leyenda distorsiona completamente la percepcion (especialmente en mapas de coropletas).
5. **Cherry-picking**: Seleccionar solo los datos que apoyan tu narrativa, omitiendo contexto.
6. **Mas de 6 categorias en grafico de tarta**: Ilegible. Mejor usar barras.
7. **Datos sin contexto**: "12 meses de bajada" sin decir cuanto es la bajada ni mostrar el dato numerico.

---

### P8. Que es el Lie Factor de Tufte?

**R:** Es una formula para medir la distorsion visual:

**Lie Factor = Tamano del efecto visual / Tamano del efecto en los datos**

- Si Lie Factor = 1 → representacion honesta
- Si Lie Factor > 1 → la grafica exagera la diferencia
- Si Lie Factor < 1 → la grafica minimiza la diferencia

**Ejemplo**: Si los datos suben un 10% pero visualmente el grafico muestra un incremento que parece del 50%, el Lie Factor es 5.

---

### P9. En que caso esta justificado cortar el eje Y?

**R:** Cuando la variacion pequena es significativa en si misma. El profesor puso el ejemplo del **cambio climatico**: los datos muestran subidas de 1-1.5 grados, que en una escala completa (0-100) serian invisibles. Pero los cientificos dicen que 1.5 grados ya tiene consecuencias desastrosas. En ese caso, cortar el eje para hacer visible la tendencia esta **justificado**, siempre que se indique claramente.

**Clave**: Mismos datos, distintas representaciones, distintas historias. El disenador debe ser honesto sobre por que elige una u otra.

---

### P10. Que es el cuarteto de Anscombe y que demuestra?

**R:** Son 4 datasets creados por el matematico Francis Anscombe donde:
- La media de X es la misma en los 4
- La varianza de X es la misma en los 4
- La media de Y es la misma
- La correlacion es la misma
- La recta de regresion es la misma

**Pero** las distribuciones son completamente diferentes cuando se visualizan. Demuestra que los **estadisticos de resumen pueden enganar** y que la **visualizacion es imprescindible** para entender la distribucion real de los datos.

Existe una version ampliada: el **Datasaurus Dozen** (13 datasets con misma media, varianza y correlacion pero formas completamente distintas, incluyendo un dinosaurio).

---

### P11. Que responsabilidad tiene el disenador de visualizaciones?

**R:** Segun el profesor: "Los graficos son argumentos visuales, no ilustraciones". El disenador tiene la responsabilidad de:
- Ser **honesto y transparente** con los datos
- No manipular la representacion para contar una historia predeterminada
- Plantear la pregunta y dejar que los datos respondan, no al reves
- Considerar la **alfabetizacion visual** de la audiencia
- Anticipar el **modelo mental del usuario** (Alberto Cairo): como va a interpretar la audiencia lo que ve

---

## BLOQUE 3: Seleccion de Graficos

### P12. Que tipo de grafico se usa para cada tarea analitica?

**R:**

| Tarea | Grafico recomendado | Por que |
|-------|-------------------|---------|
| **Evolucion temporal** | Lineas | La continuidad permite seguir la tendencia (Gestalt: continuidad) |
| **Comparar magnitudes** | Barras / Columnas | Usa posicion sobre escala comun (maxima precision, Cleveland & McGill) |
| **Correlacion entre variables** | Scatter (dispersion) | Cada punto es una observacion; la nube revela la relacion |
| **Distribucion geografica** | Mapa (coropletas o burbujas) | Aprovecha el modelo mental espacial del usuario |
| **Composicion / Parte del todo** | Tarta (maximo 5-6 categorias) o barra apilada | Angulo es impreciso; si hay muchas categorias, usar barras |
| **KPI destacado** | BAN (Big Aggregated Number) | Numero grande + tendencia + meta = contexto inmediato |
| **Distribucion de una variable** | Histograma o diagrama de caja (boxplot) | Muestra mediana, cuartiles y outliers |

---

### P13. Por que hay que evitar los graficos de tarta siempre que sea posible?

**R:** Porque:
1. Usan el **angulo** como canal visual, que es impreciso segun Cleveland & McGill
2. Con mas de 5-6 categorias son **ilegibles**
3. El 3D distorsiona las proporciones (los trozos de delante parecen mayores)
4. Los sectores deben sumar 100%; si no, el grafico miente
5. La convencion es ordenar de mayor a menor en sentido horario; si no se respeta, confunde

**Alternativa**: Casi siempre un grafico de barras horizontal es mas preciso y legible.

---

### P14. Que son los BANs y como deben presentarse?

**R:** BAN = **Big Aggregated Number**. Es un KPI mostrado como numero grande y destacado en el dashboard.

**Un BAN aislado no dice nada**. Debe incluir:
- **El numero grande** (ej: "5.2M ventas")
- **Tendencia** (flecha arriba/abajo, % vs periodo anterior)
- **Meta** (linea o indicador de si estamos por encima/debajo del objetivo)
- **Contexto temporal** (este mes, este trimestre, YTD)

---

### P15. Que es un grafico de coropletas y que riesgo tiene?

**R:** Un mapa donde las regiones se colorean segun una variable (ej: votos por distrito).

**Riesgo**: Las regiones grandes dominan visualmente aunque tengan poca poblacion. El profesor uso el ejemplo de **Trump**: el mapa de coropletas mostraba un 80% de rojo, pero Trump solo tenia el 27.7% del voto popular. El cartografo Kenneth Fields demostro que cambiando a un mapa de puntos, la percepcion cambiaba completamente. **Mismos datos, distintas formas graficas, distintas historias.**

---

## BLOQUE 4: Estrategia y BSC (Balanced Scorecard)

### P16. Que es el Balanced Scorecard y cuales son sus 4 perspectivas?

**R:** El BSC (Cuadro de Mando Integral), creado por Kaplan y Norton, organiza la estrategia de una organizacion en 4 perspectivas conectadas por **causa-efecto**:

1. **Aprendizaje y Crecimiento** (base): Formacion, competencias, cultura
2. **Procesos Internos**: Eficiencia operativa, calidad, innovacion
3. **Cliente**: Satisfaccion, retencion, cuota de mercado
4. **Financiera** (cima): Ingresos, rentabilidad, valor para accionistas

**Cadena causal**: Si formo a mi gente (Aprendizaje) → mejoran mis procesos (Procesos) → el cliente esta satisfecho (Cliente) → gano dinero (Financiera).

---

### P17. Que es un KPQ y por que debe ir antes del KPI?

**R:**
- **KPQ** = Key Performance Question (pregunta clave de rendimiento)
- **KPI** = Key Performance Indicator (indicador clave de rendimiento)

El error numero uno es "medir lo que tenemos". La metodologia correcta es:
1. Definir el **objetivo estrategico**
2. Formular la **KPQ**: "Que necesito saber?"
3. Definir el **KPI**: "Que dato responde a esa pregunta?"

**Ejemplo**: Objetivo: mejorar fidelidad → KPQ: "Son fieles mis clientes?" → KPI: "Tasa de retencion anual"

**Clave del profesor**: La KPQ no es la pregunta que le haces al cliente en una encuesta. Es la pregunta estrategica que te haces tu como organizacion.

---

### P18. Que criterios debe cumplir un buen KPI?

**R:** Un KPI debe ser:
- **Medible**: Basado en datos cuantificables
- **Relevante**: Vinculado directamente a un objetivo estrategico
- **Accionable**: Permite tomar decisiones
- **Con meta**: Tiene un umbral o target definido
- **Con plazo**: Se mide en una frecuencia concreta
- **Con responsable**: Alguien es dueno de ese KPI
- **Basado en datos fiables**: Calidad de datos, periodicidad correcta

No se trata de medir 40 cosas. Con 10 KPIs bien construidos, una organizacion tiene de sobra.

---

### P19. Que diferencia hay entre KPIs leading (impulsores) y lagging (rezagados)?

**R:**
- **Leading (impulsores)**: Predicen resultados futuros. Ej: horas de formacion, numero de leads cualificados. Son los que podemos influir directamente.
- **Lagging (rezagados)**: Miden resultados ya producidos. Ej: ingresos del trimestre, tasa de retencion. Son consecuencia de las acciones previas.

En la cadena causa-efecto del BSC, los KPIs de Aprendizaje son leading respecto a los Financieros.

---

## BLOQUE 5: Arquitectura de Dashboards

### P20. Cual es el Mantra de Shneiderman y como se aplica?

**R:** Ben Shneiderman formulo la regla de oro de la interactividad:

**"Vision general primero, zoom y filtro, detalles bajo demanda"**

**Aplicacion en un dashboard**:
1. **Vision general**: BANs / KPIs grandes arriba (el usuario ve el estado general de un vistazo)
2. **Zoom y filtro**: Graficos con filtros cruzados, segmentadores, selectores (el usuario puede profundizar)
3. **Detalles bajo demanda**: Tabla con datos precisos abajo, tooltips al hacer hover

---

### P21. Que es el patron de lectura Z/F y como afecta al layout?

**R:** En culturas occidentales, leemos siguiendo un patron en **Z** (paginas con poco texto) o **F** (paginas con mucho texto):
- El ojo empieza **arriba a la izquierda**
- Recorre horizontalmente
- Baja y vuelve a recorrer

**Aplicacion**: Colocar lo mas critico (BANs, KPI principal) en la **esquina superior izquierda**. Lo menos relevante (tablas de detalle, notas) abajo a la derecha.

---

### P22. Por que el dashboard debe ser de una sola pantalla?

**R:** Porque:
- Fuerza la **priorizacion**: solo cabe lo esencial
- El usuario ve todo **de un vistazo** (vision general de Shneiderman)
- Evita scroll y navegacion que fragmentan la comprension
- La interactividad (filtros cruzados) reemplaza las 20 paginas de un informe estatico
- El usuario **explora** en vez de leer pasivamente

El profesor insiste: "No me hagais un informe de 20 paginas. Resumid. Usad filtros para que el usuario explore."

---

### P23. Como se usa el espacio en blanco en un dashboard?

**R:** El espacio en blanco (o negativo) actua como **separador visual** entre secciones, aplicando la **Ley de Proximidad de la Gestalt**: elementos cercanos se perciben como grupo.

- Separar secciones con espacio, NO con lineas o cajas (que anaden ruido visual)
- Agrupar graficos relacionados juntos
- Dejar respirar los elementos: un dashboard apretado genera carga cognitiva

---

### P24. Que es el Design Thinking aplicado a dashboards?

**R:** Es disenar con **empatia hacia el usuario**:
- Entender **que decision** debe tomar el usuario
- Disenar **solo lo necesario** para facilitar esa decision
- Anticipar el **modelo mental** y la **alfabetizacion visual** de la audiencia
- Priorizar la **accion** sobre la estetica

El profesor dice: "El gran error del analista junior es enamorarse de la herramienta y olvidar al usuario. Disenamos para el cerebro vago (Sistema 1). Disenamos para la accion."

---

## BLOQUE 6: Herramientas (Power BI / Tableau)

### P25. Que es un modelo de datos estrella y por que es importante?

**R:** Es una estructura donde:
- Una **tabla de hechos** central (ej: ventas) contiene las metricas/medidas
- Varias **tablas de dimensiones** alrededor (ej: fecha, producto, cliente, territorio) contienen atributos descriptivos
- Se conectan por **claves** (keys)

Es importante porque permite hacer filtros cruzados, jerarquias y analisis multidimensional sin duplicar datos.

---

### P26. Que es una jerarquia en Power BI y para que sirve?

**R:** Es una organizacion de campos de mayor a menor granularidad. Ejemplo:
- **Geografica**: Pais → Region → Provincia → Ciudad → Codigo Postal
- **Temporal**: Ano → Trimestre → Mes → Dia
- **Producto**: Categoria → Subcategoria → Modelo → Producto

Permite al usuario **subir o bajar de nivel** (drill up / drill down) para explorar los datos a diferente granularidad, siguiendo el mantra de Shneiderman.

---

### P27. Que son los filtros cruzados y por que son esenciales?

**R:** Son la capacidad de que al **clicar en un elemento** de un grafico, el resto de graficos del dashboard **se filtren automaticamente** para mostrar solo los datos relacionados.

Ejemplo: Al clicar en "Francia" en el mapa, el grafico de lineas muestra solo la evolucion de ventas de Francia, y la tabla muestra solo productos vendidos en Francia.

Son esenciales porque:
- Permiten exploracion interactiva (Shneiderman: zoom y filtro)
- Reemplazan la necesidad de multiples paginas estaticas
- El usuario descubre insights por si mismo

---

### P28. Que elementos debe tener un dashboard bien construido para el examen?

**R:** Checklist minimo:
1. **Titulo claro** del dashboard
2. **BANs** arriba a la izquierda (KPIs principales con tendencia)
3. **Grafico de lineas** para evolucion temporal
4. **Grafico de barras** para comparacion de categorias
5. **Mapa** si hay datos geograficos
6. **Segmentadores/filtros** (por fecha, categoria, region)
7. **Filtros cruzados** activos entre graficos
8. **Tabla con formato condicional** para detalle
9. Todo en **una sola pagina**
10. **Justificacion en Word** de cada eleccion citando teoria

---

## BLOQUE 7: Conceptos Transversales

### P29. Que es "garbage in, garbage out" y por que es relevante?

**R:** Si los datos de entrada son basura (incompletos, erroneos, mal estructurados), el resultado sera basura, por muy bonito que sea el dashboard. La calidad de los datos es prerrequisito de cualquier visualizacion util.

---

### P30. Que significa que los graficos son "argumentos visuales"?

**R:** Los graficos no son meras ilustraciones decorativas. Son herramientas de **persuasion** y **comunicacion** que:
- Convencen al espectador de una narrativa
- Pueden ser usados para manipular (intencionada o involuntariamente)
- Necesitan ser **leidos y decodificados**, no solo vistos
- Requieren **alfabetizacion visual** por parte de la audiencia

Por eso el disenador tiene una **responsabilidad etica**: los mismos datos pueden contar historias opuestas segun como se presenten.

---

## AUTORES CLAVE (resumen rapido)

| Autor | Aportacion principal |
|-------|---------------------|
| **Daniel Kahneman** | Sistema 1 (rapido) vs Sistema 2 (lento) |
| **Edward Tufte** | Ratio datos-tinta, Lie Factor, minimalismo visual |
| **Cleveland & McGill** | Jerarquia de precision de atributos visuales |
| **Ben Shneiderman** | Mantra: "Vision general, zoom y filtro, detalles bajo demanda" |
| **Kaplan & Norton** | Balanced Scorecard (4 perspectivas, causa-efecto) |
| **Alberto Cairo** | Arte funcional (4 cualidades), modelo mental del usuario |
| **Leyes de la Gestalt** | Proximidad, similitud, cierre, continuidad, figura-fondo |
| **Francis Anscombe** | Cuarteto de Anscombe (los estadisticos de resumen enganan) |

---

## BLOQUE 8: Dashboards — Tipologia, Requisitos y Reglas

### P31. Cuales son los requisitos minimos de un dashboard?

**R:**
1. **Datos**: Se nutre de datos, muchas veces transformados en metricas
2. **Una sola pantalla**: Condensar toda la informacion de un vistazo
3. **Interactividad**: El usuario puede explorar, filtrar, personalizar. Es lo que diferencia un dashboard de una visualizacion estatica
4. **Informacion actualizada**: Cuanto mas actualizada, mas sincronizada la toma de decisiones
5. **Informacion critica/necesaria**: No mostrar TODA la informacion, sino la necesaria
6. **Equilibrio estetica-funcionalidad**: Alberto Cairo, "El arte funcional"
7. **Personalizacion**: Construido para un target/objetivo concreto
8. **Combinacion texto y grafico**: Titulos, etiquetas, leyendas son imprescindibles

---

### P32. Cuales son los 3 tipos de dashboard segun su rol?

**R:**

| Tipo | Objetivo | Interactividad | Ejemplo |
|------|---------|---------------|---------|
| **Estrategico** | Vision panoramica, toma de decisiones directa | Baja (KPIs globales) | Dashboard para el CEO |
| **Analitico** | Analisis al detalle, comparacion, contexto completo | Alta (filtros, selectores, drill-down) | Dashboard para el equipo de marketing |
| **Monitorizacion** | Detectar eventos y dar respuesta rapida, tiempo real | Media | Trafico web en Black Friday, cotizaciones |

---

### P33. Que es la regla de los 5 segundos y la prueba del punto de fuga?

**R:**
- **Regla de los 5 segundos**: Pedir a alguien que mire el dashboard y vea si encuentra la informacion clave en menos de 5 segundos. Si tarda mas, hay que ajustar el diseno.
- **Prueba del punto de fuga**: Cerrar los ojos, abrirlos y ver hacia donde se dirige naturalmente el ojo. Eso revela la jerarquia visual del dashboard.

---

### P34. Que es la piramide invertida (3 niveles) en un dashboard?

**R:** Estructura logica inspirada en el periodismo:
1. **Nivel 1 (arriba)**: KPIs / BANs — lo mas importante, de un vistazo
2. **Nivel 2 (medio)**: Tendencias que explican los KPIs (lineas, barras)
3. **Nivel 3 (abajo)**: Detalle del analisis (tablas, datos granulares)

Coincide con el Mantra de Shneiderman: vision general → zoom → detalle.

---

### P35. Cuantas metricas debe tener un dashboard?

**R:** Entre **5 y 9 KPIs** (el profesor recomienda 5-6). "Quien mucho abarca poco aprieta." Cada metrica debe responder a un objetivo estrategico. Mejor 5 graficos que se vean bien que 6 que cueste cuadrar.

---

## BLOQUE 9: Visualizacion Exploratoria vs Explicativa y Tipologias

### P36. Que diferencia hay entre visualizacion exploratoria y explicativa?

**R:**

| Aspecto | Exploratoria | Explicativa |
|---------|-------------|-------------|
| **Objetivo** | Descubrir patrones, outliers, formular hipotesis | Comunicar una conclusion, contar una historia |
| **Usuario** | El propio analista | Audiencia (directivos, publico, stakeholders) |
| **Diseno** | Mas denso, menos estetico | Narrativo, resaltar lo relevante, guiar al lector |
| **Interactividad** | Alta (exploracion libre) | Media (guiada) |

**El punto ideal en un dashboard**: A medio camino. Lo suficientemente explicativo para contar una historia, pero lo suficientemente interactivo para que el usuario formule sus propias preguntas.

---

### P37. Que tipologias de visualizacion existen segun la estructura de datos (Viegas/Meirelles)?

**R:** Segun Fernanda Viegas e Isabel Meirelles ("Design for Information"):

| Estructura | Formas graficas | Ejemplo |
|-----------|----------------|---------|
| **Jerarquica** | Treemap, sunburst, arbol radial | Presupuestos, taxonomias |
| **Relacional** | Grafo (nodos y aristas) | Redes sociales, conexiones |
| **Temporal** | Lineas, area, Gantt, rios tematicos | Evolucion ventas, planificacion |
| **Espacial** | Mapas (coropletas, flujos, puntos) | Distribucion geografica |
| **Espaciotemporal** | Mapa + dimension temporal | Trafico, eclipses, poblacion |
| **Textual** | Nubes de palabras, analisis de sentimiento | Resenas, redes sociales |

---

### P38. Que es el principio "la funcion restringe la forma"?

**R:** Primero identificar la **funcion** (correlacionar, comparar, mostrar evolucion, distribucion, magnitud, jerarquia) y **luego** elegir la forma grafica adecuada. No al reves. No elegir un grafico porque "queda bonito" y luego buscar datos que meterle.

---

### P39. Que son los modelos mentales y el sesgo de confirmacion aplicados a visualizacion?

**R:**
- **Modelos mentales** (Norman): Representaciones internas que cada persona tiene sobre como funciona algo. El modelo mental del **disenador** y el del **usuario** pueden no coincidir. Hay que disenar pensando en como el usuario interpreta, no en como el disenador piensa.

- **Sesgo de confirmacion**: Tendencia a aceptar como verdadera la informacion que confirma lo que ya creemos. En visualizacion: si estamos convencidos de que la empresa va bien, no detectaremos problemas en los datos. Ejemplo: mapa de Trump que "confirma" su victoria cuando el dato real dice otra cosa.

---

### P40. Que es la carta figurativa de Minard y por que es relevante?

**R:** Creada por Charles Joseph Minard, considerada la **"Mona Lisa de la visualizacion de datos"**. Muestra la campana de Napoleon en Rusia: partieron ~400.000 soldados, volvieron ~10.000. Condensa en un solo grafico multiples variables: elemento geografico, numerico (grosor de la linea = soldados), temperatura y direccion del flujo. Demuestra que una sola visualizacion bien disenada puede contar una historia compleja y multidimensional.

---

## BLOQUE 10: Conceptos Avanzados (Clases 7-9 y ultima clase)

### P41. Cual es la diferencia entre un CMI (Cuadro de Mando Integral) y un dashboard?

**R:** No son lo mismo aunque se traduzcan igual al espanol:
- **CMI / BSC**: Define la **estrategia** (conceptualizacion estatica). Establece perspectivas, objetivos, KPIs y cadena causa-efecto.
- **Dashboard**: **Monitoriza la ejecucion** de esa estrategia (operacionalizacion dinamica). Visualiza metricas en tiempo real para facilitar la toma de decisiones.

El profesor dice: "El CMI define la estrategia. El dashboard monitoriza la ejecucion de esa estrategia. El dashboard no sustituye al CMI, es su operacionalizacion."

---

### P42. Cuales son las 5 claves para un buen dashboard segun la asignatura?

**R:**
1. **Conocer a la audiencia y definir el proposito** — Para quien es? Que decision debe tomar?
2. **Mostrar metricas clave contextualizadas** — BANs con referencia (meta, tendencia). Un 76% no significa nada si no sabemos si el objetivo era 70 u 80.
3. **Disenar con estructura de cuadricula (modular)** — Componentes en bloques con orden logico. Localizar info en menos de 5 segundos.
4. **Priorizar claridad visual y usar color con intencion** — No decorar. Destacar lo importante. Ejemplo: todas las barras grises excepto la que queremos resaltar.
5. **Interactividad progresiva** — Panoramica (BANs) → granularidad (paises, categorias) → filtrado (seleccion del usuario). Aplicacion directa de Shneiderman.

---

### P43. Que es el decluttering y quien lo propone?

**R:** **Cole Nussbaumer Knaflic** (libro "Storytelling with Data") propone el decluttering: **quitar el desorden visual**. Eliminar elementos redundantes sin perder informacion.

Ejemplos:
- Si dos graficos comparten eje Y, poner el titulo una sola vez
- Si varios graficos comparten eje temporal, no repetirlo en cada uno
- Eliminar gridlines, bordes, sombras que no aporten dato
- Simplificar hasta que solo quede lo esencial

Frase clave: "Llegar a esta simplicidad aparente es complejo."

---

### P44. Que es el Design Thinking y como se aplica a la visualizacion de datos?

**R:** Metodologia centrada en las personas, originada en **IDEO** (Tim Brown). Se basa en:

1. **Empatia**: Entender al usuario antes de disenar. "Para quien estoy presentando esto?"
2. **Definicion**: Localizar el problema correcto que merece resolverse
3. **Ideacion**: Generar soluciones (bocetos, prototipos)
4. **Prototipado**: Entregar versiones parciales para validar
5. **Iteracion**: No acertar a la primera. Ciclos cortos de prueba

**Aplicacion a dashboards**:
- Preguntar al usuario que necesita VER (no asumir)
- Entregar prototipos tempranos (formato, colores, tipo de grafico) antes de completar todo
- "Mas del 70% de los dashboards fallan en su objetivo" por no seguir metodologia

**La maldicion del experto**: Cuando eres muy experto, dejas de hacerte "las preguntas tontas" que el usuario si se hace.

---

### P45. Que es el storytelling con datos y por que importa?

**R:** Comunicar datos a traves de **historias**. El cerebro humano retiene informacion mucho mejor cuando hay narrativa y emocion.

- "Los datos sin historia no se quedan"
- "Mas del 70% de las presentaciones de datos no surten el resultado esperado"
- Un grafico de barras con datos planos no comunica; el mismo grafico con contexto, anotaciones y narrativa si

**Tipos de visualizacion segun narrativa** (Rafa Puerto):
1. **Exploratoria**: El usuario descubre la historia por si mismo
2. **Explicativa**: El disenador cuenta una historia concreta con anotaciones y flechas
3. **Interactiva**: Historias no lineales donde el usuario navega
4. **Dashboard ejecutivo**: Guion visual comprimido para decision rapida

---

### P46. Que es el Doble Diamante (Double Diamond)?

**R:** Proceso de diseno con dos fases de apertura-cierre:
- **Primer diamante**: Descubrir y definir el **problema** (investigar, empatizar, acotar)
- **Segundo diamante**: Crear y prototipar la **solucion** (idear, construir, testear)

Es un proceso **iterativo y circular**, no lineal. Se aplica al diseno de dashboards: primero entender que necesita el usuario, luego disenar la solucion.

---

### P47. Que es un grafico espagueti y como se soluciona?

**R:** Un grafico de lineas con **tantas lineas entrecruzadas** que resulta ilegible. Es un antipatron comun.

**Solucion**: Destacar solo la linea seleccionada y dejar el resto en gris/segundo plano. O usar **small multiples** (parrilla de minigraficos), donde cada variable tiene su propio grafico pequeno para facilitar la comparacion.

---

### P48. Que es el scrollytelling?

**R:** Combinacion de scroll + storytelling. Al hacer scroll en una pagina web, los graficos van cambiando sincronizados con el texto narrativo. Muy usado en **periodismo de datos**.

Medios referentes: New York Times, La Nacion (Argentina), El Pais (Espana). Herramienta: Flourish (version de pago).

---

### P49. Que significa que "el 80% del tiempo se va en preparacion de datos"?

**R:** Principio de **Pareto aplicado a BI**: la limpieza, deteccion de duplicados, celdas vacias, columnas innecesarias y transformacion de datos se lleva el 80% del esfuerzo. Solo el 20% es visualizacion real.

En el examen, el dataset viene limpio, asi que todo el tiempo se dedica a visualizar. Pero en la vida real, "garbage in, garbage out": si los datos estan sucios, el dashboard sera inutil.

---

### P50. Que herramientas web de visualizacion existen y para que sirven?

**R:**

| Herramienta | Uso principal | Limitacion |
|-------------|--------------|------------|
| **Flourish** | La mas completa. Graficos interactivos, storytelling, embeber en web | NO sirve para dashboards |
| **DataWrapper** | Usada en medios (TVE). Graficos sencillos | Limitada en interactividad |
| **Infogram** | Marketing, infografias basicas | Demasiado basica para BI |
| **Raw Graphs** | Codigo abierto, similar a las anteriores | Funcionalidad limitada |

**Para dashboards**: usar siempre **Power BI** o **Tableau**, no herramientas web.

---

## BLOQUE 11: Frases-mantra del profesor (las mas repetidas en clase)

### P51. Que significa "no hay visualizaciones perfectas, sino adecuadas" y "la funcion restringe la forma"?

**R:** Son los dos principios que el profesor repite en TODAS las clases:

- **"No hay visualizaciones perfectas, sino adecuadas"**: No existe una relacion mecanica "dato X = grafico Y". La eleccion depende de la funcion, la audiencia y la pregunta que se quiere responder. Siempre hay margen de decision.

- **"La funcion restringe la forma"**: A diferencia del funcionalismo ("la forma sigue a la funcion"), en visualizacion la funcion no **determina** una unica forma, sino que **restringe** las opciones. Primero identificar que quiero (comparar, correlacionar, mostrar evolucion), y eso me limita a un subconjunto de graficos validos.

---

### P52. Que cuatro cualidades debe tener una buena visualizacion segun Alberto Cairo?

**R:** Alberto Cairo define la visualizacion como un "arte funcional" con 4 cualidades:
1. **Funcional**: Tiene una utilidad practica
2. **Bella**: Es estetica, entra por el ojo
3. **Reveladora**: Permite descubrir algo nuevo (insight)
4. **Iluminadora**: Cambia el estado de conocimiento del observador

---

### P53. Que significa "una imagen vale mas CON mil palabras"?

**R:** Twist del dicho popular. En visualizacion de datos, la imagen **sola no se explica**. Hay que combinar:
- Titulo descriptivo
- Etiquetas de ejes con unidades
- Anotaciones en puntos clave
- Leyenda clara
- Fuente de datos

El profesor dice: **"Show AND tell"**, no solo "show don't tell". Hay que **mostrar Y contar**. Los datos no hablan por si mismos: somos nosotros quienes debemos destacar y ayudar al lector a ver el patron.

---

### P54. Cuales son las reglas de uso del color en visualizacion?

**R:**
- **Usar con intencion**: El color llama la atencion y focaliza la mirada. No decorar.
- **Minimalismo cromatico**: 2-3 colores bastan. Grises para lo que no destaca, color puro para lo que si.
- **Consistencia**: El mismo color = la misma categoria en todo el dashboard.
- **Daltonismo**: Hasta el 10% de la poblacion. **Evitar rojo + verde juntos** (se ven como marron).
- **Fisiologia**: Somos mas sensibles al naranja/amarillo (estimula conos rojos Y verdes) que al azul (un solo cono). Con la edad, perdemos sensibilidad a azules y violetas.
- **Truco del profesor**: Poner el titulo de una seccion en el MISMO color que usa esa seccion en el grafico → refuerza la asociacion visual.

---

### P55. Quienes son los pioneros historicos de la visualizacion de datos?

**R:**

| Pionero | Aportacion | Importancia |
|---------|-----------|-------------|
| **William Playfair** (1786) | Invento el grafico de lineas y el grafico de barras | Fundador del lenguaje grafico moderno |
| **John Snow** (1854) | Mapa del colera de Londres (pozo de Broad Street) | Demostro que el colera se transmitia por agua, no por aire. "Visualizar datos salva vidas" |
| **Florence Nightingale** | Diagrama de area polar ("coxcomb") | Demostro que la mayoria de muertes en guerra eran por infecciones, no por heridas |
| **Charles J. Minard** | Carta figurativa de la campana de Napoleon | "La Mona Lisa de la visualizacion": multiples variables en un solo grafico |

La **primera edad dorada** de la visualizacion fue el **siglo XIX**, cuando se inventaron todas las formas graficas principales a mano.

---

## AUTORES CLAVE (resumen rapido)

| Autor | Aportacion principal |
|-------|---------------------|
| **Daniel Kahneman** | Sistema 1 (rapido) vs Sistema 2 (lento) |
| **Edward Tufte** | Ratio datos-tinta, Lie Factor, minimalismo visual |
| **Cleveland & McGill** | Jerarquia de precision de atributos visuales |
| **Ben Shneiderman** | Mantra: "Vision general, zoom y filtro, detalles bajo demanda" |
| **Kaplan & Norton** | Balanced Scorecard (4 perspectivas, causa-efecto) |
| **Alberto Cairo** | Arte funcional (4 cualidades), modelo mental del usuario |
| **Leyes de la Gestalt** | Proximidad, similitud, cierre, continuidad, figura-fondo |
| **Francis Anscombe** | Cuarteto de Anscombe (los estadisticos de resumen enganan) |
| **Cole Nussbaumer Knaflic** | Decluttering, Storytelling with Data |
| **Tim Brown / IDEO** | Design Thinking centrado en personas |
| **Rafa Puerto** | Design Thinking aplicado a datos, empatia, storytelling |
| **Norman** | Modelos mentales (el disenador y el usuario ven cosas distintas) |
| **Alberto Cairo** | "El arte funcional": equilibrio estetica-funcionalidad |
| **Fernanda Viegas / Isabel Meirelles** | Tipologia de visualizaciones segun estructura de datos |
| **Charles Joseph Minard** | Carta figurativa de Napoleon ("Mona Lisa de la visualizacion") |
| **Euler** | Teoria de grafos (puentes de Konigsberg, nodos y aristas) |
| **William Playfair** | Invento el grafico de lineas y barras (1786) |
| **John Snow** | Mapa del colera de Londres (1854), "visualizar salva vidas" |
| **Florence Nightingale** | Diagrama coxcomb: muertes por infeccion > heridas |
| **Lev Kuleshov** | Efecto Kuleshov: misma imagen, distintos contextos, distintas interpretaciones |
| **Kenneth Field** | Cartografo que rediseno mapa de Trump (coropletas → puntos) |

---

## ESTRATEGIA DE EXAMEN (del profesor Javier Canton)

1. **Empezar por Parte 2** (critica visual, 3 pts) para asegurar puntos con teoria fresca
2. **Bocetar en papel** el layout del dashboard antes de abrir Power BI (2 min)
3. **No complicarse con DAX** — el examen evalua visualizacion, no programacion
4. **Pegar capturas** en el Word: una normal + una con filtro aplicado para demostrar interactividad
5. **Barras, columnas y lineas** resuelven el 80-85% de los graficos
6. El dataset estara limpio — no perder tiempo en limpieza de datos
7. **Usar Power BI version escritorio** (no web), porque la web saltaria alarma del proctoring
8. El examen se hace en 1h - 1h15min, hay **2 horas** de sobra
9. Se daran **objetivos y KPIs sugeridos** en el enunciado
10. **Rara vez se suspende** si se ha llevado la evaluacion continua
