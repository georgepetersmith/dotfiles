eval "$(starship init zsh)"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls="eza"
alias ll="eza -l"
alias lla="eza -la"
alias lt="eza -T"
alias ltg="eza -T --git-ignore"
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

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(zoxide init zsh)"

# ================

[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/zsh"
