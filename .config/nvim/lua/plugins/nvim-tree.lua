return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = true,
  keys = {
    { '<C-t>', '<cmd>NvimTreeOpen<cr>' },
  }
}
