local M = {}

function M.config()
  local present, null_ls = pcall(require, "null-ls")
  if present then
    null_ls.setup()
  end
end

return M
