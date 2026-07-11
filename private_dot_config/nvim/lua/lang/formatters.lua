local M = {}

M.formatters = {
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
}

M.formatters_by_ft = {
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
	php = { "php_cs_fixer" },
	["_"] = { "trim_whitespace" },
}

M.format_on_save = {
	timeout_ms = 2000,
	lsp_format = "fallback",
}

return M
