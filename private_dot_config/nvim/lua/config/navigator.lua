require("navigator").setup({
	lsp = {
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
		sumneko_lua = {
			sumneko_root_path = vim.fn.expand("$HOME") .. "/bin/lua-language-server",
			sumneko_binary = vim.fn.expand("$HOME") .. "/bin/lua-language-server/bin/lua-language-server",
		},
	},
})
