return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"DaikyXendo/nvim-web-devicons",
	},
	opts = {
		render_modes = { "n", "c", "t" },
		completions = {
			lsp = {
				enabled = true,
			},
		},
	},
}
