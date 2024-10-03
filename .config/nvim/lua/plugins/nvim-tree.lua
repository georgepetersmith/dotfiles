return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  opts = {
    view = {
      width = 60
    }
  },
  keys = {
    { '<leader>t', '<cmd>NvimTreeToggle<cr>' },
  }
}
