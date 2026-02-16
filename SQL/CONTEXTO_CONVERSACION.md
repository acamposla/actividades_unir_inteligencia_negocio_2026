# Contexto de Conversación

## Última actualización
2026-02-15 (Sesión de preparación de examen)

## ¿Qué estábamos haciendo?
Preparación intensiva para el examen práctico de SQL del viernes 20/02/2026. Se configuró el entorno de simulacros y se completaron 2 simulacros completos con corrección y análisis de errores.

## Estado de la tarea actual
**Completado**:
- Configuración de proyecto y conexión a MySQL localhost (ExamenUnir)
- Creación de carpeta `EJERCICIOS/` para simulacros
- Actualización de CLAUDE.md con toda la información del examen
- Simulacro 01: Completado con correcciones aplicadas
- Simulacro 02: Completado con correcciones aplicadas

**Pendiente**:
- Simulacro 03: Generado y guardado en `EJERCICIOS/simulacro_03.sql`, pendiente de resolver por el alumno

## Problemas detectados del alumno (GAPS de aprendizaje)

### Errores recurrentes (prioridad alta):
1. **Columnas en GROUP BY** (3 veces): Incluir columnas agregables (SUM, COUNT) en el GROUP BY cuando debe ir solo la dimensión
   - Ejemplo: `GROUP BY IdProducto, SUM(...)` → Incorrecto
   - Correcto: `GROUP BY IdProducto` + `SUM(...)` en SELECT

2. **Confusión NOT IN vs WHERE** (2 veces): Diferenciar "excluir valor de resultado" (WHERE <>) vs "nunca hizo X" (NOT IN con subconsulta)
   - Ejemplo: "Clientes que NO compraron categoría X" → NOT IN (subconsulta), no WHERE IdCategoria <> X

### Errores ocasionales:
3. Olvidar filtros WHERE explícitos del enunciado (1 vez)
4. Valores de texto exactos (Cancelada vs Cancelado) (1 vez)
5. Self-join: dirección del ON invertida (1 vez) - Actividad 2 P5
6. ORDER BY ASC cuando pide DESC (1 vez)

### Patrón pendiente de dominar:
- **NOT IN con subconsultas**: Aún no lo ha resuelto solo sin pistas. Necesita más práctica.

## Estado de simulacros

| Simulacro | Estado | Errores corregidos | Nivel final |
|-----------|--------|-------------------|-------------|
| simulacro_01.sql | ✅ Completado | P4: faltaba WHERE<br>P5: INNER vs LEFT JOIN<br>P7: NOT IN (no resuelto solo) | Aprobado con ayuda |
| simulacro_02.sql | ✅ Completado | P3: RIGHT JOIN incorrecto<br>P4: self-join resuelto con ayuda<br>P6: confusión NOT IN vs WHERE<br>P7: correcto | Aprobado con ayuda |
| simulacro_03.sql | 🔄 Generado | Pendiente | - |

## Próximo paso concreto
El alumno debe resolver `EJERCICIOS/simulacro_03.sql` sin ayuda y reportar cuando esté listo para corrección.

## Notas de sesión
- **Petición del alumno**: Los enunciados NO deben incluir pistas entre paréntesis (ej: "usar LEFT JOIN") para simular el examen real
- **Metodología de corrección**:
  1. Claude ejecuta las queries del alumno contra MySQL real
  2. Compara resultados con solución de referencia
  3. Identifica patrón del error (conceptual vs sintáctico)
  4. Explica la corrección y refuerza el concepto
- **Tiempo hasta examen**: 5 días (viernes 20/02/2026)
- **Estrategia sugerida**: 1 simulacro por día hasta el jueves, repaso final el viernes mañana
