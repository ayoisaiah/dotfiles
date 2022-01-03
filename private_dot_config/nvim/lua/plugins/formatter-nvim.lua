function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

require("formatter").setup({
	filetype = {
		json = {
			prettier,
		},
		typescript = {
			prettier,
		},
		javascript = {
			prettier,
		},
		css = {
			prettier,
		},
		scss = {
			prettier,
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
					args = {
						"-",
					},
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
  autocmd BufWritePost *.js,*.ts,*.go,*.json,*.lua,*.css,*.scss FormatWrite
augroup END
]],
	true
)
