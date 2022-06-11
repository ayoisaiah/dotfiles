local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
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
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.stylelint,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.zigfmt,
		null_ls.builtins.formatting.golines.with({
			extra_args = { "-m", "80" },
		}),
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
			},
		}),
		null_ls.builtins.completion.tags,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.proselint.with({
			extra_args = { "--config", "/home/ayo/.config/proselint/config.json" },
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
	},
	on_attach = on_attach,
})
