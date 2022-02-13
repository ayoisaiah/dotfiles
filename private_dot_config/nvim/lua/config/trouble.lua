require("trouble").setup({})

local wk = require("which-key")

wk.register({
	name = "diagnostics",
	x = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
	w = { "<cmd>TroubleToggle workspace_dignostics<CR>", "Trouble workspace diagnostics" },
	d = { "<cmd>TroubleToggle document_dignostics<CR>", "Trouble document diagnostics" },
}, { prefix = "<leader>x" })
