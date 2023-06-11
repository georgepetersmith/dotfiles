return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  lazy = false,
  tag = '0.1.1',
  dependencies = { {'nvim-lua/plenary.nvim'},
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'  },
    {'nvim-telescope/telescope-ui-select.nvim'}, },
    -- opts = {
  -- },
  config = function()
    require('telescope').setup {
      file_ignore_patterns = { "node_modules" },
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      pickers = {
        find_files = { theme = "dropdown" },
        git_files = { theme = "dropdown" },
      },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_cursor {
            -- even more opts
          },
        },
      },
    }

    local builtin = require('telescope.builtin')

    local custom = {}
    custom.project_files = function()
      local opts = {} -- define here if you want to define something
      vim.fn.system('git rev-parse --is-inside-work-tree')
      if vim.v.shell_error == 0 then
        require"telescope.builtin".git_files(opts)
      else
        require"telescope.builtin".find_files(opts)
      end
    end

    vim.keymap.set('n', '<leader>f', custom.project_files, {})
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>?', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>D', builtin.diagnostics, {})
    vim.keymap.set('n', '<leader>r', builtin.resume, {})
    vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>S', builtin.lsp_dynamic_workspace_symbols, {})
    vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    vim.keymap.set('n', 'gd', builtin.lsp_type_definitions, {})
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

    require('telescope').load_extension('fzf')
    require("telescope").load_extension("ui-select")
  end,
}
