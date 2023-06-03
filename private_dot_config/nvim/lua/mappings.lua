-- This file is for custom key bindings for native vim functions

local map = vim.api.nvim_set_keymap

vim.g.mapleader = "," -- Change leader key from \ to ,

local opts = { silent = true }

map("i", "<F1>", "<ESC>", opts)
map("n", "<F1>", "<ESC>", opts)
map("v", "<F1>", "<ESC>", opts)

map("i", "jj", "<ESC>", opts)

-- A saner way to save files
map("n", "<F2>", ":w<CR>", opts)

-- MOVING LINES
map("n", "<C-j>", ":m .+1<CR>==", opts)
map("n", "<C-k>", ":m .-2<CR>==", opts)
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- turn off search highlighting
map("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- execute current lua file
map("n", "<leader><leader>x", ":source %<CR>", opts)

map("", "<leader>gf", ":e <cfile><CR>", {}) -- Create the file under cursor

-- Keep search matches in the middle of the screen
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Disable Ex mode mapping
map("n", "Q", "<Nop>", opts)

-- ":Q" as ":q"
vim.cmd([[command! Qa :qa]])
vim.cmd([[command! Q :q]])

-- Copy and paste to the system clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>p", '"+p', opts)
map("v", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>P", '"+P', opts)

map("n", "<leader><leader>t", "<Plug>PlenaryTestFile", opts)

-- Tabs
map("n", "<leader>1", "1gt", opts)
map("n", "<leader>2", "2gt", opts)
map("n", "<leader>3", "3gt", opts)
map("n", "<leader>4", "4gt", opts)
map("n", "<leader>5", "5gt", opts)
map("n", "<leader>6", "6gt", opts)
