local map = vim.api.nvim_set_keymap

map('n', '<leader>gw', ':Gwrite<CR>', { noremap = true, silent = true })
map('n', '<leader>gc', ':Git commit --verbose<CR>', { noremap = true, silent = true })
map('n', '<leader>ga', ':Git commit --amend<CR>', { noremap = true, silent = true })
