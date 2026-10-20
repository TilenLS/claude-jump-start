# External brain

GitHub holds everything worth keeping: code, papers and notes. Every machine and every new session reads from it.

## Claude ↔ GitHub

- **Claude Code (host node):**
  ```bash
  gh auth login          # GitHub.com → SSH → generate key → browser login
  ssh -T git@github.com
  ```
- **Claude app / Cowork:** enable the GitHub connector or plugin in claude.ai settings (an admin may need to approve it).

## Overleaf ↔ GitHub

One repo per Overleaf project. Git access requires the project owner to have Overleaf premium.

```bash
git clone https://git.overleaf.com/<overleaf_project_id> paper   # Overleaf Git token as password
cd paper
git remote rename origin overleaf
git remote add github git@github.com:<github_user>/paper.git    # empty private repo
git push github main
```

- Routine: `git pull overleaf main`, then edit and commit, then `git push overleaf main && git push github main`.
- Overleaf has no branches, LFS or submodules.
- Git pushes can displace Overleaf comments and tracked changes, so agree on editing times with co-authors.
- For a paper inside a code repo: put it in `paper/` and use `git subtree push --prefix paper overleaf master`.
- Alternative (owner only): Overleaf → Integrations → GitHub → push the project to a new repo. Sync is manual.

## Obsidian ↔ GitHub

1. Install the **Obsidian Git** community plugin.
2. Point the vault at a private repo and enable auto-commit and push.
3. Clone that repo on the login node so agents can read your notes.
