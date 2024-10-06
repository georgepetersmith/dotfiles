return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "vimdoc", "markdown", "markdown_inline", "c_sharp", "html", "typescript", "rust", "dockerfile", "css", "sql" },
      indent = { enable = true },
      highlight = { enable = true },
    }
  end,
}
