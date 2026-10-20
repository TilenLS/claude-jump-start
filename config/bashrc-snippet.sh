# Append to ~/.bashrc on the HOST NODE.
# Typing `claude` outside tmux opens (or reattaches) the "claude" tmux session.
claude() {
  if [ -z "$TMUX" ]; then
    tmux new -A -s claude -c "$PWD" "command claude $*; exec bash"
  else
    command claude "$@"
  fi
}
