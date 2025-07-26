local config = function()
	local masonLspConfig = require("mason-lspconfig")

	masonLspConfig.setup({
		ensure_installed = {
			"biome",
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
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
}
