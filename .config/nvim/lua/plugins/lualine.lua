return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    theme = "gruvbox_dark",
    sections = {
      lualine_a = {
        {
          "buffers"
        }
      },
      lualine_c = {}
    },
    disabled_filetypes = {
      statusline = {"NvimTree"},
    },
  }
}
