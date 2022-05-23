local M = {}

function M.config()
  local status_ok, cinnamon = pcall(require, "cinnamon")
  if status_ok then
    cinnamon.setup({
      extra_keymaps = true,
      extended_keymaps = true,
    })
  end
end

return M
