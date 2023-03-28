local config = function(_, opts)
	require("lualine").setup(opts)
end

return {
	"nvim-lualine/lualine.nvim",
	config = config,
	opts = {
		options = { theme = "molokai" },
	},
}
