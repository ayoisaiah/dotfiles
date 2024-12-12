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
		ensure_installed = "all",
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
