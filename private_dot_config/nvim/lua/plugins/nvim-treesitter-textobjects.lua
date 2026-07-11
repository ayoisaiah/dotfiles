local config = function()
	require("nvim-treesitter.configs").setup(require("lang.treesitter").textobjects)
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = config,
}
