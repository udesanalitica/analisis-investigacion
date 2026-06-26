# ===== 0) PAQUETES =====
suppressPackageStartupMessages({
  library(rvest)
  library(xml2)
  library(httr)      # para GET con user-agent
  library(dplyr)
  library(stringr)
  library(purrr)
  library(tibble)
  library(writexl)
})

# ===== 1) PARÁMETROS =====
id_convocatoria <- 26

# --- Opción B: URLs y extracción de IDs (limpiamos &amp; -> & y quitamos vacíos) ---
urls <- c(
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000019266",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000006841",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000005950",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000622",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000003691",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000002133",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000003606",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000010258",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000002388",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000011743",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000002053",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000015419",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000012206",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000003213",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000278",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000002316",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000372",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000012354",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000019524",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000005674",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000308",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000005502",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000993",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000017355",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&amp;nroIdGrupo=00000000000803",
  "https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=22&nroIdGrupo=00000000003227"
)

# Limpieza básica y extracción de IDs
urls_clean  <- urls |> as.character() |> str_squish() |> str_replace_all("&amp;", "&")
nroIdGrupo  <- str_match(urls_clean, "nroIdGrupo=([0-9]+)")[,2]
nroIdGrupo  <- nroIdGrupo[!is.na(nroIdGrupo) & nroIdGrupo != ""]
nroIdGrupoU <- unique(nroIdGrupo)

# Validaciones (si quieres que se detenga si no hay 26 únicos, deja 'stop_on_mismatch <- TRUE')
stop_on_mismatch <- TRUE
n_total  <- length(urls_clean)
n_ids    <- length(nroIdGrupo)
n_unicos <- length(nroIdGrupoU)
dups     <- unique(nroIdGrupo[duplicated(nroIdGrupo)])

cat("\n--- RESUMEN URLs/IDs ---\n",
    "Total URLs:        ", n_total, "\n",
    "Con ID detectado:  ", n_ids, "\n",
    "IDs únicos:        ", n_unicos, "\n",
    if (length(dups)) paste0("Duplicados: ", paste(dups, collapse = ", "), "\n") else "Sin duplicados.\n",
    sep = ""
)

if (stop_on_mismatch && n_unicos != 26) {
  stop(sprintf("Se esperaban 26 IDs únicos; se obtuvieron %s. Revisa duplicados/lista incompleta.", n_unicos))
}

# Usaremos solo los únicos (conserva el primer orden de aparición)
nroIdGrupo <- nroIdGrupoU

# Carpeta/salida final
out_xlsx <- "C:/SUGD/Tablas.xlsx"     # <-- AJUSTA la ruta/nombre
dir.create(dirname(out_xlsx), recursive = TRUE, showWarnings = FALSE)

# Pausa cortés entre requests (segundos)
sleep_sec <- 1

# ===== 2) HELPERS =====
build_url <- function(id) {
  sprintf("https://scienti.minciencias.gov.co/gruplac/jsp/Medicion/graficas/verPerfiles.jsp?id_convocatoria=%s&nroIdGrupo=%s",
          id_convocatoria, id)
}

# Elige la "mejor" fila de encabezado: entre las primeras 5, la que tiene menos NA
pick_header_idx <- function(df) {
  top <- head(df, 5)
  na_counts <- apply(top, 1, function(r) sum(is.na(r)))
  which.min(na_counts)
}

clean_table <- function(tab) {
  tab <- tab %>%
    mutate(across(everything(), ~ str_squish(as.character(.)))) %>%
    mutate(across(everything(), ~ na_if(., ""))) %>%
    filter(if_any(everything(), ~ !is.na(.)))
  if (nrow(tab) == 0) return(tibble::as_tibble(tab))
  
  hdr_idx <- pick_header_idx(tab)
  hdr <- tab[hdr_idx, , drop = FALSE] %>% unlist(use.names = FALSE) %>% as.character() %>% str_squish()
  colnames(tab) <- make.names(hdr, unique = TRUE)
  tab <- tab[-hdr_idx, , drop = FALSE]
  
  # elimina columnas completamente vacías
  if (nrow(tab) > 0) {
    keep <- colSums(!is.na(tab)) > 0
    if (any(keep)) tab <- tab[, keep, drop = FALSE]
  }
  tibble::as_tibble(tab)
}

