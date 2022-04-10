-- This file is for custom key bindings for native vim functions

local map = vim.api.nvim_set_keymap
local wk = require("which-key")

vim.g.mapleader = "," -- Change leader key from \ to ,

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

map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

-- Disable Ex mode mapping
map("n", "Q", "<Nop>", { noremap = true })

wk.register({
	name = "clipboard",
	y = { '"*y', "Yank to system clipboard" },
	d = { '"*d', "Delete to system clipboard" },
	p = { '"*p', "Paste from system clipboard (after cursor" },
	P = { '"*P', "Paste from system clipboard (before cursor" },
}, { prefix = "<leader>" })

wk.register({
	name = "clipboard",
	y = { '"*y', "Yank to system clipboard" },
	d = { '"*d', "Delete to system clipboard" },
	p = { '"*p', "Paste from system clipboard (after cursor" },
	P = { '"*P', "Paste from system clipboard (before cursor" },
}, { prefix = "<leader>", mode = "v" })

wk.register({
	name = "window",
	k = { "<C-w>h", "Switch to left window" },
	l = { "<C-w>l", "Switch to right window" },
}, { prefix = "<leader>" })
