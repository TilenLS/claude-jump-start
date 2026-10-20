# 2. SSH basics

**SSH** gives you a terminal on another machine: `ssh user@machine`. Everything you type runs there.

## Keys (log in without a password)

A key pair is two files: a **private key** (stays on your machine, never share it) and a **public key** (`.pub`, you copy it to machines you want to enter).

```bash
ssh-keygen -t ed25519            # creates ~/.ssh/id_ed25519 and id_ed25519.pub
ssh-copy-id <ucl_user_id>@<login_domain>   # copies the .pub to the login node (asks password once)
```

Manual alternative: append the `.pub` line to `~/.ssh/authorized_keys` on the target, then set permissions there:

```bash
chmod go-w ~ && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
```

## The config file (short names)

`~/.ssh/config` turns long commands into `ssh <alias>`:

```
Host tails                      # <login_alias>
    HostName tails.cs.ucl.ac.uk # <login_domain>
    User tlimback               # <ucl_user_id>
```

Full examples: [`config/ssh_config.laptop`](../config/ssh_config.laptop), [`config/ssh_config.host`](../config/ssh_config.host), [`config/ssh_config.login`](../config/ssh_config.login).

## Connecting to your host node

Lab machines usually **can't be reached directly from outside** (even on the VPN): the department firewall blocks them. You go **through the login node** (two hops):

```
laptop ──ssh──▶ login node ──ssh──▶ host node
```

1. **Find the host node's address.** At the machine: `hostname -I` (or ask IT for a fixed hostname). Make sure SSH runs there: `sudo apt install openssh-server`.
2. **Key from login node → host node.** On the login node:
   ```bash
   ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_host
   cat ~/.ssh/id_ed25519_host.pub    # append to ~/.ssh/authorized_keys on the host node
   ```
3. **Give it a name** in the login node's `~/.ssh/config` ([`config/ssh_config.login`](../config/ssh_config.login)).
4. **Test:** `ssh <login_alias>`, then `ssh <host_alias>`.
5. **One-word shortcut on your laptop** ([`config/zshrc-aliases.sh`](../config/zshrc-aliases.sh)):
   ```bash
   alias msi='ssh -t -o RemoteCommand=none tails ssh msi'
   ```

## tmux (sessions that survive disconnects)

| Action | Command |
|--------|---------|
| New or reattach | `tmux new -A -s claude` |
| Detach (keeps running) | `Ctrl-b` then `d` |
| List sessions | `tmux ls` |
| Reattach | `tmux attach -t claude` |
