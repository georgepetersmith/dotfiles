return {
    'folke/trouble.nvim',
    opts = { icons = false },
    keys = {
        { '<leader>xx', '<cmd>TroubleToggle<cr>' },
        { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>' },
        { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>' },
        { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>' },
        { 'gR', '<cmd>TroubleToggle lsp_references<cr>' },
        { '<leader>xr', '<cmd>TroubleRefresh<cr>' },
        { '<leader>xc', '<cmd>TroubleClose<cr>' },
        { '<leader>xn', function() require('trouble').next({ skip_groups = true, jump = true}) end },
        { '<leader>xp', function() require('trouble').previous({ skip_groups = true, jump = true}) end },
        { '<leader>xc', '<cmd>TroubleClose<cr>' },
    }
}
