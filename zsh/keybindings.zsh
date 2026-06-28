_fzf_edit_widget() {
  local file
  file=$(fd --type f --hidden --follow --exclude .git 2>/dev/null | fzf --height 40% --reverse --preview 'bat --color=always --line-range :50 {} 2>/dev/null || cat {}')
  if [[ -n "$file" ]]; then
    BUFFER="${EDITOR:-vim} $file"
    zle accept-line
  fi
  zle redisplay
}
zle -N _fzf_edit_widget
bindkey '^F' _fzf_edit_widget

_lazygit_widget() {
  lazygit
  zle redisplay
}
zle -N _lazygit_widget
bindkey '^G' _lazygit_widget
