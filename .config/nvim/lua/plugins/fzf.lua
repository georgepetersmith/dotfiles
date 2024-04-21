return {
    'ibhagwan/fzf-lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = true,
    keys = {
        { '<leader>F', '<cmd>FzfLua git_files<cr>' },
        { '<leader>f', '<cmd>FzfLua files<cr>' },
        { '<leader>/', '<cmd>FzfLua live_grep<cr>' },
        { '<leader>b', '<cmd>FzfLua buffers<cr>' },
        { '<leader>h', '<cmd>FzfLua help_tags<cr>' },
        { '<leader>;', '<cmd>FzfLua resume<cr>' },
    }
}
