return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = '(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release)' }
  },
  opts = {
    defaults = {
      path_display = { 'smart' }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false
      }
    }
  },
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<cr>' },
    { '<leader>/', '<cmd>Telescope live_grep<cr>' },
    { '<leader>b', '<cmd>Telescope buffers<cr>' },
    { '<leader>h', '<cmd>Telescope help_tags<cr>' },
    { '<leader>;', '<cmd>Telescope resume<cr>' }
  },
  config = function()
    require('telescope').load_extension('fzf')
  end
}
