return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    tag = '0.1.1',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
      { '<leader>pf' },
      { '<leader>ps' },
      { '<leader>pk' },
      { '<leader>pb' },
      { 'C-p' },
    },
    config = function()
      local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
          builtin.grep_string({ search = vim.fn.input('Grep > ')});
        end)
    end,
  }
