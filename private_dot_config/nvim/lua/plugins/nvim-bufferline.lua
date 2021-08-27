require("bufferline").setup{}
vim.api.nvim_set_keymap('n', '<leader>gB', ':BufferLinePick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gC', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

