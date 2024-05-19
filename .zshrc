alias ls="eza"
alias ll="eza -l"
alias lla="eza -la"
alias lt="eza -T"
alias ltg="eza -T --git-ignore"
alias cdx='z "$(xplr --print-pwd-as-result)"'
alias cd="z"
alias cdi="zi"
alias vi="nvim"
alias vim="nvim"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval "$(zoxide init zsh)"
source <(fzf --zsh)
