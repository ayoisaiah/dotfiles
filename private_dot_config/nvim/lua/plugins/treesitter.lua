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
