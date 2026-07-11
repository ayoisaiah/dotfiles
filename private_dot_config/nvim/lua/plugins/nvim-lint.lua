local config = function()
	local lint = require("lint")
	local linters = require("lang.linters")

	for name, config in pairs(linters.linters) do
		for key, value in pairs(config) do
			lint.linters[name][key] = value
		end
	end

	lint.linters_by_ft = linters.linters_by_ft

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
