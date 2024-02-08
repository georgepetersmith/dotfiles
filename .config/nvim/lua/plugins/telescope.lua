return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>f', '<cmd>Telescope find_files<cr>' },
        { '<leader>/', '<cmd>Telescope live_grep<cr>' },
        { '<leader>b', '<cmd>Telescope buffers<cr>' },
        { '<leader>h', '<cmd>Telescope help_tags<cr>' },
    },
    opts = {
        defaults = {
            path_display = {
                'truncate',
                truncate = 3
            },
        }
    }
}
