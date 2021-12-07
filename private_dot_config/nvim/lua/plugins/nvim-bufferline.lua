require("bufferline").setup({})

local map = vim.api.nvim_set_keymap

map("n", "<leader>gB", ":BufferLinePick<CR>", { noremap = true, silent = true })
map("n", "<leader>gC", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
map("n", "]b", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "[b", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
