# 🛠️ Comandos Útiles y Supervivencia en Terminal

Este documento es una "chuleta" para resolver problemas comunes en este repositorio y automatizar tareas, para no tener que volver a investigar cómo se hacía.

---

## 📚 Documentación de Referencia
* **Pandoc:** Para saber qué hace cada bandera (como `-o` para *Output*, o `-t` para *To/Format*), consulta la [Documentación Oficial de Pandoc](https://pandoc.org/MANUAL.html) o ejecuta `man pandoc` y `pandoc --help` en la terminal.

---

## 🐙 Git: Limpieza y Emergencias

### Encontrar archivos gigantes
Si GitHub rechaza un `push` por límite de tamaño, busca a los culpables (archivos de más de 50MB) con:
`find . -type f -size +50M`

### Borrar un archivo gigante de todo el historial de Git
Si has hecho commit de un archivo muy pesado (como un `.mov`) y necesitas que Git olvide que existió para poder hacer push:
`git filter-branch --force --index-filter "git rm --cached --ignore-unmatch RUTA/AL/ARCHIVO" --prune-empty --tag-name-filter cat -- --all`
*(Nota: Haz un `git stash` antes si tienes cambios sin guardar).*

### Limpieza profunda de basura en Git (Garbage Collector)
Para liberar espacio en el disco duro (carpeta `.git/objects/`) eliminando archivos huérfanos:
`git reflog expire --expire=now --all`
`git gc --prune=now --aggressive`

---

## 📄 Pandoc: Conversión de Markdown a PDF

### Opción 1: Método WeasyPrint (HTML a PDF)
**Recomendado para:** Apuntes diarios, documentos con emojis, símbolos especiales o listas muy profundas. Estilo web/GitHub.
* **Requisito:** `brew install weasyprint`
* **Convertir un solo archivo:**
  `pandoc archivo.md -t html -o archivo.pdf`
* **Convertir recursivamente (toda la carpeta):**
  `find . -type f -name "*.md" -exec sh -c 'pandoc "$1" -t html -o "${1%.md}.pdf" --metadata title="Apuntes"' _ {} \;`

### Opción 2: Método XeLaTeX (Motor Académico)
**Recomendado para:** Trabajos formales, TFM, documentos con muchas fórmulas matemáticas complejas. Estilo clásico universitario.
* **Requisito:** `brew install --cask basictex` (o `mactex` completo).
* **Convertir un solo archivo:**
  `pandoc archivo.md -o archivo.pdf --pdf-engine=xelatex`
* **Convertir recursivamente (toda la carpeta):**
  `find . -type f -name "*.md" -exec sh -c 'pandoc "$1" -o "${1%.md}.pdf" --pdf-engine=xelatex' _ {} \;`
