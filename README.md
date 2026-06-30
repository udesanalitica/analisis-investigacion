# 📊 Análisis de la Investigación en la Universidad de Santander a Partir de las Capacidades de los Grupos de Investigación, la Participación Estudiantil en Semilleros y el Desempeño Académico.

**Estado del proyecto:** En construcción
**Tipo de recurso:** Repositorio académico de trabajo de grado
**Institución:** Universidad de Santander – UDES
**Programa:** Maestría en Estadística Aplicada
**Licencia sugerida:** CC BY 4.0
**Principios FAIR:** Findable, Accessible, Interoperable, Reusable

---

## 🧭 Descripción general

Este repositorio contiene los insumos, bases de datos, scripts, tablas, imágenes, resultados y documentación asociados al trabajo de grado titulado:

**“Análisis de la Investigación en la Universidad de Santander a Partir de las Capacidades de los Grupos de Investigación, la Participación Estudiantil en Semilleros y el Desempeño Académico”.**

El propósito del proyecto es organizar, procesar y analizar información institucional relacionada con las capacidades de los grupos de investigación, la participación estudiantil en semilleros y su posible relación con indicadores de desempeño académico en la Universidad de Santander.

El repositorio busca facilitar la trazabilidad del análisis, la reproducibilidad de los procedimientos estadísticos y la documentación de los datos utilizados durante el desarrollo del trabajo.

---

## 👤 Información del trabajo

**Autor:**
Pablo César Prada Luna

**Programa académico:**
Maestría en Estadística Aplicada

**Facultad:**
Facultad de Ciencias Naturales y Agropecuarias

**Institución:**
Universidad de Santander – UDES

**Tipo de trabajo:**
Trabajo de grado para optar al título de Magíster en Estadística Aplicada

**Director:**
Magíster en Estadística Aplicada, Francisco Javier León

**Codirectores:**
Magíster en Estadística, Miguel Oswaldo Pérez Pulido
Doctor en Bioética, Cesar Augusto Serrano Novoa

---

## 📚 Tabla de contenido

