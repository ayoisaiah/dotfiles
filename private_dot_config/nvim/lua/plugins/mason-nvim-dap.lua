local config = function()
	local masonDap = require("mason-nvim-dap")
	masonDap.setup({
		ensure_installed = { "delve", "js" },
	})
end

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}
