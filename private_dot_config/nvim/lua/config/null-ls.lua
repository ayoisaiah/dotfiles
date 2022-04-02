local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.stylelint,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.zigfmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
			},
		}),
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.tags,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.proselint.with({
			extra_args = { "--config", "~/.config/proselint/config.json" },
		}),
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.diagnostics.misspell.with({
			filetypes = { "markdown" },
		}),
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.code_actions.proselint,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.completion.spell,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
        augroup END
        ]])
		end
	end,
})
