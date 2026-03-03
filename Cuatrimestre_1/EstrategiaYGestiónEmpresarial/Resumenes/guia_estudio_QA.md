# Guia de Estudio — Estrategia y Gestion Empresarial Basada en Analisis de Datos

## Como usar esta guia

Cada seccion tiene formato **Pregunta / Respuesta**. Tapa la respuesta e intenta reconstruirla de memoria antes de mirar. Si fallas, marca la pregunta para repasarla.

Basada al 100% en lo que el profesor Gerardo enseña en sus sesiones (1-10, 14), con sus propios ejemplos, frases y casos reales. Lo que no aparece aqui, no lo enseño.

---

## BLOQUE 1: Inteligencia de Negocio y Estrategia

### P1. Que es la Inteligencia de Negocio (BI) y cuales son sus 5 elementos?

**R:** BI no es solo tecnologia. Gerardo insiste: es la integracion de cinco elementos que funcionan como vasos comunicantes:

1. **Procesos**: Metodologias e infraestructuras
2. **Tecnologia**: Infraestructura (Cloud, On-premise)
3. **Herramientas**: Software (Tableau, PowerBI, SAP, Python)
4. **Personas**: El elemento central y mas dificil de copiar por la competencia (ventaja competitiva)
5. **Capacidades**: Musculo financiero y organizativo

**Error tipico**: Pensar que BI es "comprar Tableau". Sin personas ni procesos, la herramienta no sirve.

**Flujo critico**: Datos → Informacion → Conocimiento → Decision → **Accion** (el fin ultimo es la accionabilidad).

*Frase de Gerardo: "BI no es una herramienta, son 5 elementos: procesos, tecnologia, herramientas, personas y capacidades."*

---

### P2. Que es una decision HIPPO y por que es un riesgo?

**R:** **HIPPO** = Highest Paid Person's Opinion. Es cuando la persona con mas autoridad toma una decision basandose en su intuicion, sin evidencia analitica.

**Riesgos**:
- La hipotesis puede ser incorrecta
- No se puede medir por que funciono o fracaso
- Se invierte sin validar
- Se aplican acciones genericas en lugar de segmentadas

**Contraste con Data-Driven**: En el enfoque data-driven, los datos condicionan la decision (no la justifican a posteriori). El dato va primero, la decision despues.

*Frase de Gerardo: "HIPPO: el mayor enemigo de la decision data-driven."*

---

### P3. Que significa Customer Centricity?

**R:** Pasar de una estrategia centrada en el producto a una centrada en el **cliente como unidad de analisis**. El mercado es heterogeneo: diferentes clientes tienen diferentes necesidades, comportamientos y valor.

**Implicacion**: No se puede tratar a todos los clientes igual. De ahi la necesidad de segmentar.

*Ejemplo de Gerardo: Coca-Cola — vendemos una "bebida" o una "experiencia"? El enfoque customer-centric mira desde el cliente, no desde la fabrica.*

*Frase: "El cliente es el activo, no el producto."*

---

### P4. Cuales son las fases del ciclo de vida del cliente?

**R:**

| Fase | Objetivo | Accion tipica |
|------|---------|--------------|
| **Captacion** | Atraer nuevos clientes | Ofertas de bienvenida, primera compra |
| **Activacion** | Conseguir que usen el producto | Onboarding, tutorial |
| **Desarrollo** | Aumentar su valor | Cross-selling, Up-selling |
| **Fidelizacion** | Mantener la relacion | Programa de puntos, servicio premium |
| **Reactivacion / Churn** | Recuperar o aceptar la perdida | Campana de retencion, oferta de vuelta |

Cada fase tiene metricas y acciones distintas. Un error comun es aplicar la misma accion a todas las fases.

*Ejemplo: CaixaBank — modelo predictivo de churn que identifica clientes con probabilidad de cancelar ANTES de que cancelen.*

---

### P5. Que es cross-selling y que es up-selling?

