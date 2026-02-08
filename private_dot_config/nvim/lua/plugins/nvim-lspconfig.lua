local config = function()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	local blink = require("blink.cmp")
	local lsp_configs = require("lsp_configs")
	local wk = require("which-key")
	local builtin = require("telescope.builtin")

	-- LSP mappings
	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>lW", builtin.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace symbols" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "Go to definition" },
		{ "<leader>lf", vim.lsp.buf.format, desc = "Format buffer" },
		{ "<leader>li", builtin.lsp_incoming_calls, desc = "Incoming calls" },
		{ "<leader>lk", vim.lsp.buf.signature_help, desc = "Signature help" },
		{
			"<leader>lm",
			function()
				builtin.lsp_document_symbols({
					show_line = true,
					symbols = { "method", "function" },
				})
			end,
			desc = "Document methods and functions",
		},
		{ "<leader>lo", builtin.lsp_outgoing_calls, desc = "Outgoing calls" },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol" },
		{
			"<leader>lt",
			function()
				builtin.lsp_document_symbols({
					show_line = true,
					ignore_symbols = { "field" },
				})
			end,
			desc = "Document symbols",
		},
		{
			"<leader>lv",
			function()
				builtin.lsp_document_symbols({
					show_line = true,
					symbols = { "variable" },
				})
			end,
			desc = "Variables",
		},
		{ "<leader>lw", builtin.lsp_workspace_symbols, desc = "Workspace symbols" },
		{ "<leader>lx", builtin.diagnostics, desc = "Diagnostics in all open buffers" },
		{
			"<leader>ly",
			function()
				builtin.diagnostics({ bufnr = 0 })
			end,
			desc = "Diagnostics in current buffer",
		},
		{ "<leader>lz", builtin.lsp_references, desc = "Symbol references" },
	})

	wk.add({
		{ "[", group = "previous" },
		{ "[c", vim.diagnostic.goto_prev, desc = "previous diagnostic" },
		{ "]", group = "next" },
		{ "]c", vim.diagnostic.goto_next, desc = "Next diagnostic" },
	})

	-- Setup mason-lspconfig handlers
	mason_lspconfig.setup({
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
		handlers = {
			function(server_name)
				local server_opts = lsp_configs.servers[server_name] or {}
				server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities)
				lspconfig[server_name].setup(server_opts)
			end,
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		"j-hui/fidget.nvim",
	},
	config = config,
}