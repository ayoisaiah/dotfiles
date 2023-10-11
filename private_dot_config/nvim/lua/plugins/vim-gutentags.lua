return {
	"ludovicchabant/vim-gutentags",
	config = function()
		vim.g.gutentags_file_list_command = 'rg --files --follow --ignore-file "/home/ayo/.vimignore"'
	end,
	event = "VeryLazy",
}
