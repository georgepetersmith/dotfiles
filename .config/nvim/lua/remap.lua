vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {})

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>wc', ':bd<CR>')
vim.keymap.set('n', 'gp', ':bprevious<CR>')
vim.keymap.set('n', 'gn', ':bnext<CR>')
