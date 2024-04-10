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
                vim.keymap.set('n', '<leader>i', '<cmd>Lspsaga finder<cr>', opts)
                vim.keymap.set('n', '<leader>.', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('n', '<leader>n', '<cmd>Lspsaga rename ++project<cr>', opts)
            end)
        end,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    { 'hrsh7th/cmp-nvim-lsp' },
                    { 'onsails/lspkind.nvim' },
                },
                config = function ()
                    local cmp = require('cmp')
                    local lspkind = require('lspkind')
                    cmp.setup {
                        formatting = {
                            format = lspkind.cmp_format({
                                mode = 'symbol',
                                maxwidth = 50,
                                ellipsis_char = '...',
                                show_labelDetails = true,
                            })
                        }
                    }
                end
            },
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
            {
                'nvimdev/lspsaga.nvim',
                opts = {
                    lightbulb = {
                        enable = false
                    },
                    symbol_in_winbar = {
                        enable = false
                    }
                }
            }
        }
    },
}

