local config = function()
	local mason_lspconfig = require("mason-lspconfig")
	local blink = require("blink.cmp")
	local lsp_configs = require("lang.servers")
	local wk = require("which-key")

	local function telescope_builtin(name, opts)
		return function()
			require("telescope.builtin")[name](opts or {})
		end
	end

	-- LSP mappings
	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>la", vim.lsp.buf.code_action, desc = "LSP code action" },
		{ "<leader>lW", telescope_builtin("lsp_dynamic_workspace_symbols"), desc = "Dynamic workspace symbols" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "Go to definition" },
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format buffer",
		},
		{ "<leader>li", telescope_builtin("lsp_incoming_calls"), desc = "Incoming calls" },
		{ "<leader>lk", vim.lsp.buf.signature_help, desc = "Signature help" },
		{
			"<leader>lm",
			telescope_builtin("lsp_document_symbols", {
				show_line = true,
				symbols = { "method", "function" },
			}),
			desc = "Document methods and functions",
		},
		{ "<leader>lo", telescope_builtin("lsp_outgoing_calls"), desc = "Outgoing calls" },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol" },
		{
			"<leader>lt",
			telescope_builtin("lsp_document_symbols", {
				show_line = true,
				ignore_symbols = { "field" },
			}),
			desc = "Document symbols",
		},
		{
			"<leader>lv",
			telescope_builtin("lsp_document_symbols", {
				show_line = true,
				symbols = { "variable" },
			}),
			desc = "Variables",
		},
		{ "<leader>lw", telescope_builtin("lsp_workspace_symbols"), desc = "Workspace symbols" },
		{ "<leader>lx", telescope_builtin("diagnostics"), desc = "Diagnostics in all open buffers" },
		{
			"<leader>ly",
			telescope_builtin("diagnostics", { bufnr = 0 }),
			desc = "Diagnostics in current buffer",
		},
		{ "<leader>lz", telescope_builtin("lsp_references"), desc = "Symbol references" },
	})

	wk.add({
		{ "[", group = "previous" },
		{ "[c", vim.diagnostic.goto_prev, desc = "previous diagnostic" },
		{ "]", group = "next" },
		{ "]c", vim.diagnostic.goto_next, desc = "Next diagnostic" },
	})

	local function setup_server(server_name)
		local server_opts = vim.tbl_deep_extend("force", {}, lsp_configs.servers[server_name] or {})
		server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities)
		vim.lsp.config(server_name, server_opts)
	end

	mason_lspconfig.setup({
		ensure_installed = lsp_configs.ensure_installed,
		automatic_enable = false,
	})

	for _, server_name in ipairs(lsp_configs.ensure_installed) do
		setup_server(server_name)
		vim.lsp.enable(server_name)
	end
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		"j-hui/fidget.nvim",
	},
	config = config,
}
