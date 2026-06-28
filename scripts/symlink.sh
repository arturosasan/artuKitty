#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "[*] Creating symlinks..."

backup_and_link() {
  local src="$1"
  local dest="$2"

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "  [!] Backing up existing $dest -> ${dest}.backup"
    mv "$dest" "${dest}.backup"
  fi

  if [[ -L "$dest" ]]; then
    rm "$dest"
  fi

  ln -s "$src" "$dest"
  echo "  -> $src => $dest"
}

backup_and_link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

if [[ -f "$DOTFILES_DIR/zsh/.p10k.zsh" ]]; then
  backup_and_link "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
fi

if [[ -f "$HOME/.gitconfig" ]]; then
  echo "  [!] ~/.gitconfig exists. Merging aliases only (preserving your name/email)..."
  git config --global include.path "$DOTFILES_DIR/git/.gitconfig"
  echo "  -> Added include.path for dotfiles gitconfig"
else
  backup_and_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

echo "[*] Linking Kitty config..."
mkdir -p "$HOME/.config/kitty"
backup_and_link "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

echo "[*] Symlinks created!"
