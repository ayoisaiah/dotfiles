local config = function(_, opts)
	require("nvim-treesitter.configs").setup(opts)
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
	version = false,
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	lazy = false,
	opts = require("lang.treesitter").opts,
}
