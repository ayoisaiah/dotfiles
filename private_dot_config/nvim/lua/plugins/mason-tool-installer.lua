local config = function()
	local tools = require("lang.tools")

	require("mason-tool-installer").setup({
		ensure_installed = tools.ensure_installed,
		integrations = tools.integrations,
	})
end

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = config,
}
