-- local present, base16 = pcall(require, "base16")
--
-- if present then
-- 	local hardcore = base16.theme_from_array({
-- 		"1b1f27",
-- 		"1e222a",
-- 		"30343c",
-- 		"4A4A4A",
-- 		"42464e",
-- 		"cdcdcd",
-- 		"e5e5e5",
-- 		"ffffff",
-- 		"fb4934",
-- 		"fd971f",
-- 		"e6db74", - light orange
-- 		"a6e22e", -- ight green
-- 		"708387",
-- 		"66d9ef", - light blue
-- 		"9e6ffe", -- purple
-- 		"e8b882", -- light orange
-- 	})
-- 	base16(hardcore, true)
-- 	return true
-- else
-- 	return false
-- end
-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_sidebars = { "qf", "terminal", "packer" }
vim.g.tokyonight_hide_inactive_statusline = true

vim.g.tokyonight_colors = {
	purple = "#9e6ffe",
	magenta = "#9e6ffe",
	blue = "#66d9ef",
	blue5 = "#e8b882",
	green1 = "#fb4934",
	error = "#fb4934",
	blue1 = "#a6e22e",
	fg = "#cdcdcd",
	comment = "#4A4A4A",
}

-- Load the colorscheme
vim.cmd([[colorscheme tokyonight]])
