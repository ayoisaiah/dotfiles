local config = function(_, opts)
	require("nvim-treesitter").setup(opts)
	require("lang.treesitter").setup()
end

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = function()
		require("nvim-treesitter").install(require("lang.treesitter").ensure_installed):wait(300000)
	end,
	config = config,
	version = false,
	lazy = false,
	opts = require("lang.treesitter").opts,
}
