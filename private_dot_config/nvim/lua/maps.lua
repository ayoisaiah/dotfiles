-- This file is for custom key bindings for native vim functions

local g = vim.g
local map = vim.api.nvim_set_keymap

g.mapleader = "," -- Change leader key from \ to ,

-- Disable F1 bringing up the help doc every time
map("i", "<F1>", "<ESC>", { noremap = true })
map("n", "<F1>", "<ESC>", { noremap = true })
map("v", "<F1>", "<ESC>", { noremap = true })

map("i", "jj", "<ESC>", { noremap = true })

-- A saner way to save files
map("n", "<F2>", ":w<CR>", { noremap = true })

-- MOVING LINES
map("n", "<C-j>", ":m .+1<CR>==", { noremap = true })
map("n", "<C-k>", ":m .-2<CR>==", { noremap = true })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- turn off search highlighting
map("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true })

map("", "<leader>gf", ":e <cfile><CR>", {}) -- Create the file under cursor

-- Keep search matches in the middle of the screen
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })

-- Copy and paste to the system clipboard
map("", "<leader>y", '"*y', { noremap = true })
map("", "<leader>d", '"*d', { noremap = true })
map("", "<leader>p", '"*p', { noremap = true })
map("", "<leader>P", '"*P', { noremap = true })

map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })
