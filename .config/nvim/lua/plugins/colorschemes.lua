return {
    'loctvl842/monokai-pro.nvim',
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
}
