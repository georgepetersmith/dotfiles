eval "$(starship init zsh)"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls="exa"
alias ll="exa -l"
alias lt="exa -T"
alias ltg="exa -T --git-ignore"
alias x="xplr"
alias cdx='z "$(xplr --print-pwd-as-result)"'
alias cd="z"
alias cdi="zi"
alias n="nvim"

# ================
#       FZF

# Keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# ================

eval "$(zoxide init zsh)"
