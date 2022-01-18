require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
})
require("lspconfig").tsserver.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").svelte.setup({})
require("lspconfig").golangci_lint_ls.setup({
	init_options = {
		command = { "golangci-lint", "run", "--out-format", "json" },
	},
})

local exec = vim.api.nvim_exec

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- display diagnostics in the quickfix list
-- https://github.com/neovim/nvim-lspconfig/issues/69#issuecomment-789541466
do
	local method = "textDocument/publishDiagnostics"
	local default_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
		default_handler(err, method, result, client_id, bufnr, config)
		local diagnostics = vim.lsp.diagnostic.get_all()
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
		vim.lsp.util.set_qflist(qflist)
	end
end
