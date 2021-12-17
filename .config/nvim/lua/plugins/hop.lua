require('hop').setup {}

vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ current_line_only = false, inclusive_jump = true })<cr>", {})
