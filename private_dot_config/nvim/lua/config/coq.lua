vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		recommended = true,
		jump_to_mark = "<c-,>",
	},
	clients = {
		paths = {
			path_seps = {
				"/",
			},
		},
		buffers = {
			match_syms = true,
		},
	},
	display = {
		ghost_text = {
			enabled = true,
		},
	},
}
