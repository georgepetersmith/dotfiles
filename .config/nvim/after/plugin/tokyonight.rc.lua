local status, tokyo = pcall(require, "tokyonight")
if (not status) then return end

tokyo.setup({
  transparent = true
})

-- The configuration has to load before the colorscheme is set
vim.cmd [[ colorscheme tokyonight ]]

