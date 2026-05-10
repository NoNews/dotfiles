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

help() {
  echo ""
  echo "  ╔══════════════════════════════════════╗"
  echo "  ║        🛠  Shell Navigation           ║"
  echo "  ╚══════════════════════════════════════╝"
  echo ""
  echo "  📁 Project Navigation"
  echo "  ─────────────────────────────────────────"
  echo "  plush      →  plush-assistant"
  echo "  plushbak   →  plush-assistant-memory-backup"
  echo "  sm         →  MoodTracker (native)"
  echo "  smweb      →  simple-mood-tracker (web)"
  echo ""
  echo "  🔧 Git"
  echo "  ─────────────────────────────────────────"
  echo "  compu \"msg\"  →  git add . && commit && push"
  echo ""
  echo "  ℹ️  help       →  show this menu"
  echo ""
}
