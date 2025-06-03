local config = function()
	local masonLspConfig = require("mason-lspconfig")

	masonLspConfig.setup({
		ensure_installed = {
			"lua_ls",
			"jsonls",
			"rust_analyzer",
			"gopls",
			"golangci_lint_ls",
			"html",
			"ts_ls",
			"jqls",
			"bashls",
			"marksman",
			"cssls",
			"sqlls",
			"biome",
			"yamlls",
		},
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}
