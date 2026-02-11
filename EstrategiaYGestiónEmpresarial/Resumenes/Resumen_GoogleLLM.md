# 📘 GUÍA MAESTRA DE ESTUDIO: ESTRATEGIA Y GESTIÓN DE DATOS

## 1. PILARES TEMÁTICOS Y CONCEPTOS RECURRENTES

El curso se estructura en tres grandes bloques que debes dominar: **Estrategia y Negocio**, **Arquitectura y Gobierno del Dato**, y **Analítica Aplicada (Interpretación)**.

### A. Inteligencia de Negocio (Business Intelligence - BI)
El BI no es solo tecnología. Se define como la integración de cinco elementos clave:
1.  **Procesos:** Metodologías.
2.  **Tecnología:** Infraestructura (Cloud, On-premise).
3.  **Herramientas:** Software (Tableau, PowerBI, Python).
4.  **Personas:** El elemento central y más difícil de copiar por la competencia.
5.  **Capacidades:** Músculo financiero y organizativo.

*   **Objetivo del BI:** Transformar datos en información $\rightarrow$ información en conocimiento $\rightarrow$ conocimiento en soporte para la decisión $\rightarrow$ **ACCIONABILIDAD** (el fin último es tomar decisiones tácticas o estratégicas).

### B. Arquitectura Técnica y Calidad del Dato
Para que el análisis sea fiable, la "cocina" del dato debe estar limpia.
*   **Procesos ETL (Extract, Transform, Load):** Vitales para consolidar la información de múltiples fuentes (CRM, ERP, Billing, Ficheros planos).
    *   *Extracción:* Sacar el dato del origen.
        *   *Transformación:* Limpieza, desduplicación (evitar que un cliente aparezca tres veces), gestión de nulos.
            *   *Carga:* Guardarlo en el Data Warehouse.
            *   **Data Warehouse (DTW):** Repositorio centralizado y estructurado para el análisis (no para la operativa diaria).
                *   **Modelo Estrella:** Una tabla de hechos central (ej. Ventas) rodeada de tablas de dimensiones (Tiempo, Producto, Cliente) sin jerarquías. Es más rápido para consultas.
                    *   **Modelo Copo de Nieve (Snowflake):** Las dimensiones tienen jerarquías y se normalizan en múltiples tablas (ej. Ciudad $\rightarrow$ Provincia $\rightarrow$ País).
                    *   **Golden Record:** La versión única y veraz de un cliente, obtenida tras limpiar y unificar duplicados (fundamental para no tratar al mismo cliente como dos distintos).

                    ### C. Estrategia de Clientes y Toma de Decisiones
                    *   **HIPPO vs. Data-Driven:**
                        *   *HIPPO (Highest Paid Person's Opinion):* Decisiones basadas en la intuición del jefe (Ejemplo: Angels Brick en la Actividad 1).
                            *   *Data-Driven:* Decisiones objetivas basadas en evidencia analítica.
                            *   **Customer Centricity:** Pasar de estrategias centradas en producto a centradas en el cliente. El mercado no es homogéneo; diferentes necesidades requieren diferentes tratamientos.
                            *   **Ciclo de Vida:** Captación $\rightarrow$ Desarrollo (Cross/Up-selling) $\rightarrow$ Retención.

                            ### D. Gobernanza y Ética (RGPD)
                            *   **Dato Personal:** Cualquier información que identifique o haga identificable a una persona física (nombre, mail, ID dispositivo, geolocalización).
                            *   **Principios Clave (Caso Cambridge Analytica):**
                                *   *Limitación de la finalidad:* Los datos solo se pueden usar para lo que se informó al usuario (Facebook falló aquí al permitir uso político de datos académicos),.
                                    *   *Transparencia:* El usuario debe saber qué se hace con sus datos.
                                        *   *Minimización:* Pedir solo lo necesario.

                                        ### E. Visualización
                                        *   **Mantra:** "Olvido lo que leo, recuerdo lo que veo".
                                        *   **Tableau:** Se estructura en **Hoja de trabajo** (gráfico individual) $\rightarrow$ **Dashboard** (conjunto de hojas) $\rightarrow$ **Historia** (narrativa secuencial, algo que Power BI no tiene nativo de esta forma),.

                                        ---

                                        ## 2. METODOLOGÍA ANALÍTICA E INTERPRETACIÓN (R/Python)

                                        *Aunque el examen final es teórico/desarrollo, debes saber interpretar estos conceptos vistos en la parte técnica.*

                                        *   **Clustering (K-Means):**
                                            *   Aprendizaje **No Supervisado** (no hay variable objetivo, el ordenador busca patrones).
                                                *   Se usa para segmentar clientes.
                                                    *   Interpretación: Mirar las medias de cada grupo para ponerles "nombre" (ej. "Clientes VIP", "Clientes Low Cost").
                                                    *   **Árbol de Decisión:**
                                                        *   Aprendizaje **Supervisado**.
                                                            *   Se usa para clasificar (ej. ¿Comprará o no?).
                                                                *   Interpretación: El nodo superior es la raíz. Cada "rama" es una regla (Si Edad > 30 y Ingresos < 20k -> No compra).
                                                                *   **Regresión Logística:** Para predecir variables binarias (Sí/No, 0/1). Se mira el `P-valor` (<0.05) para saber qué variables son significativas.
                                                                *   **Series Temporales (ARIMA):** Requieren una variable temporal y una frecuencia (mensual/diaria). Se usan para predicciones a futuro (forecast).

                                                                ---

                                                                ## 3. PREGUNTAS DE EXAMEN PROBABLES (Interpretación y Desarrollo)

                                                                Basado en lo enfatizado en las sesiones de repaso y en la estructura de las Actividades:

                                                                ### Bloque 1: Estrategia y Negocio (Basado en Actividad 1 y 3)
                                                                1.  **Caso Práctico de Decisión:** "Una empresa quiere lanzar una promoción basándose en la intuición del Director Comercial (HIPPO). Explique por qué esto es un riesgo y describa el proceso analítico que seguiría para validar o refutar esa intuición con datos." *Respuesta clave: Mencionar análisis exploratorio, definición de KPIs y validación de hipótesis,.*
                                                                2.  **KPIs SMART:** "Defina qué es un KPI SMART y proponga dos ejemplos para un e-commerce." *Respuesta: Específico, Medible, Alcanzable, Relevante, Temporal. Ej: Tasa de conversión mensual, Ticket medio por cliente.*

                                                                ### Bloque 2: Gobierno del Dato y Ética (Basado en Actividad 2)
                                                                3.  **Análisis de Caso Legal:** "Una empresa utiliza los CVs de candidatos de hace 5 años para enviarles publicidad de productos. ¿Qué principios del RGPD se están vulnerando?" *Respuesta clave: Principio de limitación de la finalidad (se recogió para empleo, no para publicidad) y Principio de exactitud/conservación (dato antiguo),.*
                                                                4.  **Dato Personal:** "¿Es una dirección IP o una geolocalización un dato personal?" *Sí, si permite identificar indirectamente a una persona física.*

                                                                ### Bloque 3: Infraestructura y BI
                                                                5.  **Data Warehouse:** "Explique la diferencia entre un modelo Estrella y un modelo Copo de Nieve. ¿Cuál elegiría para un sistema donde prima la velocidad de consulta?" *Respuesta: Estrella (desnormalizado, menos tablas, más rápido) vs. Copo de Nieve (normalizado, más tablas, ahorra espacio pero más lento). Para velocidad: Estrella.*
                                                                6.  **ETL:** "¿Por qué es peligroso cargar datos directamente de los operacionales al sistema de análisis sin pasar por una ETL?" *Respuesta: Riesgo de duplicados, datos sucios, formatos inconsistentes y falta de una visión única del cliente (Golden Record),.*

                                                                ### Bloque 4: Interpretación Analítica (Preguntas cortas o interpretación de gráficos)
                                                                7.  **Interpretación de Clusters:** "Dado este gráfico o tabla de medias de 3 clusters de clientes, describa el perfil de cada grupo." *Debes ser capaz de decir: 'El Grupo 1 son jóvenes con poco gasto, el Grupo 2 son mayores con mucho gasto...'*.
                                                                8.  **Correlación:** "¿Qué significa una correlación de -0.9 entre Precio y Ventas?" *Significa una relación inversa muy fuerte: a mayor precio, bajan las ventas drásticamente.*

                                                                ---

                                                                ## 4. CONSEJOS FINALES DEL PROFESOR PARA EL EXAMEN

                                                                *   **No memorices, relaciona:** No te pedirán "Define Data Warehouse", sino "¿Cómo ayuda un Data Warehouse a evitar silos de información en una empresa?".
                                                                *   **Extensión limitada:** Tendrás un espacio limitado. Usa esquemas, gráficos simples si es presencial, o estructura de puntos. Sintetiza.
                                                                *   **Interpretación:** Si te ponen un caso, asume el rol de analista. No digas solo "el dato es 5", di "el dato es 5, lo que implica que la estrategia no funciona y deberíamos cambiar a...".
                                                                *   **Normativa:** Céntrate en el Reglamento Europeo (GDPR), es el marco de referencia del curso.

                                                                ¡Mucho ánimo! La clave está en entender el **flujo del dato**: desde que nace (ETL), se guarda (DTW), se analiza (Modelos/Clustering), se visualiza (Dashboards) y se protege (RGPD) para tomar decisiones.
