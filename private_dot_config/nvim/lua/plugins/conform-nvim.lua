local config = function()
	local conform = require("conform")
	local formatters = require("lang.formatters")

	conform.setup({
		formatters = formatters.formatters,
		formatters_by_ft = formatters.formatters_by_ft,
		format_on_save = formatters.format_on_save,
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
