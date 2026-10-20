# Setup

## Machines

| Role | Purpose | Example |
|------|---------|---------|
| Laptop | Where you give instructions | MacBook |
| Host node | Always-on machine where agents run (Claude Code + tmux, `CLAUDE.md` files, no data) | lab desktop `msi` |
| Login node | Code and data live here, no heavy runs | `tails.cs.ucl.ac.uk` |
| GPU pool | Single-GPU runs over SSH from the login node | `canada`, `mallard`, … |
| HPC nodes | Multi-GPU runs via `qsub` | `beaker`, `vic`, `pyror`, `wise` |

## Placeholders

| Placeholder | Meaning | Example |
|-------------|---------|---------|
| `<ucl_user_id>` | Cluster username | `tlimback` |
| `<login_domain>` | Login node hostname | `tails.cs.ucl.ac.uk` |
| `<login_alias>` | Short SSH name for it | `tails` |
| `<host_alias>` | Short SSH name for the host node | `msi` |
| `<host_ip>` | Host node address (`hostname -I`, wired) | `128.16.14.66` |
| `<host_user>` | Local account on the host node | `tilen` |
| `<project_root>` | Shared code + data directory | `/cs/research/pplv/comp_bridge` |
| `<project>` | One project under it | `qclip` |
| `<gpu_nodes>` | GPU pool node names | `canada mallard pintail` |

## 1. Laptop

- `~/.ssh/config` ← [`config/ssh_config.laptop`](../config/ssh_config.laptop); then `ssh-copy-id -o RemoteCommand=none <login_alias>`
- `~/.zshrc` ← [`config/zshrc-aliases.sh`](../config/zshrc-aliases.sh). The host node is usually firewalled from outside, so the aliases hop through the login node.

## 2. Login node → host node

```bash
# on the login node
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_host
# append ~/.ssh/id_ed25519_host.pub to ~/.ssh/authorized_keys on the host node
```

`~/.ssh/config` ← [`config/ssh_config.login`](../config/ssh_config.login). On the host: `sudo apt install openssh-server`.

## 3. Host node

```bash
curl -fsSL https://claude.ai/install.sh | bash
sudo apt install -y tmux git
claude                         # /login with claude.ai (Team) account, check /status
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

- `~/.bashrc` ← [`config/bashrc-snippet.sh`](../config/bashrc-snippet.sh) (`claude` always runs in tmux)
- `~/.config/systemd/user/` ← [`config/claude-tmux.service`](../config/claude-tmux.service), then:

```bash
systemctl --user daemon-reload
systemctl --user enable claude-tmux       # add --now only if no 'claude' tmux session exists
sudo loginctl enable-linger <host_user>
```

## 4. Host node → login node and GPU pool

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_login -C host-agent    # empty passphrase
# append ~/.ssh/id_ed25519_login.pub to ~/.ssh/authorized_keys on the login node
```

`~/.ssh/config` ← [`config/ssh_config.host`](../config/ssh_config.host). The `<login_alias>-agent` entry accepts commands and reuses one connection.

```bash
ssh -o BatchMode=yes <login_alias>-agent hostname     # must not prompt
ssh <gpu_node> nvidia-smi
```

## 5. Projects

Copy [`templates/project/`](../templates/project/) to `<project_root>/<project>`, fill in the placeholders, and run `chmod +x scripts/*.sh`. Copy [`templates/CLAUDE.global.md`](../templates/CLAUDE.global.md) to `~/.claude/CLAUDE.md` on the host node. In `jobs/template.sh`, set the resource flags from a job script that already works on your cluster.

## 6. Remote Control

1. Admin: claude.ai → Admin settings → Claude Code → turn on **Cloud sessions** and **Remote Control**.
2. `claude --remote-control`, or `/config` → **Enable Remote Control for all sessions**.
3. Open the session at claude.ai/code or in the Claude app.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Host node times out from outside, even on VPN | Go through the login node (aliases) |
| Key installed, still asks for a password | `chmod go-w ~; chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys`; add `IdentityFile` + `IdentitiesOnly yes` |
| `ssh <login_alias> 'cmd'` fails | `RemoteCommand` conflict: use `<login_alias>-agent` |
| A command is "not found" over `ssh … 'cmd'` | Defined in `.bashrc`: use `bash -ic 'cmd'` or its full path |
| `Ambiguous output redirect` | Remote shell is tcsh: use `\|&` |
| "Remote Control is disabled by your organization's policy" | Enable both toggles, then `claude daemon stop --any --keep-workers` → `claude agents` → `claude respawn --all` |
| `tmux ls` stays `(attached)` | `tmux detach-client -s claude` |
