# 9. Troubleshooting

| Symptom | Fix |
|---------|-----|
| `ssh <host_alias>` times out from outside, even on VPN | Department firewall. Go through the login node (two hops) |
| `kex_exchange_identification: Connection closed` | Direct connection refused. Same fix |
| Key in `authorized_keys` but still asked for a password | `chmod` (see 02), the spelling `authorized_keys`, a key on one unbroken line; add `IdentityFile` + `IdentitiesOnly yes` |
| `ssh <login_alias> 'cmd'` fails | `RemoteCommand` conflict. Use `<login_alias>-agent` or `-o RemoteCommand=none` |
| Host node password rejected over SSH | It's the host's local account password, not your UCL one. Better: use a key |
| A command works in an interactive shell but not via `ssh … 'cmd'` | It's defined in `.bashrc`. Use `bash -ic 'cmd'` or its full path (`type cmd`) |
| `Ambiguous output redirect` | The remote shell is tcsh. Use `\|&` instead of `2>&1` |
| `Remote Control is disabled by your organization's policy` | Admin enables Cloud sessions + Remote Control. Old sessions keep the old policy: `claude daemon stop --any --keep-workers` → `claude agents` → `claude respawn --all` |
| `tmux ls` still says `(attached)` after detaching | Another client is attached: `tmux detach-client -s claude` |
| A connector needs admin approval | Ask IT. If the university won't allow it, attach or paste the content |
| Usage burning fast | Sonnet default, `/clear` between tasks, `/usage` breakdown, stop idle `claude agents` |
