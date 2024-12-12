return {
	"IndianBoy42/tree-sitter-just",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("tree-sitter-just").setup()
	end,
}
