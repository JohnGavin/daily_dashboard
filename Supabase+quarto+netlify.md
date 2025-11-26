Each mistake pattern teaches you how to redirect Claude (and yourself)
Feed documentation _links_ _upfront_
Use mcptools, provide str(data) output, give lookup tables
Ask for multiple approaches, _request simplest_ solution


# https://dalyanalytics.github.io/me-myself-claude-talk/#/client-example-using-github-actions-for-data-orchestration
Data Orchestration Repo
GitHub Actions (API, webhooks, Railway)
↓
Load Data in **Supabase**
RLS rules per client_id for **data isolation**
↓
Client Dashboards (Quarto)
50+ dashboards on **Netlify**, each pulls only their data
↓
Template System
Shared components, feature toggles, GH Action PRs for updates
Right-sized enterprise-grade infrastructure built in a few weeks with Claude Code’s help.


Part 3: Building Up Your R Intuition Through Volume
Claude doesn’t read the docs!
e.g. installing a package and guessing without reading vignettes/examples
	=> Fix strategy: Feed Claude the documentation URL, then it self-corrects

The lesson: Use mcptools (== btw??) to give Claude actual R session context
Fix strategy: names(data), str(data), or **let mcptools read your environment**


Fix strategy: Ask for multiple options, choose the simplest that works
simplicity is a skill—recognizing unnecessary complexity




