# Common shell functions

compu() {
  if [ -z "$1" ]; then
    echo "Usage: compu \"your commit message\""
    return 1
  fi
  git add .
  git commit -m "$1"
  git push
}

source-tmux() {
  if command -v tmux >/dev/null && tmux info >/dev/null 2>&1; then
    tmux source-file ~/.tmux.conf && echo "tmux reloaded"
  else
    echo "tmux not running"
  fi
}

source-shell() {
  case "$SHELL" in
    *zsh)  source ~/.zshrc       && echo "zsh reloaded" ;;
    *bash) source ~/.bash_profile && echo "bash reloaded" ;;
    *)     echo "unknown shell: $SHELL" ;;
  esac
}

source-ghostty() {
  if pgrep -x ghostty >/dev/null; then
    killall -SIGUSR2 ghostty && echo "ghostty reloaded"
  else
    echo "ghostty not running"
  fi
}

source-all() {
  source-tmux
  source-shell
  source-ghostty
}
