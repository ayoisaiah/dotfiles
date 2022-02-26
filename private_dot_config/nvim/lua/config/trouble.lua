require("trouble").setup({})

local wk = require("which-key")

wk.register({
	name = "diagnostics",
	x = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
	w = { "<cmd>TroubleToggle workspace_dignostics<CR>", "Trouble workspace diagnostics" },
	d = { "<cmd>TroubleToggle document_dignostics<CR>", "Trouble document diagnostics" },
	n = { "<cmd>lua require('trouble').next({skip_groups = true, jump = true});<CR>", "Go to next item in Trouble" },
	p = {
		"<cmd>lua require('trouble').previous({skip_groups = true, jump = true});<CR>",
		"Go to previous item in Trouble",
	},
}, { prefix = "<leader>x" })
