require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript",
		"go",
		"typescript",
		"lua",
		"dockerfile",
		"c",
		"bash",
		"fish",
		"gomod",
		"markdown",
		"pug",
		"css",
		"html",
		"json",
		"rust",
		"toml",
		"yaml",
		"tsx",
		"regex",
		"scss",
		"vim",
		"zig",
		"ruby",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.filetype_to_parsername = "octo"
