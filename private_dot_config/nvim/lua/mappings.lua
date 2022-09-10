-- This file is for custom key bindings for native vim functions

local wk = require("which-key")
local map = vim.api.nvim_set_keymap

vim.g.mapleader = "," -- Change leader key from \ to ,

local opts = { noremap = true }

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

map("", "<leader>gf", ":e <cfile><CR>", {}) -- Create the file under cursor

-- Keep search matches in the middle of the screen
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Disable Ex mode mapping
map("n", "Q", "<Nop>", opts)

-- Copy and paste to the system clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", '"+p', [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("n", '"*p', [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("n", '"+P', [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)
map("n", '"*P', [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)
map("n", "<leader>p", [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("n", "<leader>P", [[:let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)

map("v", '"+p', [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("v", '"*p', [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("v", '"+P', [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)
map("v", '"*P', [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)
map("v", "<leader>p", [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p]], opts)
map("v", "<leader>P", [[:<C-U>let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>P]], opts)

wk.register({
	name = "window",
	k = { "<C-w>h", "Switch to left window" },
	l = { "<C-w>l", "Switch to right window" },
}, { prefix = "<leader>" })
