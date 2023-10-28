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
      "http",
			"lua-5.4",
			"docker",
			"bash",
			"eslint",
			"esbuild",
			"git",
			"markdown",
			"docker",
			"web_extensions",
			"dom",
		},
	})

	wk.register({
		name = "Docs",
		c = { "<cmd>DevdocsOpen css<CR>", "CSS" },
		d = { "<cmd>DevdocsOpen dom<CR>", "DOM" },
		g = { "<cmd>DevdocsOpen go<CR>", "Go" },
		h = { "<cmd>DevdocsOpen html<CR>", "HTML" },
		j = { "<cmd>DevdocsOpen javascript<CR>", "JavaScript" },
		n = { "<cmd>DevdocsOpen node<CR>", "Node.js" },
		t = { "<cmd>DevdocsOpen typescript<CR>", "TypeScript" },
		p = { "<cmd>DevdocsOpen postgresql-15<CR>", "PostgreSQL" },
		w = { "<cmd>DevdocsOpen web_extensions<CR>", "Web extensions" },
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
