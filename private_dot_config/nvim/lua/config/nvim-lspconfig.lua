local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local sumneko_root_path = "/home/ayo/bin/lua-language-server"
local sumneko_binary = "/home/ayo/bin/lua-language-server/bin/lua-language-server"

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

lspconfig.gopls.setup({})
lspconfig.tsserver.setup({})
lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.eslint.setup({})
lspconfig.svelte.setup({})
lspconfig.golangci_lint_ls.setup({
	init_options = {
		command = { "golangci-lint", "run", "--out-format", "json" },
	},
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css", "scss" },
			root_dir = function()
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

lspconfig.emmet_ls.setup({ capabilities = capabilities })

-- display diagnostics in the quickfix list
-- https://github.com/neovim/nvim-lspconfig/issues/69#issuecomment-789541466
do
	local method = "textDocument/publishDiagnostics"
	local default_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
		default_handler(err, method, result, client_id, bufnr, config)
		local diagnostics = vim.diagnostic.get()
		local qflist = {}
		for bufnr, diagnostic in pairs(diagnostics) do
			for _, d in ipairs(diagnostic) do
				d.bufnr = bufnr
				d.lnum = d.range.start.line + 1
				d.col = d.range.start.character + 1
				d.text = d.message
				table.insert(qflist, d)
			end
		end
		vim.fn.setqflist(qflist)
	end
end
