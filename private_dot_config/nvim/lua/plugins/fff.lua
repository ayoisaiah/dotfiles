return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	-- for nixos:
	-- build = "nix run .#release",
	opts = {
		debug = {
			enabled = false,
			show_scores = false,
		},
	},
	keys = {
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "Fast find files",
		},
		{
			"fg",
			function()
				require("fff").live_grep()
			end,
			desc = "Fast live grep",
		},
		{
			"fz",
			function()
				require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
			end,
			desc = "Fast fuzzy grep",
		},
		{
			"fc",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search current word",
		},
	},
}
