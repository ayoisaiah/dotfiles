local config = function()
	local wk = require("which-key")
	local devdocs = require("nvim-devdocs")

	devdocs.setup({
		ensure_installed = {
			"html",
			"css",
			"sass",
			"redis",
			"javascript",
			"go",
			"node",
			"postgresql-15",
			"typescript",
			"ansible",
			"fish-3.6",
			"npm",
			"http",
			"lua-5.4",
			"docker",
			"bash",
			"eslint",
			"esbuild",
			"git",
			"markdown",
			"docker",
			"tailwindcss",
			"web_extensions",
			"dom",
			"jq",
		},
		previewer_cmd = "glow",
		cmd_args = { "-s", "dracula", "-w", "80" },
	})

	wk.register({
		name = "Docs",
		c = { "<cmd>DevdocsOpen css<CR>", "CSS" },
		d = { "<cmd>DevdocsOpen dom<CR>", "DOM" },
		f = { "<cmd>DevdocsOpen fish-3.6<CR>", "Fish" },
		g = { "<cmd>DevdocsOpen go<CR>", "Go" },
		h = { "<cmd>DevdocsOpen html<CR>", "HTML" },
		j = { "<cmd>DevdocsOpen javascript<CR>", "JavaScript" },
		k = { "<cmd>DevdocsOpen docker<CR>", "Docker" },
		n = { "<cmd>DevdocsOpen node<CR>", "Node.js" },
		m = { "<cmd>DevdocsOpen markdown<CR>", "Markdown" },
		t = { "<cmd>DevdocsOpen typescript<CR>", "TypeScript" },
		p = { "<cmd>DevdocsOpen postgresql-15<CR>", "PostgreSQL" },
		w = { "<cmd>DevdocsOpen web_extensions<CR>", "Web extensions" },
		x = { "<cmd>DevdocsOpen tailwindcss<CR>", "Tailwind" },
		z = { "<cmd>DevdocsOpenCurrent<CR>", "Current language" },
	}, { prefix = "<leader>z" })
end

return {
	-- "luckasRanarison/nvim-devdocs",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	"nvim-telescope/telescope.nvim",
	-- 	"nvim-treesitter/nvim-treesitter",
	-- },
	-- config = config,
	-- event = "VeryLazy",
}
