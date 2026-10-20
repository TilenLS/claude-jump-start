# 4. Compute access for agents

## Host → login node (passwordless)

On the host node:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_login -C "host-agent"   # empty passphrase
cat ~/.ssh/id_ed25519_login.pub    # append to ~/.ssh/authorized_keys on the login node
```

Use [`config/ssh_config.host`](../config/ssh_config.host). It defines:

- `<login_alias>`: your interactive login (opens in `<project_root>`)
- `<login_alias>-agent`: for agents. It has no `RemoteCommand`, so `ssh <login_alias>-agent "cmd"` works, and `ControlPersist` reuses one connection for speed.
- GPU pool nodes: reached through the login node (`ProxyJump`)

Test:

```bash
ssh -o BatchMode=yes <login_alias>-agent hostname   # no password prompt
ssh canada nvidia-smi                               # a GPU pool node
```

## Wrapper scripts (agents use these, not ad-hoc commands)

In [`templates/project/scripts/`](../templates/project/scripts/):

| Script | Does |
|--------|------|
| `free_nodes.sh` | Lists idle GPU pool nodes (no other users, <10% util, <2 GB VRAM) |
| `run_gpu.sh <node> <run> <cmd…>` | Runs a command detached on a node, logs to `logs/<run>.log` |
| `submit.sh <job.sh>` | Submits a job to the HPC scheduler |

`jobs/template.sh`: fill in the resource flags from a job script you know works on your cluster.

## Etiquette (put it in CLAUDE.md)

- Never use a node that has another user on it.
- At most 2 nodes without asking.
- Never kill processes you didn't start.
- Heavy runs go to the GPU pool or HPC, never the login node.
