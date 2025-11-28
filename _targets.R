library(targets)
library(tarchetypes)

# Source R functions
tar_source(files = c("R/treasury.R", "R/xkcd.R"))

# Options
tar_option_set(
  packages = c("tibble", "dplyr", "httr2", "jsonlite", "dailydashboard")
)

# Pipeline
list(
  tar_target(
    xkcd_data,
    fetch_xkcd()
  ),
  tar_target(
    xkcd_file,
    {
      jsonlite::write_json(xkcd_data, "data/xkcd.json", auto_unbox = TRUE)
      "data/xkcd.json"
    },
    format = "file"
  ),
  # tar_target(
  #   treasury_data,
  #   fetch_treasury_data()
  # ),
  # tar_target(
  #   treasury_file,
  #   {
  #     jsonlite::write_json(treasury_data, "data/treasury.json", auto_unbox = TRUE)
  #     "data/treasury.json"
  #   },
  #   format = "file"
  # )
)
