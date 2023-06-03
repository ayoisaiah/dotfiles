local config = function()
	local wk = require("which-key")
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	require("navigator").setup({
		debug = false,
		default_mapping = false,
		lsp_signature_help = nil,
		signature_help_cfg = nil,
		keymaps = {
			{ key = "]r", func = require("navigator.treesitter").goto_next_usage, desc = "goto_next_usage" },
			{ key = "[r", func = require("navigator.treesitter").goto_previous_usage, desc = "goto_previous_usage" },
		},
		lsp = {
			enable = true,
			format_on_save = false,
			disable_format_cap = { "lua_ls", "gopls", "tsserver" },
			disable_lsp = { "flow" },
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
			lua_ls = {
				sumneko_root_path = vim.fn.expand("$HOME") .. "/.local/bin/lua-ls",
				sumneko_binary = vim.fn.expand("$HOME") .. "/.local/bin/lua-ls/bin/lua-language-server",
			},
			servers = {
				"marksman",
				"phpactor",
				"jsonls",
				"cssls",
				"bashls",
				"html",
				"svelte",
				"rls",
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
		},
	})

	wk.register({
		name = "+navigator",
		a = { "<cmd>lua require('navigator.codeAction').code_action()<CR>", "code actions" },
		c = { "<cmd>lua require('navigator.ctags').ctags()<CR>", "ctags" },
		d = { "<cmd>lua require('navigator.definition').definition()<CR>", "go to definition" },
		D = { vim.lsp.buf.declaration, "go to declaration" },
		f = { vim.lsp.buf.format, "buffer formatting" },
		k = { vim.lsp.buf.signature_help, "signature help" },
		i = { vim.lsp.buf.incoming_calls, "incoming calls" },
		o = { vim.lsp.buf.outgoing_calls, "outgoing calls" },
		r = { "<cmd>lua require('navigator.rename').rename()<CR>", "rename symbol" },
		h = { "<cmd>lua require('navigator.dochighlight').hi_symbol()<CR>", "toggle highlight symbol" },
		H = { vim.diagnostic.disable, "disable diagnostics" },
		p = { "<cmd>lua require('navigator.definition').definition_preview()<CR>", "preview symbol definition" },
		m = { vim.lsp.buf.implementation, "go to implementation" },
		n = { vim.lsp.buf.type_definition, "go to type definition" },
		S = { vim.diagnostic.enable, "enable diagnostics" },
		t = { "<cmd>lua require('navigator.treesitter').buf_ts()<CR>", "buffer tags" },
		T = { "<cmd>lua require('navigator.treesitter').bufs_ts()<CR>", "buffer tags" },
		w = { "<cmd>lua require('navigator.workspace').workspace_symbol_live()<CR>", "workspace symbols" },
		y = { "<cmd>lua require('navigator.symbols').document_symbols()<CR>", "document symbols" },
		z = { "<cmd>lua require('navigator.reference').async_ref()<CR>", "references" },
	}, { prefix = "<leader>s" })

	wk.register({
		name = "+navigator",
		a = {
			"<cmd>lua require('navigator.codeAction').range_code_action()<CR>",
			"code action for the visual mode range",
		},
		f = { vim.lsp.buf.range_formatting, "range formatting" },
	}, { prefix = "<leader>s", mode = "v" })

	wk.register({
		name = "+navigator",
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
	},
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
