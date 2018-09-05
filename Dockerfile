FROM rocker/rstudio:3.5.1

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    libudunits2-dev \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev && \
    : "options" && \
  apt-get install -y --no-install-recommends \
    libudunits2-dev \
    libgdal-dev \
    libcairo2-dev && \
    : "For install magick" && \
  apt-get install -y --no-install-recommends \
    libmagick++-dev \
    qpdf && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN set -x && \
  install2.r --error \
    leaflet \
    lwgeom \
    miniUI \
    purrr \
    sf \
    tidyr \
    dplyr && \
  : "For develop and infrastructure" && \
  install2.r --error \
    knitr \
    covr \
    devtools \
    mapview \
    roxygen2 \
    remotes \
    usethis \
    shinyjs \
    reprex \
    DT \
    lintr && \
  : "to knitr R Markdown documents" && \
  install2.r --error \
    caTools && \
  : "create favivon.ico by pkgdown::build_site()" && \
  install2.r --error \
    magick && \
  installGithub.r \
    "r-lib/devtools" \
    "r-lib/roxygen2md" \
    "r-lib/testthat" \
    "r-lib/revdepcheck" \
    "r-lib/pkgdown" \
    "r-lib/pkgload" \ 
    "klutometis/roxygen" \
    "tidyverse/ggplot2" && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
