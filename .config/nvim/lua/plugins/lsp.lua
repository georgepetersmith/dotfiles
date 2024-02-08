return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        event = { 'BufEnter' },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr }
                vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
            end)
        end,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
            { 'williamboman/mason.nvim', config = true },
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    local lsp_zero = require('lsp-zero')
                    require('mason-lspconfig').setup({
                        handlers = {
                            lsp_zero.default_setup,
                            lua_ls = function()
                                local opts = lsp_zero.nvim_lua_ls()
                                require('lspconfig').lua_ls.setup(opts)
                            end
                        }
                    })
                end
            },
        }
    },
}

