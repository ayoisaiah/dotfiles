-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_italic_keywords = true
-- vim.g.tokyonight_sidebars = { "qf", "terminal", "packer", "coq" }
--
-- vim.g.tokyonight_colors = {
-- 	purple = "#9e6ffe",
-- 	magenta = "#9e6ffe",
-- 	blue = "#66d9ef",
-- 	blue5 = "#e8b882",
-- 	green1 = "#fb4934",
-- 	error = "#fb4934",
-- 	blue1 = "#a6e22e",
-- 	fg = "#cdcdcd",
-- 	comment = "#4A4A4A",
-- 	black = "#303030",
-- }

local my_colors = {
	waveBlue1 = "#094771",
	sumiInk1 = "#16161D",
}

require("kanagawa").setup({
	dimInactive = true,
	colors = my_colors,
})

-- Load the colorscheme
vim.cmd([[colorscheme kanagawa]])
