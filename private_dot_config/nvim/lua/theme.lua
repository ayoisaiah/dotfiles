local my_colors = {
	waveBlue1 = "#363646",
	sumiInk1 = "#16161D",
	roninYellow = "#F5DD8E",
}

require("kanagawa").setup({
	dimInactive = true,
	colors = my_colors,
	functionStyle = "bold",
})

-- Load the colorscheme
vim.cmd([[colorscheme kanagawa]])
