# Agent Instructions for daily_dashboard Project

## Workflow Monitoring

- **ALWAYS** provide the full URL to the GitHub Actions workflow run when referring to its status.
- When monitoring a workflow, use a polling loop:
  - Check status every minute.
  - Sleep for one minute between checks.
  - Implement a 5-minute timeout (5 checks).
  - Report the final status or timeout.

## R Command Usage

- **ALWAYS** use the `--quiet` argument when executing R commands via `R -e` or `Rscript`.
  - Example: `R --quiet -e "..."` or `Rscript --quiet ...`
  - This minimizes console output, making logs cleaner and focusing on essential results.