* [Descripción general](#-descripción-general)
* [Información del trabajo](#-información-del-trabajo)
* [Estructura del repositorio](#-estructura-del-repositorio)
* [Archivos y carpetas principales](#-archivos-y-carpetas-principales)
* [Uso del repositorio](#-uso-del-repositorio)
* [Reproducibilidad](#-reproducibilidad)
* [Principios FAIR](#-principios-fair)
* [Nota de confidencialidad](#-nota-de-confidencialidad)
* [Citación sugerida](#-citación-sugerida)
* [Licencia](#-licencia)
* [Contacto](#-contacto)

---

## 📂 Estructura del repositorio

```text
analisis-investigacion/
├── analisis_salidas/
├── bd_grupos_acm/
├── bd_semilleros_mlj/
├── img/
├── r_scripts/
├── tablas_scraping/
├── README.md
├── .gitignore
└── analisis-investigacion.Rproj
```

---

## 📁 Archivos y carpetas principales

* `analisis_salidas/`: contiene los productos derivados del análisis, tales como reportes, tablas finales, gráficos, resultados estadísticos o salidas intermedias.
* `bd_grupos_acm/`: almacena las bases de datos relacionadas con los grupos de investigación y sus capacidades institucionales.
* `bd_semilleros_mlj/`: contiene bases de datos asociadas con semilleros de investigación y participación estudiantil.
* `img/`: reúne imágenes, gráficos, capturas o recursos visuales utilizados en los documentos y reportes del proyecto.
* `r_scripts/`: contiene los scripts desarrollados en R para limpieza, transformación, análisis estadístico y generación de resultados.
* `tablas_scraping/`: almacena tablas obtenidas, estructuradas o procesadas a partir de procesos de consulta, extracción o consolidación de información.
* `README.md`: documento principal de descripción del repositorio.
* `.gitignore`: archivo de configuración para evitar la carga de archivos temporales o innecesarios.
* `analisis-investigacion.Rproj`: archivo del proyecto en RStudio.

---

## 🧪 Uso del repositorio

Para utilizar este repositorio se recomienda:

1. Clonar o descargar el repositorio.
2. Abrir el archivo `analisis-investigacion.Rproj` en RStudio.
3. Revisar las bases de datos disponibles en las carpetas correspondientes.
4. Ejecutar los scripts ubicados en `r_scripts/`.
5. Consultar los resultados generados en `analisis_salidas/`.

---

## 🔁 Reproducibilidad

Los análisis incluidos en este repositorio buscan ser reproducibles mediante el uso de scripts en R. Para ello, se recomienda ejecutar los archivos en el orden definido dentro de la carpeta `r_scripts/`, verificando previamente las rutas de entrada y salida de los datos.

Se sugiere documentar progresivamente:

* Versión de R utilizada.
* Paquetes requeridos.
* Fecha de actualización de las bases.
* Procedimientos de limpieza y transformación.
* Criterios de inclusión o exclusión de registros.
* Descripción de variables.
* Métodos estadísticos empleados.

---

## 🧬 Principios FAIR

Este repositorio se orienta bajo los principios FAIR para la gestión de datos académicos y científicos.

### Findable — Encontrable

Los archivos se organizan mediante una estructura clara de carpetas, nombres descriptivos y documentación general del proyecto. Se recomienda complementar el repositorio con metadatos, diccionario de datos y, en una etapa posterior.

### Accessible — Accesible

El repositorio permite centralizar los insumos del trabajo para su consulta y revisión. En caso de contener información institucional sensible o datos personales, el acceso deberá mantenerse restringido o controlado, publicando únicamente versiones anonimizadas cuando corresponda.

### Interoperable — Interoperable

Los datos, scripts y salidas deben almacenarse preferiblemente en formatos abiertos o ampliamente utilizados, tales como `.csv`, `.xlsx`, `.R`, `.qmd`, `.html`, `.pdf` y `.png`. La documentación deberá facilitar la comprensión de las variables, fuentes y procedimientos empleados.

### Reusable — Reutilizable

El repositorio busca facilitar la reutilización académica de los datos, scripts y resultados, siempre que se respeten las condiciones de confidencialidad, citación institucional y uso responsable de la información. Para fortalecer este principio se recomienda incluir licencia, diccionario de datos, metodología y citación sugerida.

---

## 🔐 Nota de confidencialidad

Este repositorio puede contener información institucional relacionada con grupos de investigación, semilleros, producción académica o desempeño estudiantil. Si las bases de datos incluyen información sensible, datos personales, identificadores, correos electrónicos o información no anonimizada, se recomienda mantener el repositorio como privado.

Para publicación abierta, se recomienda cargar únicamente versiones anonimizadas, agregadas o depuradas de las bases de datos.

---

## 📖 Citación sugerida

Si utiliza la información, scripts, bases de datos o resultados derivados de este repositorio, cite de la siguiente manera:

```bibtex
@misc{PradaLuna2026AnalisisInvestigacionUDES,
  author       = {Prada Luna, Pablo César and León, Francisco Javier and Pérez Pulido, Miguel Oswaldo and Serrano Novoa, Cesar Augusto},
  title        = {Análisis de la Investigación en la Universidad de Santander a Partir de las Capacidades de los Grupos de Investigación, la Participación Estudiantil en Semilleros y el Desempeño Académico},
  year         = {2026},
  institution  = {Universidad de Santander - UDES},
  type         = {Repositorio académico asociado a trabajo de grado de Maestría en Estadística Aplicada},
  note         = {Autor del trabajo de grado: Pablo César Prada Luna. Director: Francisco Javier León. Codirectores: Miguel Oswaldo Pérez Pulido y Cesar Augusto Serrano Novoa},
  url          = {https://github.com/udesanalitica/analisis-investigacion}
}
```

Cuando el repositorio cuente con DOI, será actualizado.

---

## 📜 Licencia

**Creative Commons Attribution 4.0 International — CC BY 4.0**, se permite reutilizar, adaptar y distribuir el material con la debida atribución.

---

## 📬 Contacto

Para consultas académicas o institucionales relacionadas con este repositorio, contactar a los responsables del trabajo de grado y de su dirección académica.

**Universidad de Santander – UDES**
Facultad de Ciencias Naturales y Agropecuarias
Maestría en Estadística Aplicada
