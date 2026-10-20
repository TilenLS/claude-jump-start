# 1. Architecture

```
 Laptop ──SSH / Remote Control──▶ Host node (agents in tmux)
                                     │ SSH
                                     ▼
                                Login node (code + data, no heavy runs)
                                   │                    │
                          SSH ─────┘                    └───── qsub
                           ▼                                    ▼
                       GPU pool                            HPC nodes
              (single GPU, interactive)              (multi-GPU, scheduler)

 GitHub ◀── code, papers (Overleaf), notes (Obsidian) ──▶ every machine
```

| Role | What it is | Holds | Example (mine) |
|------|------------|-------|----------------|
| **Laptop** | Where you type instructions | SSH config, Claude app | MacBook |
| **Host node** | An always-on machine you can log into (lab desktop, workstation, small server). Agents live here | Claude Code, tmux, shared `CLAUDE.md` files. No data | `ucl-lab-msi-gs66` ("msi") |
| **Login node** | The cluster's entry machine. Your "playground": code and data live here. Never run heavy jobs on it | Repos, datasets on the shared filesystem | `tails.cs.ucl.ac.uk` |
| **GPU pool** | Dedicated single-GPU machines reached via SSH from the login node | Nothing; sees the shared filesystem | `canada`, `mallard` … (as `<name>-l.cs.ucl.ac.uk`) |
| **HPC nodes** | Multi-GPU nodes reached through a job scheduler (`qsub`) | Nothing; sees the shared filesystem | `beaker`, `vic`, `pyror`, `wise` |
| **GitHub** | Shared memory for code, papers, notes | Everything worth keeping | private repos |

## Placeholders used in this repo

| Placeholder | Meaning | Example |
|-------------|---------|---------|
| `<ucl_user_id>` | Your cluster username (CS account) | `tlimback` |
| `<login_domain>` | Full hostname of the login node | `tails.cs.ucl.ac.uk` |
| `<login_alias>` | Short name you give the login node in SSH config | `tails` |
| `<host_alias>` | Short name you give your host node | `msi` |
| `<host_ip>` | Host node's address (`hostname -I` on it; prefer the wired one) | `128.16.14.66` |
| `<host_user>` | Your username on the host node (local account) | `tilen` |
| `<project_root>` | Shared directory for your group's code and data | `/cs/research/pplv/comp_bridge` |
| `<project>` | One project's folder under `<project_root>` | `qclip` |
| `<gpu_nodes>` | Names of the GPU pool machines | `canada mallard pintail` |

Check with your admins which machines you're allowed to use, and whether lab machines may run unattended processes.
