local config = function()
	local my_colors = {
		waveBlue1 = "#363646",
		sumiInk1 = "#16161D",
		roninYellow = "#F5DD8E",
	}

	require("kanagawa").setup({
		dimInactive = true,
		colors = {
			palette = my_colors,
		},
		functionStyle = { bold = true },
		typeStyle = { bold = true },
	})

	-- vim.api.nvim_set_hl
	vim.api.nvim_set_hl(0, "@markdownUrl", { underline = true, italic = true })
	-- Load the colorscheme
	vim.cmd([[colorscheme kanagawa-wave]])
end

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
