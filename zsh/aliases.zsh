alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

if command -v eza &>/dev/null; then
  alias ls="eza --icons=always"
  alias ll="eza -la --git --icons=always"
  alias la="eza -a --icons=always"
  alias lt="eza --tree --level=2 --icons=always"
  alias lta="eza --tree --level=2 --icons=always -a"
  alias l="ll"
fi

if command -v bat &>/dev/null; then
  alias cat="bat --paging=never"
  alias catp="bat --plain"
fi

if command -v rg &>/dev/null; then
  alias grep="rg"
fi

if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
  alias fd="fdfind"
fi

alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gsw="git switch"
alias lg="lazygit"
alias ghb="gh browse"
alias gdm="git diff main...HEAD | delta"

alias dkps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dkc="docker compose"
alias dkcu="docker compose up -d"
alias dkcd="docker compose down"
alias dkcl="docker compose logs -f"
alias dkl="lazydocker"

alias ports="ss -tulnp"
alias myip="curl -s ifconfig.me"
alias dirsize="dust"

alias zshrc="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc && echo 'zsh config reloaded'"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias cls="clear"
alias h="history | tail -30"
alias path='echo $PATH | tr ":" "\n" | sort'
alias weather="curl wttr.in/?format=3"
