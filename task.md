# Task: Daily Dashboard Project (Simplified)

The primary goal is to establish a reliable daily dashboard update on GitHub Pages. 
**Current Phase**: Simplify the project to only deploy the "XKCD" page to ensure the GitHub Actions workflow passes.

## 1. xkcd.com Cartoon Page (Active)
- **Page Title:** 'xkcd cartoon'
- **Content:** Display the latest xkcd.com cartoon.
- **Caption:** Include the xkcd.com caption below the image.
- **Interactivity:**
    - Click image -> navigate to `explainxkcd.com`.
    - Hover -> show URL.
- **Status:** Enabled.

## 2. Treasury Daily Interest Rates Page (Temporarily Disabled)
- **Status:** Disabled in `_targets.R` and `_quarto.yml` to debug CI/CD failures.
- **Future Work:** Re-enable once the xkcd workflow is stable.

## Daily Updates and Workflow
- **Automation:** Daily GitHub Actions workflow running `targets::tar_make()`.
- **Environment:** Nix-based reproducibility.
