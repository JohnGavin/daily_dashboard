library(rix)

# Packages from DESCRIPTION
r_pkgs <- c(
  "shiny",
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
  "curl",
  "treasury"
)

system_pkgs <- c(
  "quarto",
  "git"
)

rix(
  date = "2025-11-24",
  r_pkgs = r_pkgs,
  system_pkgs = system_pkgs,
  ide = "none",
  project_path = ".",
  overwrite = TRUE,
  shell_hook = ""
)