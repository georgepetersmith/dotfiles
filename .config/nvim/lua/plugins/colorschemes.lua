return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = true
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = true,
  },
  {
    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_contrast_dark = 'hard'
    end
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = { transparent = false },
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000
  }
}
