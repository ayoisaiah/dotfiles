local config = function(_, opts)
	require("nvim-treesitter.configs").setup(opts)
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
	version = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
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
