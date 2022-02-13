local wk = require("which-key")

wk.register({
	name = "git",
	w = { "<cmd>Gwrite<CR>", "Git add" },
	c = { "<cmd>Git commit --verbose<CR>", "Git commit" },
	a = { "<cmd>Git commit --amend<CR>", "Amend commit" },
}, { prefix = "<leader>g" })
