local config = function()
	local lint = require("lint")
	lint.linters_by_ft = {
		markdown = { "markdownlint" },
		sh = { "shellcheck" },
		dockerfile = { "hadolint" },
		javascript = { "eslint" },
		json = { "jsonlint" },
		go = { "golangcilint" },
		ruby = { "rubocop" },
		eruby = { "erb_lint" },
		css = { "stylelint" },
		scss = { "stylelint" },
		sql = { "sqlfluff" },
		yaml = { "actionlint", "yamllint" },
		["yaml.ansible"] = { "ansiblelint" },
	}
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost" },
	config = config,
}
