vim.cmd("autocmd!")

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fillchars = { eob = " " } -- Disable '~' on non-existent lines
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.ch = 0
vim.opt.spell=true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.fixeol = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- local no_num_filetypes {
--   'oil',
--   'NvimTree',
--   'TelescopePrompt',
-- }

-- Toggle relative numbers on for normal mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = '*',
  callback = function (ev)
    if vim.bo.filetype == "TelescopePrompt" or vim.bo.filetype == "oil" then
      vim.cmd('setlocal nonumber norelativenumber')
      return
    end
    vim.cmd('setlocal number norelativenumber')
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  callback = function (ev)
    if vim.bo.filetype == "TelescopePrompt" or vim.bo.filetype == "oil" then
      vim.cmd('setlocal nonumber norelativenumber')
      return
    end
    vim.cmd('setlocal number relativenumber')
  end
})

vim.cmd("autocmd FileType lua setlocal tabstop=2 shiftwidth=2")

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
