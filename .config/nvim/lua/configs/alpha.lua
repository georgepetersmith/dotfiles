local M = {}

function M.config()
  local present, alpha = pcall(require, "alpha")
  if present then
    local alpha_button = gnvim.alpha_button
    alpha.setup({
      layout = {
        { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        {
          type = "text",
          val = {
            "    ███    ██ ██    ██ ██ ███    ███",
            "    ████   ██ ██    ██ ██ ████  ████",
            "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
            "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
            "    ██   ████   ████   ██ ██      ██",
          },
          opts = { position = "center", hl = "DashboardHeader" },
        },
        { type = "padding", val = 5 },
        {
          type = "group",
          val = {
            alpha_button("LDR f f", "  Find File  "),
            alpha_button("LDR f o", "  Recents  "),
            alpha_button("LDR f w", "  Find Word  "),
            alpha_button("LDR f n", "  New File  "),
            alpha_button("LDR f m", "  Bookmarks  "),
            alpha_button("LDR S l", "  Last Session  "),
          },
          opts = { spacing = 1 },
        },
      },
      opts = {},
    })
  end
end

return M
