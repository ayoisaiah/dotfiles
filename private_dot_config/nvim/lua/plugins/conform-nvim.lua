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
			python = { "ruff" },
			javascript = { "biome-check" },
			typescript = { "biome-check" },
			markdown = { "prettier" },
			php = { "php_cs_fixer" },
			pug = { "prettier" },
			css = { "biome-check" },
			html = { "djlint" },
			zig = { "zigfmt" },
			rust = { "rustfmt" },
			go = { "gofumpt", "golines" },
			eruby = { "erb_format", "erb_lint" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			sql = { "sqlfluff" },
			ruby = { "rubocop" },
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
