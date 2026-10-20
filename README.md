# Claude Jump-Start

A minimal, modular guide to running Claude Code agents for research: agents on an always-on host machine, code and data on a login node, jobs on GPU/HPC nodes, GitHub as shared memory.

Written for UCL CS, but the setup works for any university cluster.

## Read in this order

| # | File | What it covers |
|---|------|----------------|
| 1 | [docs/01-architecture.md](docs/01-architecture.md) | The machines, their roles, and the placeholders used throughout |
| 2 | [docs/02-ssh-basics.md](docs/02-ssh-basics.md) | SSH from zero: keys, config, connecting to your host node |
| 3 | [docs/03-host-node.md](docs/03-host-node.md) | Claude Code, tmux, always-on, Remote Control |
| 4 | [docs/04-compute.md](docs/04-compute.md) | Login node, GPU pool and HPC access for agents |
| 5 | [docs/05-git-overleaf-obsidian.md](docs/05-git-overleaf-obsidian.md) | GitHub as external brain |
| 6 | [docs/06-cheatsheet.md](docs/06-cheatsheet.md) | Commands and when to use them |
| 7 | [docs/07-sessions-and-context.md](docs/07-sessions-and-context.md) | Clear, compact, rewind, models, handoff |
| 8 | [docs/08-good-practice.md](docs/08-good-practice.md) | Habits that improve quality and save usage |
| 9 | [docs/09-troubleshooting.md](docs/09-troubleshooting.md) | Errors we hit and the fixes |

## Ready-to-copy files

- `config/`: SSH configs, tmux/systemd and shell snippets
- `templates/project/`: a project skeleton (README, CLAUDE.md, NOTES.md, scripts, job template, permissions)
- `templates/CLAUDE.global.md`: rules for every agent session (`~/.claude/CLAUDE.md`)

Replace every `<placeholder>` before use (see [docs/01-architecture.md](docs/01-architecture.md)).
