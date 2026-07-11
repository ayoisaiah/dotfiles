local M = {}

M.ensure_installed = {
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
	"stylelint",

	-- shell
	"bashls",
	"shellcheck",

	-- markdown
	"marksman",
	"ltex-ls-plus",
	"vale",
	"vale-ls",
	"markdownlint-cli2",
	"markdownlint",

	-- sql
	"sqlls",
	"pgformatter",
	"sqlfluff",

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

	-- php
	"php-cs-fixer",

	-- nginx
	"nginx-config-formatter",

	-- docker
	"hadolint",

	-- other
	"tree-sitter-cli",
}

M.integrations = {
	["mason-lspconfig"] = true,
	["mason-nvim-dap"] = true,
	["mason-null-ls"] = false,
}

return M