**R:**
- **Cross-selling** (venta cruzada): Que compre **mas categorias**. Ej: si compra pintura, ofrecerle rodillos.
- **Up-selling** (venta ascendente): Que compre **productos de mayor valor**. Ej: si compra pintura basica, ofrecerle premium.

Ambos pertenecen a la fase de **desarrollo** del ciclo de vida.

---

### P6. Cual es el ciclo Intelligence-Action?

**R:** El flujo virtuoso que Gerardo enfatiza como motor de la estrategia data-driven:

```
1. Propuesta de valor
2. Drivers de informacion (que datos necesito?)
3. Proceso de analisis (segmentacion, modelos, valor cliente)
4. Accionabilidad (definicion de la accion)
5. Gestor de campanas (ejecucion, registro de impactos)
6. Analisis de resultados (ROI, KPIs)
7. Nueva propuesta (CIERRA EL CICLO → vuelve a 1)
```

**Es un ciclo**: los resultados alimentan la siguiente iteracion. No es lineal.

*Frase: "Accion sin analisis es intuicion; analisis sin accion es academia." / "El proceso inteligencia-accion nunca termina: cada resultado alimenta la siguiente propuesta."*

---

### P7. Que es un KPI SMART? Pon un ejemplo bien y otro mal.

**R:**
- **S**pecifico: Que metrica concreta
- **M**edible: Con dato cuantificable
- **A**lcanzable: Realista
- **R**elevante: Vinculado a un objetivo estrategico
- **T**emporal: Con plazo definido

**Mal**: "Aumentar las ventas" → no tiene metrica, ni plazo, ni segmento, ni referencia.

**Bien**: "Incrementar el ticket medio del segmento ocasional de 18€ a 23€ durante los 3 meses de campana."

*Frase de Gerardo: "Un KPI sin fecha limite no es un KPI, es un deseo." / "Un KPI sin objetivo de negocio es una metrica disfrazada de KPI."*

---

### P8. Cuales son los 4 niveles de madurez analitica de una empresa?

**R:** (Sesion 4, experto de SAS)

| Nivel | Nombre | Pregunta que responde | Ejemplo |
|-------|--------|----------------------|---------|
| 1 | **Descriptivo** | ¿Que paso? | Reportes historicos, informes mensuales |
| 2 | **Diagnostico** | ¿Por que paso? | Analisis causal, drill-down |
| 3 | **Predictivo** | ¿Que va a pasar? | Modelos, forecasting |
| 4 | **Prescriptivo** | ¿Que debemos hacer? | Optimizacion, recomendacion automatizada |

La mayoria de empresas espanolas estan en nivel 1-2. El objetivo es llegar al 3-4.

*Frase del experto: "El mejor modelo es el que se usa, no el mas sofisticado."*

---

### P9. Que es la metodologia divergencia-convergencia?

**R:** (Sesion 9, Actividad 3)

- **Fase divergente**: Explorar sin juicios previos. Generar muchas hipotesis. No filtrar nada.
- **Fase convergente**: Filtrar, priorizar, profundizar en lo que tiene mas valor de negocio. Elegir 3-4 lineas con impacto real.

**Error mas comun**: Ir directamente a converger. Saltar al primer analisis que se te ocurre y perderte lo interesante.

*Frase: "Divergir antes de converger. Siempre."*

---

## BLOQUE 2: BEP de Promociones

### P10. Que es el BEP y cual es el principio fundamental de toda promocion?

**R:** **BEP** = Break Even Point. Punto donde el margen incremental generado iguala el coste de la promocion.

**Principio fundamental**: Toda promocion es una **destruccion voluntaria de margen** con la esperanza de compensarlo con mayor volumen.

```
BEP → Margen Incremental - Coste de la Promocion = 0
```

---

### P11. Cuales son las dos palancas del BEP?

**R:**

| Palanca | Que mide | Metrica |
|---------|---------|---------|
| **Respuesta (r)** | Que compren MAS clientes | Tasa de conversion |
| **Gasto (g)** | Que cada cliente gaste MAS | Incremento de ticket medio |

