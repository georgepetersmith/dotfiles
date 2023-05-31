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
    opts = {
      file_ignore_patterns = { "node_modules" },
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
    },
    config = function()
      local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>?', builtin.keymaps, {})
        vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>D', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>r', builtin.resume, {})
        vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>S', builtin.lsp_dynamic_workspace_symbols, {})
        vim.keymap.set('n', '<leader>a', builtin.quickfix, {})
        vim.keymap.set('n', 'gr', builtin.lsp_references, {})
        vim.keymap.set('n', 'gd', builtin.lsp_type_definitions, {})
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    end,
  }
