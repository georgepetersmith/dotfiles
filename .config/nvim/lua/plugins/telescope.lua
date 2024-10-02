return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      preview = false,
      path_display = { "shorten" },
    },
    pickers = {
      find_files = {
        theme = 'dropdown'
      }
    }
  },
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<cr>' },
    { '<leader>/', '<cmd>Telescope live_grep<cr>' },
    { '<leader>b', '<cmd>Telescope buffers<cr>' },
    { '<leader>h', '<cmd>Telescope help_tags<cr>' },
    { '<leader>;', '<cmd>Telescope resume<cr>' },
    { '<leader>i', '<cmd>Telescope lsp_finder<cr>' },
    { '<leader>gr', '<cmd>Telescope lsp_references<cr>' },
    { '<leader>gr', '<cmd>Telescope lsp_implementations<cr>' },
    { '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>' },
    { '<leader>S', '<cmd>Telescope lsp_workspace_symbols<cr>' },
    { '<leader>d', '<cmd>Telescope lsp_document_diagnostics<cr>' },
    { '<leader>D', '<cmd>Telescope lsp_workspace_diagnostics<cr>' },
    { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>' }
  },
}
