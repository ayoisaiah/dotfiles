-- This file is for custom key bindings for native vim functions

local set = vim.keymap.set

vim.g.mapleader = "," -- Change leader key from \ to ,

-- Escape with F1
set({ "i", "n", "v" }, "<F1>", "<ESC>", { desc = "Escape" })

-- A saner way to save files
set("n", "<F2>", "<cmd>w<CR>", { desc = "Save file" })

-- MOVING LINES
set("n", "<C-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
set("n", "<C-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- turn off search highlighting
set("n", "<leader><space>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- execute current lua file
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

set("", "<leader>gf", "<cmd>e <cfile><CR>", { desc = "Edit file under cursor" })

-- Keep search matches in the middle of the screen
set("n", "n", "nzz", { desc = "Next search match (centered)" })
set("n", "N", "Nzz", { desc = "Previous search match (centered)" })

set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Disable Ex mode mapping
set("n", "Q", "<Nop>")

-- ":Q" as ":q"
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- Copy and paste to the system clipboard
set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

set("n", "<leader><leader>t", "<Plug>PlenaryTestFile", { desc = "Run plenary test file" })

-- Tabs
for i = 1, 9 do
	set("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
end
set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
set("n", "<leader>w", "<cmd>tabclose<CR>", { desc = "Close tab" })

-- Buffer management
local function confirm_and_delete_buffer()
	local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

	if confirm == 1 then
		local file = vim.fn.expand("%")
		if file ~= "" and vim.fn.filereadable(file) == 1 then
			os.remove(file)
		end
		vim.api.nvim_buf_delete(0, { force = true })
	end
end
set("n", "<leader>bd", confirm_and_delete_buffer, { desc = "Delete buffer and file" })

