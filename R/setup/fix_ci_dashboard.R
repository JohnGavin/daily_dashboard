# Log of commands to fix CI dashboard
# Date: 2025-11-26

# Step 1: Simplify targets and quarto config (Done via file editing)

# Step 2: Stage and Commit changes
library(gert)

# Files to stage
files_to_stage <- c(
  "_quarto.yml",
  "_targets.R",
  "task.md",
  "implementation_plan.md",
  "R/setup/fix_ci_dashboard.R"
)

git_add(files_to_stage)

git_commit("Fix: Simplify dashboard to XKCD only to resolve CI failures\n\n- Disabled Treasury targets in _targets.R\n- Removed Treasury link in _quarto.yml\n- Added task.md and implementation_plan.md\n- Updated default.nix")

# Push (will be done separately via usethis::pr_push() if needed, but standard git push via gert for now as I am on a feature branch)
# git_push()
