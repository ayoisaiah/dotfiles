local config = function()
	local lint = require("lint")
	local golangcilint = require("lint").linters.golangcilint
	golangcilint.args = {
		"run",
		"--out-format=json",
		"--show-stats=false",
		"--print-issued-lines=false",
		"--print-linter-name=false",
	}

	lint.linters_by_ft = {
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

	vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
		end,
	})
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost" },
	config = config,
}
