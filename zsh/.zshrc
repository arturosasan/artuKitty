if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git conectaT)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.opencode/bin:$PATH"

export EDITOR=nvim

DOTFILES_DIR="${${(%):-%x}:A:h:h}"
[[ -f "$DOTFILES_DIR/zsh/aliases.zsh" ]]    && source "$DOTFILES_DIR/zsh/aliases.zsh"
[[ -f "$DOTFILES_DIR/zsh/functions.zsh" ]]   && source "$DOTFILES_DIR/zsh/functions.zsh"
[[ -f "$DOTFILES_DIR/zsh/keybindings.zsh" ]] && source "$DOTFILES_DIR/zsh/keybindings.zsh"

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v thefuck &>/dev/null && eval "$(thefuck --alias)"
command -v fzf &>/dev/null && {
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline"
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# NVM lazy load
# zsh-syntax-highlighting (loaded last for faster startup)
source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" 2>/dev/null

export NVM_DIR="$HOME/.nvm"
lazy_nvm() {
  unset -f node npm npx nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
}
node() { lazy_nvm; node "$@"; }
npm()  { lazy_nvm; npm "$@"; }
npx()  { lazy_nvm; npx "$@"; }
nvm()  { lazy_nvm; nvm "$@"; }
