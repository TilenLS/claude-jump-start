# ~/.ssh/config on the LOGIN NODE
# Lets you hop to your host node: ssh <host_alias>
# Key: ~/.ssh/id_ed25519_host (public half in the host node's authorized_keys)

Host <host_alias>                        # e.g. msi
    HostName <host_ip>                   # e.g. 128.16.14.66 (wired address)
    User <host_user>                     # e.g. tilen (local account on the host)
    IdentityFile ~/.ssh/id_ed25519_host
    IdentitiesOnly yes
