local M = {}

M.linters = {
	golangcilint = {
		args = {
			"run",
			"--out-format=json",
			"--show-stats=false",
			"--print-issued-lines=false",
			"--print-linter-name=false",
		},
	},
}

M.linters_by_ft = {
	markdown = { "markdownlint" },
	sh = { "shellcheck" },
	dockerfile = { "hadolint" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	json = { "jsonlint" },
	go = { "golangcilint" },
	css = { "stylelint" },
	scss = { "stylelint" },
	sql = { "sqlfluff" },
	yaml = { "yamllint" },
	["yaml.ansible"] = { "ansiblelint" },
}

return M
