local config = function()
	local conform = require("conform")

	conform.setup({
		formatters = {
			golines = {
				command = "golines",
				args = {
					"-m",
					"80",
				},
			},
			sqlfluff = {
				command = "sqlfluff",
				args = {
					"fix",
					"--dialect",
					"postgres",
					"--disable-progress-bar",
					"-f",
					"-n",
					"-",
				},
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			javascript = { "biome-check" },
			typescript = { "biome-check" },
			markdown = { "prettier" },
			pug = { "prettier" },
			css = { "biome-check" },
			html = { "djlint" },
			go = { "gofumpt", "golines" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			sql = { "sqlfluff" },
			fish = { "fish_indent" },
			yaml = { "yamlfmt" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
