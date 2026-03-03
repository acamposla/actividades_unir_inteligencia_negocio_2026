¡Excelente iniciativa! Como tu profesor, me alegra ver que estás cruzando fuentes. Los "apuntes de Gemini" (Fuente 12) aportan una estructura conceptual muy sólida (como las referencias a Kahneman o Shneiderman) que encaja perfectamente con lo que hemos discutido en las clases (transcripciones) y el material visual (diapositivas).

Vamos a amplificar tu guía de estudio profundizando en el **"Por qué"** (la ciencia detrás) y el **"Cómo"** (la técnica aplicada), integrando ambos mundos.

---

### **1. Profundización: Percepción Visual y Cognición**
*El objetivo: Hackear el cerebro del usuario para reducir la carga cognitiva.*

Ya sabes que "vemos con el cerebro", pero vamos a darle base científica para tu examen.

*   **Sistema 1 vs. Sistema 2 (Kahneman):** Esta es la clave teórica.
    *   *Concepto:* El cerebro tiene dos modos. El **Sistema 1** es rápido, intuitivo y automático (ej. reconocer una cara enfadada). El **Sistema 2** es lento, requiere esfuerzo y cálculo (ej. multiplicar 24 x 17).
    *   *Aplicación en Diseño:* Tu dashboard debe diseñarse para el **Sistema 1**. Si el usuario tiene que pararse a leer ejes complejos o descifrar una leyenda (Sistema 2), el diseño ha fallado. Buscamos la inmediatez.
*   **Jerarquía de los Atributos Preatentivos:** No todos los atributos visuales son iguales.
    *   *Precisión:* Según William Cleveland y Robert McGill, la **posición** sobre una escala común (como en un gráfico de barras o dispersión) es la forma más precisa de comparar datos. El **ángulo** (tarta) y el **área** (burbujas) son mucho menos precisos y el cerebro falla al compararlos,,.
    *   *Uso estratégico:* Usa la posición para los datos críticos (KPIs) y el color o el área solo para dar contexto o agrupar, nunca para comparaciones finas.

**Conexión Horizontal:**
Los *Atributos Preatentivos* activan el *Sistema 1*. Si usas un atributo "débil" (como el área) para un dato importante, obligas al usuario a usar el *Sistema 2*, rompiendo la fluidez del análisis.

---

### **2. Profundización: Estrategia y Narrativa (BSC y Storytelling)**
*El objetivo: Que el dato cuente la historia del negocio.*

En las clases vimos el BSC (Balanced Scorecard). Ahora, vamos a conectar los puntos.

*   **La Cadena Causal del BSC (Causa-Efecto):**
    *   No veas las 4 perspectivas (Financiera, Cliente, Procesos, Aprendizaje) como cajas aisladas. Son una **historia en cascada**: Si mejoro el *Aprendizaje* (formo a mi gente), mejoran mis *Procesos Internos*; si mis procesos son excelentes, el *Cliente* está satisfecho; y si el cliente está feliz, gano dinero (*Financiera*),,.
*   **KPQ antes que KPI:**
    *   El error número uno es "medir lo que tengo". La metodología correcta es formular primero la **Key Performance Question (KPQ)** (¿Qué necesito saber?) para luego definir el **KPI** (¿Qué dato responde a esa pregunta?),.
    *   *Ejemplo:* KPQ: "¿Son fieles mis clientes?" -> KPI: "Tasa de retención anual".

**Insight Ampliado:**
> **"Un número solitario no dice nada".** Un KPI aislado (ej. "Ventas: 5M€") es inútil sin contexto. Debes aplicar lo que en diseño llamamos **BANs (Big Aggregated Numbers) contextualizados**: añade una flecha de tendencia (¿sube o baja respecto al mes pasado?) o una línea de meta (¿estamos por encima del objetivo?),,.

---

### **3. Profundización: Arquitectura de Dashboards**
*El objetivo: Guiar el ojo y la acción.*

