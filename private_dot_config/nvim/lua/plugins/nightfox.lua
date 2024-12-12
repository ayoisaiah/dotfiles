local config = function()
	require("nightfox").setup({
		palettes = {
			carbonfox = {
				orange = "#FFA066",
			},
		},
		specs = {
			carbonfox = {
				syntax = {
					variable = "orange",
					number = "white",
				},
			},
		},
	})

	vim.cmd([[colorscheme carbonfox]])
end

return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	enabled = false,
	priority = 1000,
	config = config,
}
