# Log of commands to fix CI dashboard
# Date: 2025-11-28

# 1. Fixed CI build failure by updating default.R to use a recent date (2025-11-24)
#    This resolves the gfortran library missing error by using a newer nixpkgs snapshot.
#    Regenerated default.nix via rix::rix().

# 2. Updated _quarto.yml to point to correct source files in inst/qmd/
#    - href: inst/qmd/index.qmd
#    - href: inst/qmd/xkcd.qmd

# 3. Created root index.qmd to handle redirection
#    Ensures docs/index.html is generated and redirects to inst/qmd/index.html.

library(gert)

files_to_stage <- c(
  "default.R",
  "default.nix",
  "_quarto.yml",
  "index.qmd",
  "R/setup/fix_ci_dashboard.R"
)

gert::git_add(files_to_stage)

gert::git_commit("Fix CI: Update Nix env to 2025-11-24 and fix Quarto paths\n\n- Updates default.R/nix to resolve gfortran build error.\n- Updates _quarto.yml to point to inst/qmd sources.\n- Adds root index.qmd for redirection.")
usethis::pr_push()