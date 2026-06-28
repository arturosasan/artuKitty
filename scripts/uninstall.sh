#!/usr/bin/env bash
set -euo pipefail

echo "[*] Removing symlinks and restoring backups..."

restore() {
  local dest="$1"

  if [[ -L "$dest" ]]; then
    rm "$dest"
    echo "  -> Removed symlink $dest"
  fi

  if [[ -f "${dest}.backup" ]]; then
    mv "${dest}.backup" "$dest"
    echo "  -> Restored ${dest}.backup => $dest"
  fi
}

restore "$HOME/.zshrc"
restore "$HOME/.p10k.zsh"

if git config --global --get include.path &>/dev/null; then
  git config --global --unset include.path
  echo "  -> Removed git include.path"
fi

if [[ -L "$HOME/.gitconfig" ]]; then
  restore "$HOME/.gitconfig"
fi

restore "$HOME/.config/kitty/kitty.conf"

echo "[*] Uninstall complete. Restart your terminal."
