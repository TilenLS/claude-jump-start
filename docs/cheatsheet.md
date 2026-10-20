# Cheat sheet

## Claude Code

| Command / key | Does | Use when |
|---------------|------|----------|
| `Shift+Tab` | **Plan mode**: proposes a plan, changes nothing until approved | Any non-trivial task |
| `Esc` | Stop immediately | It heads the wrong way |
| `/rewind` or `Esc Esc` | Roll back code/conversation; summarise from/up to a point | Wrong turn or messy detour |
| `/clear` | Fresh session (free); `CLAUDE.md` still loads | New, unrelated task |
| `/compact <keep…>` | Summarise, keeping what you name | Long session, same task |
| `/rename` · `/resume` | Name · reopen a session | Before clearing something you may revisit |
| `/branch` | Fork to try an alternative | Two approaches |
| `/model` | Switch model (`Enter` saves default) | Start of a task |
| `/effort` | Thinking effort low → max | Lower for routine work |
| `/context` | What's filling the context | Session feels slow |
| `/usage` | Plan usage + breakdown (`w` = 7 days) | Daily |
| `/insights` | Report on recent sessions with tips | Weekly |
| `/memory` | Edit `CLAUDE.md` files | Updating rules |
| `/init` | Draft a `CLAUDE.md` | New repo |
| `/mcp` | Manage MCP servers | Disable unused ones |
| `/remote-control` | Drive the session from app/phone | Before walking away |

## Shell

| Command | Does |
|---------|------|
| `claude --continue` · `--resume` | Reopen last · pick a session |
| `claude --remote-control` | Start with Remote Control |
| `claude agents` | List background sessions |
| `claude daemon stop --any --keep-workers` → `claude agents` → `claude respawn --all` | Reload background sessions after settings change |
| `<host_alias>` · `<host_alias>-claude` | Shell on host · attach to Claude session (laptop aliases) |
| `tmux new -A -s claude` · `Ctrl-b d` · `tmux ls` | Attach/create · detach · list |

## Compute (inside a project)

| Command | Does |
|---------|------|
| `scripts/free_nodes.sh` | Idle GPU pool nodes |
| `scripts/run_gpu.sh <node> <run> <cmd…>` | Detached run, log in `logs/<run>.log` |
| `scripts/submit.sh jobs/<x>.sh` | Submit HPC job |
| `ssh <login_alias>-agent 'bash -lc qstat'` | HPC queue |
