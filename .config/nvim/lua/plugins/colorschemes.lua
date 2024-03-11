return {
    {
        'loctvl842/monokai-pro.nvim',
        enabled = false,
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                transparent_background = false,
                terminal_colors = true,
                devicons = true
            })

            vim.cmd([[colorscheme monokai-pro]])
        end
    },
    {
        "craftzdog/solarized-osaka.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function ()
            require('solarized-osaka').setup({transparent = false})
            vim.cmd([[colorscheme solarized-osaka]])
        end
    },
    {
        'Tsuzat/NeoSolarized.nvim',
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require('NeoSolarized').setup({ style = "light", transparent = false })
            vim.cmd([[colorscheme NeoSolarized]])
        end
    },
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        name = 'catppuccin',
        config = function ()
            vim.cmd([[colorscheme catppuccin-latte]])
        end

    }
}
