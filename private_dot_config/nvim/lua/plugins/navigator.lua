local config = function()
	local wk = require("which-key")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	local builtin = require("telescope.builtin")
	local navigator = require("navigator")
	local codeAction = require("navigator.codeAction")
	local definition = require("navigator.definition")
	local ts = require("navigator.treesitter")
	local rename = require("navigator.rename")

	require("navigator").setup({
		debug = false,
		default_mapping = false,
		lsp_signature_help = nil,
		signature_help_cfg = nil,
		lsp = {
			enable = true,
			code_action = { enable = true, sign = false, sign_priority = 40, virtual_text = true }, -- Disable sign to prevent code action icon from following cursor around
			format_on_save = false,
			disable_format_cap = { "lua_ls", "gopls", "tsserver" },
			disable_lsp = {},
			diagnostic = {
				underline = true,
				virtual_text = false, -- show virtual for diagnostic message
				update_in_insert = false, -- update diagnostic message in insert mode
			},
			display_diagnostic_qf = false,
			ts_ls = {
				filetypes = { "typescript", "javascript" },
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			},
			cssls = {
				settings = {
					css = { validate = true, lint = {
						unknownAtRules = "ignore",
					} },
					scss = { validate = true, lint = {
						unknownAtRules = "ignore",
					} },
				},
			},
			gopls = {
				cmd = {
					"gopls",
				},
				settings = {
					gopls = {
						staticcheck = false,
					},
				},
			},
			solargraph = {
				init_options = {
					formatting = false,
				},
				settings = {
					solargraph = {
						diagnostics = false,
					},
				},
			},
			emmet_language_server = {
				filetypes = {
					"css",
					"html",
					"markdown",
					"javascript",
					"javascriptreact",
					"scss",
					"pug",
					"typescriptreact",
					"typescript",
				},
			},
			lua_ls = {
				settings = {
					Lua = { diagnostics = { globals = { "vim" } } },
				},
			},
			servers = {
				"biome",
				"tailwindcss",
				"marksman",
				"phpactor",
				"jsonls",
				"cssls",
				"bashls",
				"html",
				"svelte",
				"rls",
				"lua_ls",
				"ts_ls",
				"emmet_language_server",
				"solargraph",
			},
		},
	})

	wk.add({
		{ "<leader>l", group = "LSP" },
		{ "<leader>lW", builtin.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace symbols" },
		{ "<leader>la", codeAction.code_action, desc = "Code actions" },
		{ "<leader>ld", definition.definition, desc = "Go to definition" },
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
		{ "<leader>lp", definition.definition_preview, desc = "Preview symbol definition" },
		{ "<leader>lr", rename.rename, desc = "Rename symbol" },
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
		{
			"<leader>la",
			codeAction.range_code_action,
			desc = "code action for the visual mode range",
			mode = "v",
		},
	})

	wk.add({
		{ "[", group = "previous" },
		{ "[c", vim.diagnostic.goto_prev, desc = "previous diagnostic" },
		{ "[r", ts.goto_prev_usage, desc = "Go to previous usage" },
		{ "]", group = "next" },
		{ "]c", vim.diagnostic.goto_next, desc = "Next diagnostic" },
		{ "]r", ts.goto_next_usage, desc = "Go to next usage" },
	})
end

return {
	"ray-x/navigator.lua",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "ray-x/lsp_signature.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	event = { "BufReadPost" },
	config = config,
}
