# Visualización Avanzada - Preparación Examen

## Objetivo del Proyecto

Preparar el examen final de **Visualización Avanzada y Automatización de Análisis de Datos** (Máster BI, UNIR).
El examen vale el **60% de la nota final** y es obligatorio aprobarlo (mínimo 5).

## Modo de trabajo

**modo-estudio** con enfoque en **simulaciones de examen real**.
El usuario necesita practicar el flujo completo del examen bajo condiciones similares a las reales.

## Estructura del Examen

### Parte Teórica (~40%)
- Preguntas de **desarrollo/respuesta corta** (NO tipo test)
- Preguntas objetivas, no de opinión subjetiva
- Conceptos, definiciones y ejemplos (ej: "Defíneme un grafo de red, elementos y ejemplo")
- Interpretación de gráficos dados
- Teoría de Power Automate (pantallazos de flujos, triggers, conectores, acciones)
- NO se pide memorizar definiciones exactas, sino entender y saber explicar

### Parte Práctica (~60%)
- Caso de negocio simulado con dataset "guarreado" (con errores a propósito)
- Herramienta: **Power BI** (o Tableau)
- Entregable: archivo .pbix + respuestas escritas en Hexam
- **4 fases obligatorias**:
  1. **Revisión y Pre-análisis**: describir dataset, variables principales, calidad de datos
  2. **Limpieza y Transformación (ETL)**: Power Query obligatorio, documentar pasos aplicados
  3. **Generación del Dashboard**: 3-4 gráficos específicos que te piden
  4. **Interpretación y Conclusiones**: 5-6 preguntas concretas sobre el dashboard
- DAX: solo fórmulas sencillas, si se necesitan se dan instrucciones

## Dataset del Examen

- Archivo: `data/Base de datos examen.xlsx`
- Tipo: dataset retail similar a los vistos en clase, con errores intencionados
- Errores esperados: celdas vacías, formatos inconsistentes, monedas mezcladas, duplicados, campos sin normalizar

## Temario Clave (Bloques Teóricos)

### Bloque 1: Visualización Avanzada y Diseño (Temas 1-2)
- Visualización multivariante: burbujas (4 dims), scatter matrix, small multiples
- Perfiles de usuario: ejecutivo (KPIs agregados) vs analista (granularidad, drill-down)
- Principios Gestalt: proximidad, semejanza, cierre
- Gráficos especiales: coropléticos (ratios en áreas), grafos de red (nodos/aristas), Sankey (flujos)
- Coordenadas paralelas, mapas de calor
- Series temporales: estacionalidad, tendencias, eventos disruptivos (COVID)
- Pilares: sensibilidad gráfica, rigor analítico, dominio técnico

### Bloque 2: Preprocesamiento y Calidad del Dato (Tema 3)
- Tidy Data: cada variable=columna, cada observación=fila, cada valor=celda
- 70% del tiempo se invierte en preprocesamiento
- "Basura entra, basura sale"

### Bloque 3: Modelización y Análisis Exploratorio (Tema 4)
- Descriptiva (retrovisor) vs Predictiva (prismáticos)
- Clustering: K-Means (centroides) vs Jerárquico (dendrograma)
- PCA (lineal, varianza global) vs t-SNE (no lineal, clústeres locales)
- Correlación vs Causalidad

### Bloque 4: Automatización y Gobernanza (Tema 5)
- Arquitectura de flujo: Trigger > Conectores > Acciones
- Power Automate: automatización sin código, solo con licencia PRO
- Power BI Desktop (local, diseño) vs Service (nube, publicar/automatizar)
- Gobernanza: Row Level Security, control de acceso, cumplimiento RGPD
- Licencias: Free, Pro, Premium

### Bloque 5: Tableau y Power BI avanzado (Temas 7-8)
- Conceptos de herramientas, no práctica avanzada
- Cuándo usar DAX vs otras técnicas
- Tareas de limpieza en Tableau Prep

## Materiales Disponibles

### Clases (carpeta `clases/`)
- Transcripciones .txt: Clase01 a Clase11 + última clase
- PDFs de presentaciones: Temas 1-7
- Se añadirán más transcripciones progresivamente

### Actividades (carpeta `Actividades/`)
- actividad1/: Dashboard interactivo con narrativa visual
- actividad2/: Programación de visualizaciones (incluye .pbix, video, anexo)
- actividad3/: Proyecto final (incluye .pbix, scripts Python, presentación)

### Documento guía
- `examen_visualizacionavanzada.md`: Descripción detallada del formato, estructura y contenidos del examen

## Simulaciones de Examen

Cuando el usuario pida una simulación:
1. **Simular condiciones reales**: dar un escenario de negocio ficticio con el dataset real
2. **Seguir las 4 fases**: pre-análisis > ETL > dashboard > interpretación
3. **Parte teórica**: formular preguntas de desarrollo como las del examen real
4. **Evaluar respuestas**: dar feedback constructivo sobre qué mejorar
5. **Cronometrar mentalmente**: el examen tiene tiempo limitado, practicar eficiencia

## Errores Comunes a Evitar (según profesor)
- No limpiar datos antes de graficar
- Automatizar sin validar
- Compartir sin control de permisos
- Sobrecarga visual (meter demasiadas variables en un gráfico)
- Confundir correlación con causalidad
- Poner teléfonos/códigos postales como numéricos (pierden ceros iniciales)
- No documentar los pasos de transformación en Power Query
