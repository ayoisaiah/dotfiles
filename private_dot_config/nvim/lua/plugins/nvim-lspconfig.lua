require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.golangci_lint_ls.setup{
  init_options = {
    command = { "golangci-lint", "run", "--out-format", "json" }
  }
}

local exec = vim.api.nvim_exec

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
