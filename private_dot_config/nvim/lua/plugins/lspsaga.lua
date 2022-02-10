local saga = require("lspsaga")

saga.setup({
	error_sign = "🐞",
	warn_sign = "⚡",
	hint_sign = "💡",
	infor_sign = "⚠️",
	max_preview_lines = 15,
	rename_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	code_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	finder_definition_icon = "🔱 ",
	finder_reference_icon = "🐤 ",
	max_preview_lines = 20,
	finder_action_keys = {
		open = "<CR>",
		vsplit = "v",
		split = "h",
		quit = "<Esc>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lsp provider to find the cursor word definition and reference
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

map("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts)

-- scroll down hover doc or scroll in definition preview
map("n", "<C-f>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)

-- scroll up hover doc
map("n", "<C-b>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- rename
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
-- diganostics
map("n", "]c", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "[c", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
