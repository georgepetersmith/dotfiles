return {
    {
        'loctvl842/monokai-pro.nvim',
        enabled = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                transparent_background = true,
                terminal_colors = true,
                devicons = true
            })

            vim.cmd([[colorscheme monokai-pro]])
        end
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd([[colorscheme solarized-osaka]])
        end
    }
}
