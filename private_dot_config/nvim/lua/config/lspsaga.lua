local saga = require("lspsaga")
local wk = require("which-key")

saga.setup({
	error_sign = "🐞",
	warn_sign = "⚡",
	hint_sign = "💡",
	infor_sign = "⚠️",
	rename_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	code_action_prompt = {
		enable = false,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	code_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
		enable = false,
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

wk.register({
	name = "lspsaga",
	a = { "<cmd>Lspsaga code_action<CR>", "Code actions" },
	r = { "<cmd>Lspsaga rename<CR>", "Rename symbol" },
	s = { "<cmd>Lspsaga lsp_finder<CR>", "Symbol definition and reference" },
	p = { "<cmd>Lspsaga preview_definition<CR>", "Preview symbol definition" },
	h = { "<cmd>Lspsaga hover_doc<CR>", "Show hover doc" },
	d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
}, { prefix = "<leader>s" })

wk.register({
	["]c"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic" },
	["[c"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic" },
	["<C-f>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Scroll down in Lspsaga" },
	["<C-b>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "Scroll up in Lspsaga" },
})
