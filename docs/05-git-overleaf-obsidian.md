# 5. GitHub as external brain

Anything worth keeping lives in Git, not in a chat.

## GitHub on the host node

```bash
gh auth login        # GitHub.com → SSH → generate key → browser login
ssh -T git@github.com
```

## Overleaf (one repo per Overleaf project)

Git access needs the project owner to have Overleaf premium. Collaborators can then clone too.

```bash
git clone https://git.overleaf.com/<overleaf-project-id> paper   # asks for an Overleaf Git token
cd paper
git remote rename origin overleaf
git remote add github git@github.com:<github_user>/paper.git    # create an empty private repo first
git push github main
```

Routine: `git pull overleaf main`, edit, commit, then `git push overleaf main && git push github main`.

- No branches, LFS or submodules on Overleaf.
- Pushes can displace Overleaf comments and tracked changes. Agree with co-authors when the agent edits.
- A paper inside a code repo: keep it in `paper/`, push with `git subtree push --prefix paper overleaf master`.

## Obsidian

Install the **Obsidian Git** community plugin, set it to auto-commit and push to a private repo, then clone that repo on the login node so agents can read your notes.
