Import-Module PSReadline

Import-Module PSFzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
function proj {Get-ChildItem -Path $HOME\code -Attributes Directory | Invoke-Fzf | Set-Location}

Import-Module posh-git

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

function dotfiles { git --git-dir=$HOME\.cfg\ --work-tree=$HOME $args }
function lazydot { lazygit --git-dir=$HOME\.cfg\ --work-tree=$HOME }

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

Remove-Alias ls
New-Alias ls eza

Remove-Alias cat
New-Alias cat bat
