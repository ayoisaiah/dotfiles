require("todo-comments").setup({
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--ignore-file",
			"/home/ayo/.vimignore",
		},
	},
})