**Importante**: g es incremento en **facturacion**, no en margen. El margen es consecuencia (ej: si margen = 35%, +10€ facturacion = +3,50€ margen).

---

### P12. Cual es la formula de la matriz de escenarios?

**R:**
```
Margen Neto = N × r × (Margen_unitario × g - Coste_oferta)
```

Se cruzan % de r con % de g. Cada celda muestra si ganas o pierdes. La oferta mas eficiente alcanza el BEP con los incrementos mas bajos.

**BEP por oferta** = Coste_oferta / Margen_unitario

---

### P13. Que es la dilucion y el threshold?

**R:** **Dilucion** = regalar descuento a clientes que habrian comprado igual. Es el coste oculto mas peligroso.

**Threshold** (exigencia) = condicion por encima del comportamiento habitual para acceder a la oferta. Si el ticket medio es 200€, la exigencia debe ser superior (ej: 250€).

**Proxy**: Media de los 3 tickets maximos del ultimo trimestre como estimacion del potencial real del cliente.

---

### P14. Por que la segmentacion previa es imprescindible?

**R:** Porque el BEP es **distinto por segmento**. Cada segmento tiene diferente ticket, margen, frecuencia y comportamiento ante ofertas. Sin segmentar, la dilucion se come la rentabilidad.

---

## BLOQUE 3: Gobierno del Dato y Etica (RGPD)

### P15. Que es el RGPD?

**R:** Reglamento General de Proteccion de Datos. Normativa europea (2018) que regula como las empresas tratan datos de personas fisicas. Obligatorio para cualquier empresa que trate datos de ciudadanos de la UE.

**Multas**: Hasta 20 millones de euros o el 4% de la facturacion global anual (la que sea mayor). "A Meta le han multado con mas de 1.000 millones."

Para el examen: **no recitar la ley**, sino identificar que principios se vulneran en un caso practico.

---

### P16. Cuales son los 7 principios del RGPD?

**R:** (Sesion 6, experto ONTIER. Gerardo los confirma como material de examen.)

| # | Principio | Significado | Ejemplo de violacion |
|---|-----------|------------|---------------------|
| 1 | **Licitud, lealtad y transparencia** | El tratamiento debe tener base legal y el usuario debe saberlo | Tratar datos sin informar al usuario |
| 2 | **Limitacion de finalidad** | Los datos recogidos para un fin NO pueden usarse para otro | Cambridge Analytica: datos academicos usados para politica |
| 3 | **Minimizacion** | Solo recoger lo estrictamente necesario | Pedir geolocalizacion para un servicio que no la necesita |
| 4 | **Exactitud** | Datos actualizados y correctos | Guardar CVs de hace 10 anos para enviar publicidad |
| 5 | **Limitacion del plazo de conservacion** | No guardar datos mas tiempo del necesario | Mantener datos de clientes dados de baja hace 5 anos |
| 6 | **Integridad y confidencialidad** | Proteger de accesos no autorizados y perdidas | Base de datos de clientes sin cifrar |
| 7 | **Responsabilidad proactiva (accountability)** | La empresa debe poder DEMOSTRAR que cumple, no solo cumplir | Facebook no tenia controles para detectar uso indebido |

*Frase: "Accountability: no basta con cumplir, hay que poder demostrarlo."*

**Clave examen**: Siempre hay mas de un principio vulnerado. Identificar TODOS.

---

### P17. Que tipos de datos personales existen?

**R:**
- **Dato personal**: Cualquier informacion que identifique o haga identificable a una persona. Incluye: nombre, email, IP, geolocalizacion, ID dispositivo, comportamiento de compra, voz, imagen.
- **Dato anonimizado**: Sin posibilidad de identificacion → ya NO es dato personal.
- **Dato pseudoanonimizado**: Re-identificable con clave → SIGUE siendo dato personal.
- **Datos sensibles (categorias especiales)**: Salud, orientacion sexual, ideologia politica, religion, origen etnico, biometria, genetica. Requieren proteccion reforzada y consentimiento adicional.

