local config = function()
	local masonDap = require("mason-nvim-dap")
	masonDap.setup({})
end

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
}
