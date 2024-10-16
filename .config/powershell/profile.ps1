Import-Module PSReadline

Import-Module PSFzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

function proj {Get-ChildItem -Path $HOME\code -Attributes Directory | Invoke-Fzf | Set-Location}
Set-PSReadLineKeyHandler -Chord "Alt+P" -ScriptBlock { proj }

function dotfiles { git --git-dir=$HOME\.cfg\ --work-tree=$HOME $args }
function lazydot { lazygit --git-dir=$HOME\.cfg\ --work-tree=$HOME }

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
Invoke-Expression (&starship init powershell)

Set-Alias ls eza
Set-Alias cat bat

$env:XDG_CONFIG_HOME = "$HOME/.config"

