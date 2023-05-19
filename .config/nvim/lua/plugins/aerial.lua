return {
  'stevearc/aerial.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { '<leader>o', '<cmd>AerialToggle!<cr>', desc = 'Aerial Toggle' }
  },
  config = function()

    require('aerial').setup({
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end,

      layout = {
        max_width = { 40, 0.2 },
        min_width = { 40, 0.2 },
      }
    })
  end
}
