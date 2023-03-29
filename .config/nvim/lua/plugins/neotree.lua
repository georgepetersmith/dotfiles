-- Unless you are still migrating, remove the deprecated commands from v1.x
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = 'Neotree',
  branch = "v2.x",
  keys = {
    { '<leader>t', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
    }
  }
}
