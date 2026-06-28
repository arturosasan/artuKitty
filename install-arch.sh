#!/usr/bin/env bash
set -uo pipefail

if ! command -v pacman &>/dev/null; then
  echo "[!] This script requires pacman (Arch Linux)"
  exit 1
fi

install_pkg() {
  sudo pacman -S --noconfirm "$@"
}

try_install() {
  local name="$1"
  shift
  echo "  -> $name"
  if ! "$@"; then
    echo "  [!] $name install failed (non-fatal, continuing)"
  fi
}

echo "[*] Updating package lists..."
sudo pacman -Sy || true

echo "[*] Installing packages..."
install_pkg git curl wget jq unzip zsh base-devel || true

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "[*] Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true
fi

echo "[*] Installing modern CLI tools..."
install_pkg fzf fd ripgrep bat eza zoxide xclip thefuck tldr glow git-delta dust lazygit lazydocker || true

if ! command -v nvim &>/dev/null; then
  echo "  -> nvim"
  install_pkg neovim || true
fi

if ! fc-list 2>/dev/null | grep -qi "JetBrainsMono Nerd"; then
  echo "[*] Installing JetBrainsMono Nerd Font..."
  mkdir -p "$HOME/.local/share/fonts"
  if curl -Lo /tmp/JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"; then
    unzip -o /tmp/JetBrainsMono.zip -d "$HOME/.local/share/fonts/JetBrainsMono" > /dev/null
    fc-cache -f
    rm -f /tmp/JetBrainsMono.zip
    echo "  -> Font installed"
  else
    echo "  [!] Font download failed"
  fi
fi

echo "[*] Arch package installation complete!"
