return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  event = "VeryLazy",
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'j-hui/fidget.nvim', config = true},  -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},                -- Required
    {'hrsh7th/cmp-nvim-lsp'},            -- Required
    {'hrsh7th/cmp-buffer'},              -- Optional
    {'hrsh7th/cmp-path'},                -- Optional
    {'hrsh7th/cmp-nvim-lsp-signature-help'},                -- Optional
    {'saadparwaiz1/cmp_luasnip'},        -- Optional
    {'hrsh7th/cmp-nvim-lua'},            -- Optional
    {'jose-elias-alvarez/null-ls.nvim'}, -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    local lsp = require('lsp-zero').preset({
      float_border = 'single',
      manage_nvim_cmp = {
        documentation_window = true
      }
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    -- (Optional) Configure lua language server for neovim
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>n", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()

  end
}
