local config = function()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup
	local autocmd = vim.api.nvim_create_autocmd

	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				return client.name == "null-ls"
			end,
			bufnr = bufnr,
		})
	end

	local lsp_group = augroup("LspFormatting", {})

	-- add to your shared on_attach callback
	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = bufnr })
			autocmd("BufWritePre", {
				group = lsp_group,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end

	null_ls.setup({
		debug = false,
		diagnostics_format = " [#{s}] -> #{m}",
		update_in_insert = true,
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.stylelint,
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.zigfmt,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.dart_format,
			-- null_ls.builtins.formatting.sqlfluff.with({
			-- 	extra_args = { "--dialect", "postgres" },
			-- }),
			null_ls.builtins.formatting.golines.with({
				extra_args = { "-m", "80" },
			}),
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.rubocop.with({
				args = { "-A", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
			}),
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.jq.with({
				extra_filetypes = { "jsonc", "json5" },
			}),
			-- null_ls.builtins.formatting.erb_lint, -- TODO: Fix not working
			null_ls.builtins.formatting.erb_format,
			null_ls.builtins.formatting.prettierd.with({
				extra_filetypes = { "pug" },
			}),

			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.gitlint,
			null_ls.builtins.diagnostics.jsonlint,
			null_ls.builtins.diagnostics.yamllint,
			null_ls.builtins.diagnostics.actionlint,
			null_ls.builtins.diagnostics.hadolint,
			null_ls.builtins.diagnostics.gospel,
			-- null_ls.builtins.diagnostics.sqlfluff.with({
			-- 	extra_args = { "--dialect", "postgres" },
			-- }),
			null_ls.builtins.diagnostics.markdownlint.with({
				-- args = { "--fix --ignore README.md --output $FILENAME $FILENAME" },
			}),
			null_ls.builtins.diagnostics.misspell.with({
				filetypes = { "markdown" },
			}),
			null_ls.builtins.diagnostics.rubocop.with({
				args = { "-f", "json", "--force-exclusion", "--autocorrect", "--stdin", "$FILENAME" },
			}),
			null_ls.builtins.diagnostics.stylelint,
			null_ls.builtins.diagnostics.golangci_lint.with({
				args = {
					"run",
					"--fix=true",
					"--fast",
					"--out-format=json",
				},
			}),

			null_ls.builtins.code_actions.eslint_d,
			null_ls.builtins.code_actions.gomodifytags,
			null_ls.builtins.code_actions.impl,
			null_ls.builtins.code_actions.refactoring,
			null_ls.builtins.code_actions.shellcheck,
		},
		on_attach = on_attach,
	})
end

return {
	"jose-elias-alvarez/null-ls.nvim",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
