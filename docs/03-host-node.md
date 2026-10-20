# 3. Host node

The host node runs the agents. It holds no data, only Claude Code, tmux and `CLAUDE.md` files.

## Install

```bash
curl -fsSL https://claude.ai/install.sh | bash
sudo apt install -y tmux git
claude            # sign in with your claude.ai (Team) account: /login, check with /status
```

Use claude.ai login, not an API key. Remote Control needs it.

## Keep it awake

```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Laptop as host node? Also set lid-close to "do nothing", and use a wired connection.

## Always run Claude inside tmux

Append [`config/bashrc-snippet.sh`](../config/bashrc-snippet.sh) to `~/.bashrc`. Then typing `claude` outside tmux opens (or reattaches) the `claude` tmux session.

## Restart after reboot

1. Copy [`config/claude-tmux.service`](../config/claude-tmux.service) to `~/.config/systemd/user/`.
2. Enable it:

```bash
systemctl --user daemon-reload
systemctl --user enable claude-tmux       # add --now only if no 'claude' tmux session exists
sudo loginctl enable-linger <host_user>   # run without being logged in
```

## Remote Control (drive it from the app or phone)

1. An admin enables **Cloud sessions** and **Remote Control** at claude.ai → Admin settings → Claude Code.
2. Start with `claude --remote-control`, or type `/remote-control` in a session.
3. Optional: `/config` → **Enable Remote Control for all sessions**.
4. Open the session at claude.ai/code or in the Claude app.
