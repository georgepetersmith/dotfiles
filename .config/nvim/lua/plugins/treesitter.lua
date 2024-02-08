return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufEnter' },
    build = ':TSUpdate',
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "c_sharp" },
        sync_install = false,
        auto_install = false,
        highlight = {
            enable = true,
            disable = function(_, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
                selection_modes = {
                    ['@parameter.outer'] = 'V',
                    ['@function.outer'] = 'V',
                    ['@class.outer'] = 'V',
                },
                include_surrounding_whitespace = true,
            },
        },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
}
