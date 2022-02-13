require("octo").setup({})

local wk = require("which-key")

wk.register({
	name = "octo",
	i = { "<cmd>Octo issue list<CR>", "List GitHub issues" },
	c = { "<cmd>Octo issue create<CR>", "Create GitHub issue" },
	a = { "<cmd>Octo actions<CR>", "Octo actions" },
}, { prefix = "<leader>o" })
