# R/setup/move_qmd_files.R

# This script documents the steps taken to move Quarto markdown (.qmd) files
# to an R package-compliant location and update project configuration.

# Date: 2025-11-27

# 1. Create the inst/qmd/ directory
# run_shell_command("mkdir -p inst/qmd/")

# 2. Move .qmd files to inst/qmd/
# run_shell_command("mv index.qmd treasury.qmd xkcd.qmd inst/qmd/")

# 3. Add inst/qmd/ to .Rbuildignore
# run_shell_command("echo 'inst/qmd/' >> .Rbuildignore")

# 4. Update _quarto.yml to reflect new paths for .qmd files
# This was done using the replace tool.
# Old content:
# website:
#   title: "Daily Dashboard"
#   navbar:
#     left:
#       - href: index.qmd
#         text: Home
#       - href: xkcd.qmd
#         text: XKCD
#       # - href: treasury.qmd
#       #   text: Treasury
# New content:
# website:
#   title: "Daily Dashboard"
#   navbar:
#     left:
#       - href: inst/qmd/index.qmd
#         text: Home
#       - href: inst/qmd/xkcd.qmd
#         text: XKCD
#       # - href: inst/qmd/treasury.qmd
#       #   text: Treasury

# 5. Run local checks to verify changes

devtools::install("R-libs/treasury")
devtools::document()
devtools::test()
devtools::check()
pkgdown::build_site()
