require("formatter").setup({
	filetype = {
		javascript = {
			function()
				return {
					exe = "prettier",
					args = "--config",
					"$HOME/.prettierrc.json",
					stdin = true,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "goimports",
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					stdin = true,
				}
			end,
		},
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.go FormatWrite
augroup END
]],
	true
)
