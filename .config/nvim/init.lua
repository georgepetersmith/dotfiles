vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
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
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.spelllang = 'en_gb'
vim.opt.signcolumn = 'yes'
vim.cmd('filetype plugin on')

vim.keymap.set('n', '<leader>w', '<C-w>')

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
  { 'zhou13/vim-easyescape', event = 'InsertEnter' },
  {
    'j-hui/fidget.nvim',
    lazy = false,
    opts = {
      notification = {
        override_vim_notify = true
      }
    }
  },
  { 'numToStr/Comment.nvim', config = true, event = 'BufEnter' },
  {
      'rose-pine/neovim',
      enabled = false,
      name = 'rose-pine',
      priority = 1000,
      config = function()
          require('rose-pine').setup({})
          vim.cmd('colorscheme rose-pine-moon')
      end
  },
  {
    'catppuccin/nvim',
    enabled = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({})
        vim.cmd('colorscheme catppuccin-mocha')
    end
  },
  {
    'morhetz/gruvbox',
    enabled = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.cmd('colorscheme gruvbox')
    end
  },
  {
    'craftzdog/solarized-osaka.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized-osaka').setup({
        transparent = false
      })

      vim.cmd('colorscheme solarized-osaka')
    end
  },
  {
    'maxmx03/solarized.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    'ibhagwan/fzf-lua',
    config = true,
    keys = {
      { '<leader>f', '<cmd>FzfLua files<cr>' },
      { '<leader>/', '<cmd>FzfLua live_grep<cr>' },
      { '<leader>b', '<cmd>FzfLua buffers<cr>' },
      { '<leader>h', '<cmd>FzfLua help_tags<cr>' },
      { '<leader>;', '<cmd>FzfLua resume<cr>' },
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    event = 'BufEnter',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig'},
    },
    config = function ()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>i', '<cmd>FzfLua lsp_finder<cr>', opts)
        vim.keymap.set('n', '<leader>s', '<cmd>FzfLua lsp_document_symbols<cr>', opts)
        vim.keymap.set('n', '<leader>S', '<cmd>FzfLua lsp_workspace_symbols<cr>', opts)
        vim.keymap.set('n', '<leader>d', '<cmd>FzfLua lsp_document_diagnostics<cr>', opts)
        vim.keymap.set('n', '<leader>D', '<cmd>FzfLua lsp_workspace_diagnostics<cr>', opts)
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end,
  },
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function ()
          local configs = require('nvim-treesitter.configs')
          configs.setup({
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
          })
      end
  },
  {
    'stevearc/oil.nvim',
    config = true
  }
})