---

### P18. Cuales son las bases de legitimacion para tratar datos?

**R:** Por que tengo derecho a tratar el dato:

1. **Consentimiento** (el mas comun en marketing)
2. **Ejecucion de un contrato**
3. **Interes legitimo** (mas complejo, requiere ponderacion)
4. **Obligacion legal**
5. **Interes vital**
6. **Mision de interes publico**

*Frase: "Sin base de legitimacion, el tratamiento es ilegal, aunque el usuario no se queje."*

---

### P19. Como debe ser el consentimiento segun el RGPD?

**R:** Debe ser: **libre, especifico, informado e inequivoco**.

- El silencio NO es consentimiento
- La casilla premarcada NO es consentimiento
- Finalidad distinta = nuevo consentimiento

*Frase: "El silencio no es consentimiento. La casilla premarcada no es consentimiento."*

---

### P20. Que paso en Cambridge Analytica y que principios se vulneraron?

**R:** Cadena de eventos:
1. Aleksandr Kogan crea app de quiz en Facebook ("This Is Your Digital Life")
2. La app pide permisos para acceder a datos del usuario Y de todos sus amigos
3. 270.000 usuarios la instalan → se recogen datos de **87 millones**
4. Los datos se venden a Cambridge Analytica (prohibido por ToS de Facebook, pero Facebook no lo controla)
5. Cambridge Analytica crea perfiles psicograficos (modelo OCEAN) para microtargeting politico (Brexit, Trump 2016)

**Principios vulnerados**:
1. **Limitacion de finalidad**: datos recogidos para "conectar amigos", usados para politica
2. **Minimizacion**: datos de amigos de amigos sin necesidad
3. **Transparencia**: los usuarios no sabian que sus datos llegarian a Cambridge Analytica
4. **Consentimiento**: no cubria el uso final
5. **Accountability**: Facebook no tenia controles
6. **Integridad/confidencialidad**: no se protegio el acceso

*Frase de Gerardo: "El problema no es que alguien hiciera algo malo. El problema es que Facebook tenia un sistema que lo permitia estructuralmente."*

---

### P21. Que es el Business Compliance y que es un DPO?

**R:** **Business Compliance** = conjunto de procesos, controles y politicas para asegurar que la actividad cumple con la normativa legal y etica. Incluye:
- Politicas internas documentadas
- Auditorias periodicas
- Formacion de empleados
- Registro de actividades de tratamiento
- Evaluaciones de impacto (**DPIA**)
- Canales de denuncia

**DPO** = Delegado de Proteccion de Datos. Obligatorio en organismos publicos y empresas que tratan datos a gran escala. Es independiente de la empresa.

**DPIA** = Evaluacion de Impacto. Obligatoria cuando un tratamiento tiene alto riesgo para los derechos de los afectados.

*Frase: "La compliance es cara, pero la no-compliance es mucho mas cara."*

---

## BLOQUE 4: Infraestructura BI

### P22. Que es el proceso ETL?

**R:** **ETL** = Extract, Transform, Load. Es el proceso que alimenta el Data Warehouse.

- **Extract**: Sacar datos de los sistemas fuente (ERP, CRM, facturacion, ficheros). "Cada sistema habla un idioma distinto."
- **Transform**: Limpiar, estandarizar, enriquecer, deduplicar. **"Aqui esta el 80% del trabajo. La T es el corazon del ETL."**
- **Load**: Cargar los datos limpios en el Data Warehouse.

**Ejemplos de problemas en la T** (del propio Gerardo):
- Email: juan@gmail.com vs Juan@GMAIL.COM → mismo cliente, doble entrada
- Direccion: "Calle Mayor 1, 1A" vs "C/ Mayor 1 - 1A" → mismo domicilio, tres registros
- Nombre: con y sin tilde, con y sin segundo apellido

