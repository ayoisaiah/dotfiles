local config = function()
	require("octo").setup({})

	local wk = require("which-key")

	wk.register({
		name = "octo",
		p = { "<cmd>Octo pr list<CR>", "List GitHub PRs" },
		i = { "<cmd>Octo issue list<CR>", "List GitHub issues" },
		c = { "<cmd>Octo issue create<CR>", "Create GitHub issue" },
		a = { "<cmd>Octo actions<CR>", "Octo actions" },
		r = { "<cmd>Octo review resume<CR>", "Resume last review" },
	}, { prefix = "<leader>o" })
end

return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = config,
}
