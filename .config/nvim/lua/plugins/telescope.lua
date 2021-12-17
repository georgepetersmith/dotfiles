require('telescope')

--vim.api.nvim_set_keymap("n", "<Leader>f", "[tele]", {})
--vim.api.nvim_set_keymap("n", "[tele]f",
--                        "<cmd>Telescope find_files theme=get_dropdown<CR>", {})
--vim.api.nvim_set_keymap("n", "[tele]g",
--                       "<cmd>Telescope live_grep theme=get_dropdown<CR>", {})
--vim.api.nvim_set_keymap("n", "[tele]G",
--                        "<cmd>Telescope git_status theme=get_dropdown<CR>", {})
--vim.api.nvim_set_keymap("n", "[tele]b",
--                        "<cmd>Telescope buffers theme=get_dropdown<CR>", {})
--vim.api.nvim_set_keymap("n", "[tele]r",
--                        "<cmd>Telescope lsp_references theme=get_dropdown<CR>",
--                        {})


vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})

vim.api.nvim_set_keymap("n", "<Leader>fu", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {})

--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
--nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
--nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
--nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

--nnoremap('<leader>fu', 'Telescope lsp_references')
--nnoremap('<leader>gd', 'Telescope lsp_definitions')
--nnoremap('<leader>rn', 'lua vim.lsp.buf.rename()')
--nnoremap('<leader>dn', 'lua vim.lsp.diagnostic.goto_next()')
--nnoremap('<leader>dN', 'lua vim.lsp.diagnostic.goto_prev()')
--nnoremap('<leader>dd', 'Telescope lsp_document_diagnostics')
--nnoremap('<leader>dD', 'Telescope lsp_workspace_diagnostics')
--nnoremap('<leader>xx', 'Telescope lsp_code_actions')
--nnoremap('<leader>xd', '%Telescope lsp_range_code_actions')