*Frase: "ETL: el gran desconocido. Todo el mundo quiere el dashboard bonito, nadie quiere hacer la fontaneria."*

*"Si tu base de datos tiene un 15% de duplicados, tus tasas de respuesta a campanas son 15% peores de lo que crees."*

---

### P23. Que es un Data Warehouse?

**R:** Repositorio unico, centralizado, historico y orientado a analisis. **No es una base de datos operacional.**

Caracteristicas:
- **Integrado**: consolida datos de multiples fuentes
- **Historico**: guarda el historico (no sobreescribe)
- **No volatil**: no cambia una vez cargado
- **Orientado a la toma de decisiones**

---

### P24. Que es el Golden Record?

**R:** La **version unica y veraz** de una entidad (cliente, producto) tras unificar duplicados de diferentes sistemas.

*Ejemplo: "J. Garcia" en CRM + "Juan Garcia Lopez" en facturacion + "Juan Garcia" en atencion al cliente = un unico Golden Record.*

**Sin Golden Record**, tratas al mismo cliente como tres distintos. Cualquier analisis esta distorsionado.

*Frase: "El Golden Record no es un concepto tecnico: es una decision de negocio sobre cual es la verdad."*

---

### P25. Modelo Estrella vs Copo de Nieve?

**R:**

| Aspecto | Estrella | Copo de Nieve |
|---------|---------|---------------|
| **Estructura** | Tabla de hechos central + dimensiones planas | Dimensiones normalizadas en jerarquias |
| **Tablas** | Menos (desnormalizado) | Mas (normalizado) |
| **Velocidad** | **Mas rapido** (menos joins) | Mas lento |
| **Espacio** | Ocupa mas (redundancia) | Ahorra espacio |
| **Cuando elegir** | Cuando prima velocidad (BI) | Cuando prima espacio |

*Frase: "Modelo estrella: sacrificas espacio, ganas velocidad. En BI, la velocidad manda."*

---

### P26. Que es una tabla de hechos y una tabla de dimensiones?

**R:**
- **Tabla de hechos** (fact table): Datos transaccionales/metricas. Ej: VENTAS (cantidad, importe, fecha_id, cliente_id, producto_id). Centro del modelo.
- **Tablas de dimensiones**: Contexto descriptivo. Ej: CLIENTE (nombre, segmento, ciudad), PRODUCTO (categoria, marca), TIEMPO (mes, trimestre, ano).

Las dimensiones son las variables "por las que" se analiza (ventas **por** producto, **por** region, **por** mes).

---

### P27. Que es un Data Mart? Y la diferencia entre CRM, ERP y DW?

**R:** **Data Mart** = subconjunto del Data Warehouse para un departamento concreto (Comercial, Finanzas, Logistica). "Rodajas del DW."

| Sistema | Tipo | Funcion |
|---------|------|---------|
| **CRM** | Operacional | Gestion de clientes (contacto, interacciones) |
| **ERP** (ej: SAP) | Operacional | Gestion de empresa (pedidos, facturacion, inventario) |
| **DW** | Analitico | Consolida CRM + ERP + otras fuentes para analizar |

CRM y ERP son **fuentes de datos** para el DW. El DW no es operacional.

---

## BLOQUE 5: Interpretacion Analitica

### P28. Supervisado vs No supervisado?

**R:**

| Aspecto | Supervisado | No supervisado |
|---------|------------|---------------|
| **Variable objetivo** | SI (ej: churn Si/No) | NO (busca patrones solo) |
| **Que hace** | Predice o clasifica | Agrupa por similitud |
| **Ejemplos** | Arbol de decision, Regresion logistica | Clustering K-Means |

---

### P29. Que es el clustering K-Means y como se interpreta?

**R:** Tecnica **no supervisada** que agrupa datos en k grupos por similitud. El algoritmo no sabe que significan los grupos.

