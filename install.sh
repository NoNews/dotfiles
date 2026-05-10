#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked: $dst -> $src"
}

inject() {
  local line="$1" file="$2"
  if ! grep -qF "$line" "$file" 2>/dev/null; then
    echo "$line" >> "$file"
    echo "  injected into $file: $line"
  else
    echo "  already present in $file: $line"
  fi
}

echo "Linking dotfiles..."
link "$DOTFILES/tmux/tmux.conf"  ~/.tmux.conf
link "$DOTFILES/ghostty/config"  ~/.config/ghostty/config

echo "Injecting sources..."
inject "source \"$DOTFILES/bash/functions.sh\""  ~/.bash_profile
inject "[ -f ~/.bash_profile.local ] && source ~/.bash_profile.local"  ~/.bash_profile

echo "Done. Reload shell to apply."
