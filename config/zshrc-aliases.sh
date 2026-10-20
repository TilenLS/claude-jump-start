# Append to ~/.zshrc (or ~/.bashrc) on your LAPTOP, then: source ~/.zshrc

# Shell on the host node (two hops via the login node)
alias <host_alias>='ssh -t -o RemoteCommand=none <login_alias> ssh <host_alias>'

# Straight into the Claude session on the host (attaches, or starts it)
alias <host_alias>-claude="ssh -t -o RemoteCommand=none <login_alias> ssh -t <host_alias> \"tmux new -A -s claude -c <project_root> 'claude --continue || claude; exec bash'\""

# Example (mine):
# alias msi='ssh -t -o RemoteCommand=none tails ssh msi'
