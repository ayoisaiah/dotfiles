local config = function()
	local wk = require("which-key")
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	require("navigator").setup({
		debug = false,
		default_mapping = false,
		lsp_signature_help = nil,
		signature_help_cfg = nil,
		lsp = {
			enable = true,
			format_on_save = false,
			disable_format_cap = { "lua_ls", "gopls", "tsserver" },
			disable_lsp = {},
			diagnostic = {
				underline = true,
				virtual_text = false, -- show virtual for diagnostic message
				update_in_insert = false, -- update diagnostic message in insert mode
			},
			display_diagnostic_qf = false,
			tsserver = {
				filetypes = { "typescript", "javascript" },
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
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
			emmet_ls = {
				capabilities = capabilities,
				init_options = {
					html = {
						options = {
							-- TODO: investigate https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			},
			lua_ls = { diagnostics = { globals = { "vim" } } },
			servers = {
				"marksman",
				"phpactor",
				"jsonls",
				"cssls",
				"bashls",
				"html",
				"svelte",
				"rls",
				"lua_ls",
				"emmet_ls",
				"solargraph",
			},
		},
	})

	wk.register({
		name = "LSP",
		a = { "<cmd>lua require('navigator.codeAction').code_action()<CR>", "Code actions" },
		d = { "<cmd>lua require('navigator.definition').definition()<CR>", "Go to definition" },
		f = { vim.lsp.buf.format, "Format buffer" },
		k = { vim.lsp.buf.signature_help, "Signature help" },
		i = { "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>", "Incoming calls" },
		o = { "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<CR>", "Outgoing calls" },
		r = { "<cmd>lua require('navigator.rename').rename()<CR>", "Rename symbol" },
		p = { "<cmd>lua require('navigator.definition').definition_preview()<CR>", "Preview symbol definition" },
		m = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, symbols = {'method', 'function'}})<CR>",
			"Document methods and functions",
		},
		-- TODO: Refine output
		t = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, ignore_symbols = {'field'}})<CR>",
			"Document symbols",
		},
		v = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, symbols = {'variable'}})<CR>",
			"Variables",
		},
		w = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace symbols" },
		W = {
			"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
			"Dynamic workspace symbols",
		},
		x = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics in all open buffers" },
		y = { "<cmd>lua require('telescope.builtin').diagnostics(bufnr=0)<CR>", "Diagnostics in current buffer" },
		z = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "Symbol references" },
	}, { prefix = "<leader>l" })

	wk.register({
		name = "LSP",
		a = {
			"<cmd>lua require('navigator.codeAction').range_code_action()<CR>",
			"code action for the visual mode range",
		},
		f = { vim.lsp.buf.range_formatting, "range formatting" },
	}, { prefix = "<leader>l", mode = "v" })

	wk.register({
		name = "LSP",
		["]"] = {
			name = "next",
			c = { vim.diagnostic.goto_next, "Next diagnostic" },
			r = { "<cmd>lua require('navigator.treesitter').goto_next_usage()<CR>", "Go to next usage" },
		},
		["["] = {
			name = "previous",
			c = { vim.diagnostic.goto_prev, "previous diagnostic" },
			r = { "<cmd>lua require('navigator.treesitter').goto_prev_usage()<CR>", "Go to previous usage" },
		},
	})
end

return {
	"ray-x/navigator.lua",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "ray-x/lsp_signature.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	event = { "BufReadPost" },
	config = config,
}
