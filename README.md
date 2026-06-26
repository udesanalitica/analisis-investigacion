# Análisis de investigación

Este repositorio contiene los insumos, scripts, bases de datos, tablas, imágenes y salidas generadas en el marco de un proceso de análisis de investigación institucional. Su propósito es organizar de manera reproducible los archivos utilizados para la consulta, procesamiento, análisis y presentación de resultados.

## Descripción general

El proyecto integra diferentes fuentes de información relacionadas con grupos de investigación, semilleros, producción académica y salidas analíticas. La organización del repositorio busca facilitar la trazabilidad del trabajo, la revisión de los scripts y la consulta de los productos derivados del análisis.

## Estructura del repositorio

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

### Descripción de carpetas

* `analisis_salidas/`: contiene los resultados generados durante el proceso de análisis, incluyendo reportes, salidas intermedias o productos derivados.
* `bd_grupos_acm/`: almacena las bases de datos relacionadas con grupos de investigación.
* `bd_semilleros_mlj/`: contiene las bases de datos asociadas con semilleros de investigación.
* `img/`: reúne imágenes, gráficos, capturas o recursos visuales utilizados en los informes o documentos del proyecto.
* `r_scripts/`: contiene los scripts desarrollados en R para limpieza, transformación, análisis y generación de resultados.
* `tablas_scraping/`: almacena tablas obtenidas, estructuradas o procesadas a partir de procesos de consulta y extracción de información.

## Reproducibilidad

Los análisis pueden reproducirse a partir de los scripts ubicados en la carpeta `r_scripts/`. Se recomienda ejecutar los archivos de forma ordenada, verificando previamente la ubicación de las bases de datos y las rutas internas utilizadas en cada script.

## Requisitos generales

Para trabajar con este repositorio se recomienda contar con:

* R
* RStudio
* Git
* Cuenta activa en GitHub
* Paquetes de R utilizados en los scripts del proyecto

Los paquetes requeridos deberán instalarse según las librerías declaradas al inicio de cada script.

## Uso del repositorio

1. Clonar o descargar el repositorio.
2. Abrir el archivo `analisis-investigacion.Rproj` en RStudio.
3. Revisar las carpetas de bases de datos.
4. Ejecutar los scripts disponibles en `r_scripts/`.
5. Consultar las salidas generadas en `analisis_salidas/`.

## Estado del proyecto

Este repositorio se encuentra en construcción y será actualizado progresivamente con nueva documentación, ajustes metodológicos, diccionario de datos y resultados derivados del análisis.

## Nota de confidencialidad

En caso de que las bases de datos contengan información institucional sensible, datos personales o información no anonimizada, se recomienda mantener este repositorio como privado o publicar únicamente versiones anonimizadas de los archivos.

## Autoría institucional

Repositorio desarrollado en el marco de actividades de análisis académico e investigación institucional.

Universidad de Santander – UDES
Coordinación de Analítica Académica
