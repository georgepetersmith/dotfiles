return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    tag = '0.1.1',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
      { '<leader>pf' },
      { '<leader>f' },
      { '<leader>b' },
      { '<leader>?' },
      { '<leader>/' },
    },
    config = function()
      local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>?', builtin.keymaps, {})
        vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
    end,
  }
