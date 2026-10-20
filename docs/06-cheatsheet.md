# 6. Cheat sheet

## Inside Claude Code

| Command / key | Does | Use when |
|---------------|------|----------|
| `Shift+Tab` | Cycles to **plan mode**: Claude proposes, changes nothing until you approve | Any non-trivial task |
| `Esc` | Stops Claude immediately | It heads the wrong way |
| `/rewind` or `Esc Esc` | Rolls back code and/or conversation; can summarise from/up to a point | A wrong turn or a messy detour |
| `/clear` | Fresh session (free); `CLAUDE.md` still loads | Switching to an unrelated task |
| `/compact <what to keep>` | Summarises the session, keeping what you name | Long session, same task |
| `/rename` · `/resume` | Name a session · reopen one | Before clearing something you may revisit |
| `/branch` | Fork the session to try an alternative | Exploring two approaches |
| `/model` | Switch model (`Enter` saves default) | Start of a task |
| `/effort` | Thinking effort low → max | Lower for routine work |
| `/context` | What fills the context | Session feels slow |
| `/usage` | Plan usage + what used it (`w` = 7 days) | Daily check |
| `/insights` | Report on your recent sessions with tips | Weekly |
| `/memory` | Edit `CLAUDE.md` files | Updating rules |
| `/mcp` | Manage MCP servers | Disable unused ones |
| `/init` | Drafts a `CLAUDE.md` for the repo | New project |
| `/remote-control` | Make the session drivable from the app/phone | Before walking away |

## Shell

| Command | Does |
|---------|------|
| `claude --continue` / `--resume` | Reopen last / pick a session |
| `claude --remote-control` | Start with Remote Control on |
| `claude agents` | List background sessions |
| `claude daemon stop --any --keep-workers` → `claude agents` → `claude respawn --all` | Restart background sessions so they pick up new settings |
| `tmux new -A -s claude` · `Ctrl-b d` · `tmux ls` | Start/attach · detach · list |
