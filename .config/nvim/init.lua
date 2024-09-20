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
    name = 'catppuccin',
    priority = 1000,
    config = true,
  },
  {
    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_contrast_dark = 'hard'
    end
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = { transparent = false },
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = {
      defaults = {
        path_display = { 'smart' },
        layout_config = {
          vertical = { width = 0.5 }
        }
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false
        }
      }
    },
    keys = {
      { '<leader>f', '<cmd>Telescope find_files<cr>' },
      { '<leader>/', '<cmd>Telescope live_grep<cr>' },
      { '<leader>b', '<cmd>Telescope buffers<cr>' },
      { '<leader>h', '<cmd>Telescope help_tags<cr>' },
      { '<leader>;', '<cmd>Telescope resume<cr>' },
      { 'gr', '<cmd>Telescope lsp_references<cr>' },
      { '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>' },
      { '<leader>S', '<cmd>Telescope lsp_workspace_symbols<cr>' },
      { '<leader>d', '<cmd>Telescope lsp_document_diagnostics<cr>' },
      { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>' }
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
        vim.keymap.set('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
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
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "vimdoc", "markdown", "markdown_inline", "c_sharp", "html", "typescript", "rust", "dockerfile", "css", "sql" },
        indent = { enable = true },
      }
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
        win_options = {
          wrap = true,
        }
      },
    }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require('harpoon')
      harpoon:setup({})

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                  results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
          }):find()
      end

      vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  }
})

vim.cmd('colorscheme catppuccin-mocha')
