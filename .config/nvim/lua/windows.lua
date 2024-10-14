vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }

vim.o.shell= "powershell"
vim.o.shellcmdflag= "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellquote= ""
vim.o.shellxquote= ""
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
