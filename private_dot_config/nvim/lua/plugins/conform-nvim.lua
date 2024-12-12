local config = function()
	local conform = require("conform")

	--TODO: Consider Dprint: https://github.com/dprint/dprint

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
			python = { "isort", "black" },
			javascript = { "biome-check" },
			typescript = { "biome-check" },
			markdown = { "prettier" },
			php = { "php_cs_fixer" },
			pug = { "prettier" },
			css = { "stylelint", { "prettier" } },
			-- TODO: Format only template files
			-- djlint = {},
			zig = { "zigfmt" },
			go = { "gofumpt", "golines" },
			eruby = { "erb_format", "erb_lint" },
			json = { "prettier" },
			sql = { "sqlfluff" },
			ruby = { "rubocop" },
			fish = { "fish_indent" },
			yaml = { "yamlfmt" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
