local config = function()
	local wk = require("which-key")
	local devdocs = require("nvim-devdocs")

	devdocs.setup({
		ensure_installed = {
			"html",
			"css",
			"javascript",
			"go",
			"node",
			"postgresql-15",
			"typescript",
			"ansible-2.11",
			"fish-3.6",
			"lua-5.4",
			"http",
			"docker",
			"bash",
			"eslint",
			"esbuild",
			"git",
			"markdown",
			"docker",
		},
	})

	wk.register({
		name = "Docs",
		c = { "<cmd>DevdocsOpen css<CR>", "CSS" },
		g = { "<cmd>DevdocsOpen go<CR>", "Go" },
		h = { "<cmd>DevdocsOpen html<CR>", "HTML" },
		j = { "<cmd>DevdocsOpen javascript<CR>", "JavaScript" },
		n = { "<cmd>DevdocsOpen node<CR>", "Node.js" },
		t = { "<cmd>DevdocsOpen node<CR>", "TypeScript" },
		p = { "<cmd>DevdocsOpen postgresql-15<CR>", "PostgreSQL" },
		z = { "<cmd>DevdocsOpenCurrent<CR>", "Current language" },
	}, { prefix = "<leader>z" })
end

return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = config,
	event = "VeryLazy",
}
