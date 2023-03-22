return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'j-hui/fidget.nvim', config = true},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},                -- Required
    {'hrsh7th/cmp-nvim-lsp'},            -- Required
    {'hrsh7th/cmp-buffer'},              -- Optional
    {'hrsh7th/cmp-path'},                -- Optional
    {'saadparwaiz1/cmp_luasnip'},        -- Optional
    {'hrsh7th/cmp-nvim-lua'},            -- Optional
    {'jose-elias-alvarez/null-ls.nvim'}, -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero')
    lsp.preset('recommended')

    lsp.nvim_workspace()

    lsp.ensure_installed({
    })

    local cmp = require('cmp')
    local cmp_select = {behaviour = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<C-Space>'] = cmp.mapping.complete(),
    })

    lsp.set_preferences({
      sign_icons = { }
    })

    lsp.setup()
  end
}
