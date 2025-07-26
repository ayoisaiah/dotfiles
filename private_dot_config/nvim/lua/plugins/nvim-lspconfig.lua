local config = function()
	local wk = require("which-key")
	local builtin = require("telescope.builtin")

	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>lW", builtin.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace symbols" },
		-- { "<leader>la", codeAction.code_action, desc = "Code actions" },
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
		-- { "<leader>lp", definition.definition_preview, desc = "Preview symbol definition" },
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
		-- {
		-- 	"<leader>la",
		-- 	codeAction.range_code_action,
		-- 	desc = "code action for the visual mode range",
		-- 	mode = "v",
		-- },
	})

	wk.add({
		{ "[", group = "previous" },
		{ "[c", vim.diagnostic.goto_prev, desc = "previous diagnostic" },
		-- { "[r", ts.goto_prev_usage, desc = "Go to previous usage" },
		{ "]", group = "next" },
		{ "]c", vim.diagnostic.goto_next, desc = "Next diagnostic" },
		-- { "]r", ts.goto_next_usage, desc = "Go to next usage" },
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