Aquí unimos la teoría de percepción con la práctica del software (Power BI/Tableau).

*   **El Mantra de Shneiderman:**
    *   Esta es la regla de oro para la interactividad: **"Visión general primero, zoom y filtro, detalles bajo demanda"**,.
    *   *Aplicación:* Tu dashboard no debe mostrar todo de golpe. Primero, los KPIs grandes arriba (Visión general). Luego, selectores o mapas para filtrar (Zoom). Finalmente, una tabla abajo con los datos precisos (Detalles).
*   **La Cuadrícula y el Flujo de Lectura:**
    *   En occidente leemos en patrón **"Z" o "F"**. Coloca lo más crítico (los BANs o KPIs) en la esquina superior izquierda. Lo menos relevante, abajo a la derecha.
    *   Usa el **espacio en blanco** (Ley de Proximidad de Gestalt) para separar secciones, en lugar de llenar todo de líneas y cajas que añaden ruido visual,.

---

### **🔎 TEMAS CRÍTICOS PARA EL EXAMEN (Ampliado)**

Con base en mis correcciones y los apuntes de Gemini, aquí es donde suelen fallar los alumnos:

1.  **Detección de Manipulación (Ética):**
    *   Te pondré un gráfico "tramposo". Fíjate si el **eje Y está cortado** (no empieza en 0), lo que exagera visualmente diferencias pequeñas,.
    *   Busca **gráficos 3D** innecesarios que distorsionan la proporción (el trozo de tarta que está al frente parece más grande por la perspectiva),.
2.  **Selección del Gráfico Correcto:**
    *   Si te pido ver "evolución temporal", usa líneas. Si te pido "comparar magnitudes", usa barras. Si te pido "correlación", usa dispersión (scatterplot). Justifica tu elección basándote en la **precisión perceptiva** (Cleveland & McGill).
3.  **Diseño del Dashboard (Caso Práctico):**
    *   Recuerda: **Una sola pantalla**. No me hagas un informe de 20 páginas. Resume. Usa la interactividad (filtros) para que el usuario explore, en lugar de poner 50 gráficos estáticos,.

---

### **🔗 Conexión Teoría - Práctica (Tus Actividades)**

*   **Actividad 1 (Crítica y Rediseño):**
    *   *Teoría:* Aplicaste las **Leyes de la Gestalt** y la crítica a la **manipulación visual**.
    *   *Práctica:* Aprendiste a identificar el "ruido" (elementos que no aportan información) y a aplicar el principio de "Menos es más" (ratio datos-tinta),.
*   **Actividad 2 (BSC - EcoBite):**
    *   *Teoría:* Aplicaste la lógica **Estratégica** (Causa-Efecto).
    *   *Práctica:* No solo elegiste KPIs, sino que tuviste que justificar su **relevancia y alineación** con el objetivo de la empresa ficticia,. Entendiste que sin una buena pregunta (KPQ), el dato no sirve.
*   **Actividad 3 (Dashboard - Adventure Works):**
    *   *Teoría:* Aplicarás el **Mantra de Shneiderman**.
    *   *Práctica:* Usarás Power BI/Tableau. La clave será crear una **jerarquía visual**: ¿Dónde miro primero? (Arriba a la izquierda). ¿Cómo interactúo? (Filtros cruzados).

### **💡 Insight Final Amplificado**
El gran error del analista junior es enamorarse de la herramienta y olvidar al usuario.
**Tu verdadero trabajo es la empatía (Design Thinking):** Entender qué decisión debe tomar el usuario y diseñar *solo* lo necesario para facilitarla. Si tu gráfico obliga al usuario a usar el **Sistema 2** (pensar mucho) para entender si las ventas suben o bajan, has fallado, por muy bonito que sea el degradado de colores.

**Diseña para el cerebro vago (Sistema 1). Diseña para la acción.**
