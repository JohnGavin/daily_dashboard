library(rix)

# Packages from DESCRIPTION
r_pkgs <- c(
  "shiny",
  "shinylive",
  "targets",
  "tarchetypes",
  "ggplot2",
  "dplyr",
  "tibble",
  "httr2",
  "rvest",
  "xml2",
  "bslib",
  "jsonlite",
  "cli",
  "rlang",
  "codetools", 
  "curl"
)

system_pkgs <- c(
  "quarto",
  "git"
)

rix(
  date = "2024-10-01",
  r_pkgs = r_pkgs,
  system_pkgs = system_pkgs,
  ide = "none",
  project_path = ".",
  overwrite = TRUE,
  shell_hook = ""
)