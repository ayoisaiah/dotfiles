local config = function(_, opts)
	require("nvim-dap-repl-highlights").setup()
	require("nvim-treesitter.configs").setup(opts)
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
	version = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"LiadOz/nvim-dap-repl-highlights",
	},
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"javascript",
			"go",
			"typescript",
			"dart",
			"help",
			"lua",
			"dockerfile",
			"c",
			"bash",
			"fish",
			"gomod",
			"markdown",
			"markdown_inline",
			"pug",
			"css",
			"html",
			"json",
			"rust",
			"toml",
			"yaml",
			"tsx",
			"regex",
			"scss",
			"vim",
			"zig",
			"ruby",
			"svelte",
			"php",
			"python",
			"rust",
			"dap_repl",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		matchup = {
			enable = true,
		},
	},
}
