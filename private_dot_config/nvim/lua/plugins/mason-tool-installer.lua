local config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- lua
			"lua_ls",
			"stylua",

			-- json
			"jsonls",
			"jsonlint",
			"jq-lsp",
			"jq",

			-- go
			"gopls",
			"golangci_lint_ls",
			"delve",
			"go-debug-adapter",
			"golines",
			"gofumpt",
			"golangci-lint",
			"goimports",

			-- web
			"ts_ls",
			"js-debug-adapter",
			"html",
			"cssls",
			"firefox-debug-adapter",
			"prettier",
			"biome",
			"djlint",

			-- shell
			"bashls",

			-- markdown
			"marksman",
			"markdownlint-cli2",
			"markdownlint",

			-- sql
			"sqlls",
			"pgformatter",

			-- yaml
			"yamlls",
			"yamlfmt",
			"yamllint",

			-- ansible
			"ansible-lint",

			-- git
			"gitlint",

			-- python
			"ruff",

			-- nginx
			"nginx-config-formatter",

			-- docker
			"hadolint",

			-- other
			"tree-sitter-cli",
		},
		integrations = {
			["mason-lspconfig"] = true,
			["mason-nvim-dap"] = true,
			["mason-null-ls"] = false,
		},
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