scrape_one <- function(id) {
  url <- build_url(id)
  # GET con user-agent
  res <- httr::GET(
    url,
    httr::user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) R (rvest/httr)"),
    httr::accept("text/html")
  )
  if (httr::http_error(res)) {
    stop(sprintf("HTTP %s en %s", httr::status_code(res), url))
  }
  html_txt <- httr::content(res, as = "text", encoding = "UTF-8")
  page <- read_html(html_txt)
  
  # busca tablas en el contenedor típico; si no, en toda la página
  tablas <- html_elements(page, "div.col-md-10 table")
  if (length(tablas) == 0) tablas <- html_elements(page, "table")
  if (length(tablas) == 0) stop("No se encontraron <table> en la página")
  
  # convierte a data.frames
  dfs <- purrr::map(tablas, ~ html_table(.x, fill = TRUE))
  
  # elige la "más grande" por filas*columnas (más estable que solo nrow)
  sizes <- purrr::map_int(dfs, ~ nrow(.x) * ncol(.x))
  tab_raw <- dfs[[which.max(sizes)]]
  
  tab <- clean_table(tab_raw)
  
  # intenta obtener un título de la página (si existe)
  titulo <- page %>%
    html_elements("h1,h2,h3,.panel-title,.titulo,.title") %>%
    html_text2() %>%
    { .[nchar(.) > 0] } %>%
    { if (length(.) > 0) .[1] else NA_character_ }
  
  if (nrow(tab) == 0) {
    tab <- tibble(.rows = 0)
  }
  tab <- tab %>%
    mutate(
      GrupoId = id,
      GrupoTitulo = titulo,
      FuenteURL = url
    )
  tab
}

# Versión segura (no detiene el loop si falla un grupo)
safe_scrape <- purrr::safely(scrape_one, otherwise = NULL, quiet = TRUE)

# ===== 3) EJECUCIÓN =====
message("Descargando ", length(nroIdGrupo), " páginas...")
results <- vector("list", length(nroIdGrupo))
errors  <- vector("list", length(nroIdGrupo))

for (i in seq_along(nroIdGrupo)) {
  id <- nroIdGrupo[i]
  message(sprintf("[%02d/%02d] %s", i, length(nroIdGrupo), id))
  ans <- safe_scrape(id)
  results[[i]] <- ans$result
  errors[[i]]  <- ans$error
  Sys.sleep(sleep_sec)  # cortesía con el servidor
}

ok_idx  <- purrr::map_lgl(results, ~ !is.null(.x))
ok_tabs <- results[ok_idx]
fail_id <- nroIdGrupo[!ok_idx]

# Consolidado
ALL <- if (any(ok_idx)) dplyr::bind_rows(ok_tabs, .id = "src_idx") else tibble()

# Bitácora
# Tras extraer y limpiar:
# nroIdGrupo tiene TODOS los ids detectados (quizá 26, con repetidos)
# nroIdGrupoU tiene los ÚNICOS (en tu caso 13)

# Decide cuál quieres usar para scrapear:
# Opción 1) Solo IDs únicos (recomendado)
nroIdGrupo_loop <- unique(nroIdGrupo)

# Opción 2) Con repetidos (si por alguna razón deseas repetir llamados)
# nroIdGrupo_loop <- nroIdGrupo

# Bucle: usa SIEMPRE 'nroIdGrupo_loop'
results <- vector("list", length(nroIdGrupo_loop))
errors  <- vector("list", length(nroIdGrupo_loop))

for (i in seq_along(nroIdGrupo_loop)) {
  id <- nroIdGrupo_loop[i]
  message(sprintf("[%02d/%02d] %s", i, length(nroIdGrupo_loop), id))
  ans <- safe_scrape(id)
  results[[i]] <- ans$result
  errors[[i]]  <- ans$error
  Sys.sleep(sleep_sec)
}

ok_idx  <- purrr::map_lgl(results, ~ !is.null(.x))
ok_tabs <- results[ok_idx]
fail_id <- nroIdGrupo_loop[!ok_idx]

# Consolidado
ALL <- if (any(ok_idx)) dplyr::bind_rows(ok_tabs, .id = "src_idx") else tibble()

# Bitácora: usa SIEMPRE el mismo vector del loop (nroIdGrupo_loop)
LOG <- tibble(
  nroIdGrupo = nroIdGrupo_loop,
  ok         = ok_idx,
  error      = purrr::map_chr(
    errors,
    ~ { if (is.null(.x)) "" else tryCatch(conditionMessage(.x), error = function(e) "") }
  )
)

