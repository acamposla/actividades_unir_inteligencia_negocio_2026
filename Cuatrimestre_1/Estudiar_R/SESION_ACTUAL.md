# Contexto de Conversación

## Última actualización
17 de febrero de 2026

## ¿Qué estábamos haciendo?
Simulacro de examen 01 (`Simulacros/Simulacro_01.md`). Resolviendo pregunta a pregunta con corrección en tiempo real.

## Estado del simulacro
- Preguntas 1-4: COMPLETADAS en `Simulacros/Simulacro_01_Respuestas.rmd`
- Pregunta 5 en adelante: PENDIENTE
- Dataset diabetes cargado y limpiado (variable `diabetesf`, sin ceros en Glucose/BMI)

## Qué se hizo en esta sesión
1. **Reestructuración del proyecto**: El CLAUDE.md se reescribió con dos misiones paralelas:
   - Misión 1: Simulacros de examen realistas
   - Misión 2: Construir la mejor chuleta para el examen
2. **Creada carpeta Simulacros/** con el primer simulacro (20 preguntas, diabetes + Mall_Customers)
3. **Chuleta_R.qmd actualizada** con:
   - Patrón `colSums(datos == 0)` para detectar ceros sospechosos (trampa de examen)
   - Regla OR vs AND en filtros (`!=` usa `&`, `==` usa `|`)
   - Aviso de "sin comillas en filter()"
4. **Tips de clases 14 y 15 incorporados** al CLAUDE.md (qué entra, qué no, trampas)

## Errores cometidos (para reforzar)
- Comillas en nombres de columna dentro de `filter()` → R lo trata como texto literal
- OR (`|`) vs AND (`&`) al eliminar filas → cuando eliminas con `!=`, usa `&`
- No conocía `colSums(datos == 0)` → patrón general: `colSums(CONDICION)` cuenta TRUEs

## Próximo paso concreto
Decir: "Continuamos con el simulacro 01, iba por la pregunta 5."
La pregunta 5 pide: media y mediana de Glucose para diabéticos vs no diabéticos + interpretación.

## Archivos modificados
- `CLAUDE.md` → reescrito con nuevo enfoque
- `Chuleta_R.qmd` → añadidas secciones de ceros sospechosos y regla OR/AND
- `Simulacros/Simulacro_01.md` → enunciado completo del simulacro
- `Simulacros/Simulacro_01_Respuestas.rmd` → respuestas hasta pregunta 4