**Como interpretar** (lo que pide el examen):
1. Mirar las **medias de cada variable** por cluster
2. Comparar: cual tiene mayor/menor valor en cada variable
3. Asignar un **nombre descriptivo** (ej: "VIP", "Nuevos", "En riesgo")
4. Proponer **estrategia diferenciada** vinculada al ciclo de vida
5. **Citar los numeros**: no "gastan mucho", sino "gastan 120€/mes, 3 veces mas que el cluster 1"

---

### P30. Que es un arbol de decision y como se lee?

**R:** Modelo **supervisado** que genera reglas jerarquicas legibles:
- **Nodo raiz** (arriba): variable mas discriminante
- **Ramas**: reglas ("Si X > umbral")
- **Hojas** (final): probabilidad de cada clase

**Ejemplo**: "Si Gasto > 80€ y Antiguedad > 24 meses → VIP (probabilidad 94%)"

Para el examen: leer las reglas y **traducirlas a lenguaje de negocio**.

---

### P31. Que es "enganar al ordenador"?

**R:** Usar un modelo **supervisado** (arbol) para explicar el resultado de un modelo **no supervisado** (clusters).

```
Paso 1: K-Means → genera grupos (pero NO explica por que)
Paso 2: Arbol de decision → usa el grupo como variable objetivo → genera reglas legibles
```

**Utilidad**: El equipo comercial puede clasificar clientes con reglas simples sin ejecutar modelos. Tambien permite detectar clientes "cerca" de cambiar de segmento.

---

### P32. Que es la regresion logistica a nivel conceptual?

**R:** Modelo supervisado que predice variables **binarias** (Si/No, 0/1). Determina que variables influyen realmente en el resultado (las significativas, P < 0,05) y cuales no.

**Para esta asignatura**: Saber que existe, que es supervisado, que clasifica en dos grupos y que identifica variables significativas. No te pediran leer tablas de coeficientes.

**Diferencia critica con arbol**: El arbol genera reglas legibles. La regresion genera probabilidades. Son modelos **completamente distintos**.

---

### P33. Que es la correlacion de Pearson y por que correlacion NO implica causalidad?

**R:** Coeficiente entre -1 y +1:
- +1: correlacion perfecta positiva
- 0: sin correlacion lineal
- -1: correlacion perfecta negativa

**Correlacion ≠ Causalidad**: Que dos variables se muevan juntas no significa que una cause la otra.

*Ejemplo de Gerardo: "Que el helado y los ahogamientos esten correlacionados no significa que el helado mate. Ambos suben en verano."*

*Gerardo lo dice textualmente al menos 3 veces a lo largo del curso.*

---

### P34. Que es una matriz de confusion a nivel conceptual?

**R:**

|  | Predicho: SI | Predicho: NO |
|--|-------------|-------------|
| **Real: SI** | Verdadero Positivo | Falso Negativo (oportunidad perdida) |
| **Real: NO** | Falso Positivo (coste desperdiciado) | Verdadero Negativo |

**En negocio**: Falso Positivo = gastas en oferta para alguien que no responde. Falso Negativo = pierdes un cliente que habrias retenido.

---

### P35. Mediana vs Media: cuando usar cada una?

**R:**
- **Media**: Sensible a outliers. Usar cuando la distribucion es simetrica.
- **Mediana**: Robusta a outliers. Usar cuando hay valores extremos.

*Ejemplo de Gerardo: "Si en una calle vive Bill Gates y 9 personas normales, la media de riqueza es enorme. La mediana sigue siendo normal."*

*"Para variables con outliers, usad siempre la mediana."*

---

### P36. Que es un outlier y que es un sanity check?

**R:** **Outlier** = valor atipico que se aleja del comportamiento normal. Puede ser un error de captura (99.999€ en vez de 99,99€) o un valor real pero excepcional (alojamiento de lujo a 10.000$/noche).

**Sanity check** = validar la calidad del dato ANTES de analizar. ¿Hay nulos? ¿Outliers? ¿Duplicados? ¿Los rangos tienen sentido?

