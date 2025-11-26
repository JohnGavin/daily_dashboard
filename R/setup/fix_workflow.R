gert::git_add(".github/workflows/daily.yaml")
gert::git_commit("fix: Correct working directory in daily workflow")
usethis::pr_push()
