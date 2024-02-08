vim.cmd("autocmd!")
vim.g.mapleader = " "
vim.g.netrw_banner = 0;
vim.g.netrw_winsize = 25;
vim.opt.autoindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.breakindent = true
vim.opt.ch = 0
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.fillchars = { eob = " " } -- Disable '~' on non-existent lines
vim.opt.fixeol = false
vim.opt.history = 100
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.inccommand = 'split'
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.scrolloff = 10
vim.opt.shell = 'bash'
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = true
vim.opt.writebackup = false
vim.wo.number = true