*Frase: "Primero sanity check, luego analisis. Basura entra, basura sale." / "El dato malo es peor que no tener dato: te lleva a una decision equivocada con seguridad."*

---

### P37. Que son las series temporales a nivel conceptual?

**R:** Analisis de datos con frecuencia temporal (diaria, mensual, trimestral) para identificar tendencias y hacer predicciones (forecast). Requieren una variable temporal y una frecuencia definida.

*Del experto SAS: "El primer modelo que hace cualquier empresa es una prevision de ventas." Es el que mas rapido genera valor percibido por la direccion.*

---

## BLOQUE 6: Visualizacion

### P38. Por que importa la visualizacion?

**R:** *Frase central de Gerardo: "Olvido lo que leo, recuerdo lo que veo."*

"El cerebro procesa imagenes 60.000 veces mas rapido que texto. Una tabla de 1.000 filas no comunica. Un grafico de barras comunica en 3 segundos."

*Caso real: Un gobierno espanol publico un grafico de COVID con el eje Y invertido. Los numeros iban de mayor a menor de abajo a arriba, sugiriendo que los casos bajaban cuando en realidad subian. "Una visualizacion mal hecha no es un error estetico. Es un error de decision."*

---

### P39. Cuales son los principios de diseno de un buen dashboard?

**R:**
1. **Una historia por dashboard**: no meter todo. Cada pantalla tiene un mensaje claro.
2. **Jerarquia visual**: lo mas importante arriba a la izquierda (donde el ojo va primero)
3. **Colores con sentido**: no decorativos. Consistentes. "Los colores no son decoracion. Son informacion."
4. **Eliminar ruido**: gridlines innecesarias, decimales excesivos, titulos redundantes
5. **El titulo es la conclusion**: no "Ventas por mes" sino "Las ventas caen un 12% en Q3"

---

### P40. Cuales son los 3 niveles de Tableau?

**R:**
1. **Hojas de trabajo (worksheets)**: Visualizaciones individuales
2. **Dashboards**: Combinacion de hojas en pantalla interactiva
3. **Historias (stories)**: Secuencia narrativa de dashboards (diferencial vs Power BI)

---

### P41. Que es el Balanced Scorecard (Cuadro de Mando Integral)?

**R:** Framework de Kaplan y Norton. Monitoriza la estrategia desde **4 perspectivas** conectadas por causa-efecto:

| Perspectiva | Pregunta |
|-------------|----------|
| **Aprendizaje y crecimiento** (base) | ¿Podemos seguir mejorando? |
| **Procesos internos** | ¿En que debemos ser excelentes? |
| **Clientes** | ¿Como nos ven los clientes? |
| **Financiera** (cima) | ¿Como nos ven los accionistas? |

**Cadena causal**: Si formo a mi gente → mejoran procesos → cliente satisfecho → gano dinero.

*"El error tipico es que el cuadro de mando solo mide la perspectiva financiera. Pero si solo miras los resultados financieros, ya es tarde para corregir."*

---

## BLOQUE 7: Roles Profesionales

### P42. Cuales son los principales roles en un equipo de datos?

**R:**

| Rol | Funcion |
|-----|---------|
| **Data Scientist** | Modelos predictivos avanzados, machine learning |
| **Data Analyst** | Reporting, analisis exploratorio, dashboards |
| **Data Engineer** | Infraestructura, ETL, pipelines de datos |
| **Business Analyst** | Traduccion entre negocio y datos |
| **CDO (Chief Digital Officer)** | Estrategia digital de la organizacion |

---

## CONCEPTOS TRAMPA (Gerardo insiste en estos)

### P43. Cuales son los errores que Gerardo penaliza en el examen?

**R:**

