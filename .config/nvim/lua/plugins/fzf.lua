return {
  "ibhagwan/fzf-lua",
  opts = {
    {"max-perf"},
    previewers = {
      bat = {
        theme = "gruvbox-dark"
      }
    }
  },
  keys = {
    { '<leader>f', '<cmd>FzfLua files<cr>' },
    { '<leader>/', '<cmd>FzfLua live_grep<cr>' },
    { '<leader>b', '<cmd>FzfLua buffers<cr>' },
    { '<leader>h', '<cmd>FzfLua help_tags<cr>' },
    { '<leader>;', '<cmd>FzfLua resume<cr>' },
    { '<leader>i', '<cmd>FzfLua lsp_finder<cr>' },
    { '<leader>gr', '<cmd>FzfLua lsp_references<cr>' },
    { '<leader>gr', '<cmd>FzfLua lsp_implementations<cr>' },
    { '<leader>s', '<cmd>FzfLua lsp_document_symbols<cr>' },
    { '<leader>S', '<cmd>FzfLua lsp_workspace_symbols<cr>' },
    { '<leader>d', '<cmd>FzfLua lsp_document_diagnostics<cr>' },
    { '<leader>D', '<cmd>FzfLua lsp_workspace_diagnostics<cr>' },
    { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>' }
  },
}
