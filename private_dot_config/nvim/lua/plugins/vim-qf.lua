local map = vim.api.nvim_set_keymap

-- Jump to and from location/quickfix windows.
map('n', '<leader>qf', '<Plug>(qf_qf_switch)', {})

-- Toggle the quickfix list window
map('n', '<leader>qq', '<Plug>(qf_qf_toggle)', {})

-- Toggle the location list window
map('n', '<leader>ql', '<Plug>(qf_loc_toggle)', {})