1. **Correlacion ≠ Causalidad**: Lo dice 3+ veces en el curso.
2. **Incremento de facturacion ≠ Incremento de margen**: Puedes vender mas y ganar menos.
3. **El coste del producto NO cambia con la promo**: Si bajas el precio, el coste sigue igual.
4. **Mas respuesta no siempre es mejor**: Si la oferta pierde por cliente, mas respuesta amplifica perdidas.
5. **Arbol ≠ Regresion logistica**: Modelos completamente distintos.
6. **No memorices, relaciona**: El examen pide aplicar a casos, no definir.
7. **RGPD — siempre hay mas de un principio**: Identificar TODOS, no solo el obvio.
8. **Sanity check primero**: Antes de analizar, valida el dato.

---

## CASOS REALES QUE USA GERARDO

| Caso | Que ilustra | Sesion |
|------|------------|--------|
| **Cambridge Analytica** | Vulneracion RGPD, limitacion finalidad | 6, 7 |
| **CaixaBank** | Modelo predictivo de churn bancario | 3 |
| **Mercadona** | Reaprovisionamiento predictivo (evitar stockout y exceso) | 3 |
| **Inditex** | Segmentacion por tienda, datos de caja + fidelizacion | 3 |
| **Grifols** | Optimizacion frecuencia captacion donantes de plasma | 3 |
| **Godiva (Yildiz)** | Segmentacion compradores chocolate premium para campanas | 3 |
| **COVID graph** | Visualizacion con eje invertido → decision equivocada | 10 |
| **Bill Gates en la calle** | Mediana vs media, efecto de outliers | 5 |
| **Airbnb NYC** | Actividad 1: analisis exploratorio, HIPPO vs Data-Driven | 5 |
| **AdventureWorks** | Actividad 3: analisis abierto, divergencia-convergencia | 9 |

---

## FRASES LITERALES DE GERARDO (para usar en el examen)

Usar estas frases o parafrasis cercanas demuestra que has asimilado su lenguaje:

- *"Los datos son el activo mas valioso de la empresa del siglo XXI"*
- *"Sin accion, el analisis no vale nada. El objetivo maximo es la accionabilidad."*
- *"HIPPO: el mayor enemigo de la decision data-driven"*
- *"Correlacion no implica causalidad"*
- *"Primero sanity check, luego analisis. Basura entra, basura sale."*
- *"La T del ETL es donde te juegas la calidad de toda la analitica"*
- *"El Golden Record es una decision de negocio: cual es la verdad"*
- *"Modelo estrella: sacrificas espacio, ganas velocidad. En BI, la velocidad manda."*
- *"El consentimiento debe ser libre, especifico, informado e inequivoco."*
- *"La compliance es cara, pero la no-compliance es mucho mas cara"*
- *"Olvido lo que leo, recuerdo lo que veo"*
- *"El examen no es de memoria. Es de criterio."*
- *"Divergir antes de converger. Siempre."*
- *"La IA es tu junior analyst. Tu eres el senior. Tu decides."*

---

## ESTRATEGIA DE EXAMEN

### P44. Como es el examen y que valora Gerardo?

**R:**
- **Formato**: 2 ejercicios de desarrollo, 120 minutos, libro cerrado, ~1 cara por ejercicio
- **Fuente**: Secciones "Ideas Clave" de cada tema

**Lo que VALORA**:
1. **Relacion de conceptos**: No "define ETL", sino "como el ETL garantiza la calidad del Golden Record"
2. **Interpretacion analitica**: Analizar como analista, no describir como espectador
3. **Sintesis**: Esquemas > parrafos largos
4. **Datos numericos**: Citar cifras de las tablas como evidencia
5. **Recomendacion accionable**: Siempre terminar con "la empresa deberia..."

**Lo que PENALIZA**:
1. Faltas de ortografia (lo dice explicitamente)
2. Respuestas incompletas (3 partes = 3 respuestas)
3. Memorizar sin entender
4. Opinar sin citar datos

*Frase: "El examen no es de memoria. Es de criterio." / "Si veis un output que no reconoceis, respirad y pensad: que me esta diciendo este dato sobre el negocio?"*
