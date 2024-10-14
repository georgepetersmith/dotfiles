return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip', opts = {}, dependencies = { 'rafamadriz/friendly-snippets' }},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig'},
    {
      'seblj/roslyn.nvim',
      commit="11168911d35ea276b1fbd8fa33f7564325b6c624",
      ft = 'cs'
    },
  },
  config = function ()
    local lsp_zero = require('lsp-zero')

    local lsp_attach = function(client, bufnr)
      local opts = {buffer = bufnr}
      -- lsp_zero.default_keymaps(opts)
      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<leader>i', '<cmd>Telescope lsp_finder<cr>')
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>')
      vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
      vim.keymap.set('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>')
      vim.keymap.set('n', '<leader>S', '<cmd>Telescope lsp_workspace_symbols<cr>')
      vim.keymap.set('n', '<leader>d', '<cmd>Telescope lsp_document_diagnostics<cr>')
    end

    lsp_zero.on_attach(lsp_attach)

    local capabilies = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities() )
    lsp_zero.extend_lspconfig({
      capabilities = capabilities
    })

    require('roslyn').setup({})

    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      }
    })

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp_format = require('lsp-zero').cmp_format({details = true})

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'path'}
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      formatting = cmp_format,
    })
  end,
}
