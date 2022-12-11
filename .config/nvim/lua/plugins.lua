local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter'
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/zen-mode.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-autopairs'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use 'zhou13/vim-easyescape'
  use 'numToStr/comment.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  --[[ use {
    'phaazon/hop.nvim',
    branch = 'v2'
  } ]]
  use 'ggandor/lightspeed.nvim'
  use 'folke/tokyonight.nvim'

end)
