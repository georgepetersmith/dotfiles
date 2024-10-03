vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.path:append { '**' }
vim.opt.syntax = 'ON'
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.pumheight = 10
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.spelloptions = 'camel'
vim.opt.spelllang = 'en_gb'
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.belloff = 'all'
vim.cmd('filetype plugin on')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_windows = has "win32"

if is_mac then
  require("macos")
end
if is_windows then
  require("windows")
end

vim.cmd("colorscheme retrobox")
vim.opt.background = "dark"

vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.filetype.add({
  extension = {
    razor = "html",
  },
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    import = "plugins"
  },
  install = { colorscheme = { "retrobox" } },
  checker = { enabled = false }
})

