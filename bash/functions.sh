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

tmux-help() {
  echo ""
  echo "  ╔══════════════════════════════════════╗"
  echo "  ║         🧠  Tmux Cheatsheet           ║"
  echo "  ╚══════════════════════════════════════╝"
  echo ""
  echo "  Prefix: Ctrl+b   (press, release, then key)"
  echo ""
  echo "  🪟  Sessions"
  echo "  ─────────────────────────────────────────"
  echo "  tmux                →  start new session"
  echo "  tmux new -s NAME    →  start named session"
  echo "  tmux ls             →  list sessions"
  echo "  tmux a -t NAME      →  attach to session"
  echo "  prefix d            →  detach"
  echo "  prefix s            →  session picker"
  echo "  prefix \$            →  rename session"
  echo ""
  echo "  🗂  Windows (tabs)"
  echo "  ─────────────────────────────────────────"
  echo "  prefix c            →  new window"
  echo "  prefix ,            →  rename window"
  echo "  prefix n / p        →  next / prev window"
  echo "  prefix 0..9         →  jump to window N"
  echo "  prefix w            →  window picker"
  echo "  prefix &            →  kill window"
  echo ""
  echo "  ▣  Panes (splits)"
  echo "  ─────────────────────────────────────────"
  echo "  prefix %            →  split vertical"
  echo "  prefix \"            →  split horizontal"
  echo "  prefix arrow        →  focus pane"
  echo "  prefix o            →  cycle panes"
  echo "  prefix z            →  zoom pane (toggle)"
  echo "  prefix x            →  kill pane"
  echo "  prefix {  / }       →  swap pane left / right"
  echo "  prefix space        →  cycle layouts"
  echo "  prefix Ctrl+arrow   →  resize pane (hold)"
  echo ""
  echo "  📋  Copy / Scroll"
  echo "  ─────────────────────────────────────────"
  echo "  prefix [            →  enter copy mode"
  echo "  q                   →  exit copy mode"
  echo "  mouse drag          →  select → pbcopy (OSC 52)"
  echo "  prefix ]            →  paste"
  echo ""
  echo "  🛠  Misc"
  echo "  ─────────────────────────────────────────"
  echo "  prefix ?            →  list ALL bindings"
  echo "  prefix :            →  command prompt"
  echo "  source-tmux         →  reload ~/.tmux.conf"
  echo ""
}
