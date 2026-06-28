# artuKitty

Personal dotfiles and terminal setup for Kitty on Arch Linux. One script to bootstrap a new machine with a fully configured terminal environment.

## What's included

- **Kitty** terminal emulator config with JetBrainsMono Nerd Font, keybindings for splits/tabs/navigation
- **Zsh** with Oh My Zsh + Powerlevel10k + syntax highlighting + autosuggestions
- **Modern CLI tools**: bat, eza, fd, ripgrep, zoxide, delta, dust, tldr, thefuck, glow
- **TUI tools**: lazygit, lazydocker
- **Fuzzy cheatsheets**: searchable keyboard shortcut reference

## Quick start

```bash
git clone https://github.com/arturosasan/artuKitty.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Structure

```
artuKitty/
├── install.sh              # Entry point (installs packages + creates symlinks)
├── install-arch.sh         # Arch Linux package installation
├── scripts/
│   ├── symlink.sh          # Creates symlinks for all dotfiles
│   └── uninstall.sh        # Reverts symlinks and restores backups
├── zsh/
│   ├── .zshrc              # Main zsh config (modular, sources separate files)
│   ├── aliases.zsh         # Aliases with command -v guards
│   ├── functions.zsh       # Custom functions (mkcd, fkill, serve, cheat, etc.)
│   └── keybindings.zsh     # Custom keybindings (Ctrl+F, Ctrl+G)
├── kitty/
│   └── kitty.conf          # Kitty terminal emulator configuration
├── git/
│   └── .gitconfig          # Git config with delta pager (side-by-side diffs)
├── cheatsheet/
│   ├── terminal.md         # Terminal shortcuts
│   ├── git.md              # Git shortcuts
│   ├── kitty.md            # Kitty shortcuts
│   ├── docker.md           # Docker shortcuts
│   └── custom.md           # Custom commands
├── README.md
└── LICENSE
```

## Keybindings

| Shortcut | Action |
|----------|--------|
| `Ctrl+F` | Fuzzy find file and open in editor |
| `Ctrl+G` | Launch lazygit |
| `Ctrl+R` | Fuzzy search command history (fzf) |
| `Ctrl+Shift+Enter` | Kitty: new window (split) |
| `Ctrl+Shift+T` | Kitty: new tab |
| `Ctrl+Shift+Arrow` | Kitty: navigate between windows |
| `Ctrl+Shift+Alt+Arrow` | Kitty: resize window |

## Useful commands

| Command | Action |
|---------|--------|
| `lg` | lazygit |
| `dkl` | lazydocker |
| `dkcu` / `dkcd` | docker compose up / down |
| `dksh` | Shell into container (fuzzy select) |
| `fkill` | Fuzzy kill process |
| `mkcd` | Create directory and cd into it |
| `serve` | Quick HTTP server |
| `cheat` | Browse shortcut cheatsheets |
| `z <dir>` | Smart cd (zoxide) |
| `ll` | List files with icons and git status |
| `path` | Show PATH line by line |

## Tools

| Tool | Purpose |
|------|---------|
| bat | cat with syntax highlighting |
| eza | ls with icons and git status |
| fd | find replacement |
| ripgrep | grep replacement |
| zoxide | Smart directory jumping |
| delta | Git diff pager (side-by-side) |
| fzf | Fuzzy finder |
| lazygit | Git TUI |
| lazydocker | Docker TUI |
| thefuck | Correct previous command |
| dust | Directory size visualization |
| tldr | Simplified man pages |
| glow | Markdown renderer |

## Uninstall

```bash
cd ~/.dotfiles
./scripts/uninstall.sh
```

## Credits

This project is based on [VT-Terminal-Project](https://github.com/ValentinTorassa/VT-Terminal-Project) by [ValentinTorassa](https://github.com/ValentinTorassa). The original project provides dotfiles and terminal setup for Ghostty on macOS and Linux, and served as the inspiration for this Kitty-centric adaptation for Arch Linux.

## License

GPL-3.0
