local wk = require("which-key")
local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local vimignore = vim.fn.stdpath("config") .. "/.vimignore"

telescope.setup({
	defaults = {
		preview = false,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--ignore-file",
			vimignore,
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-t>"] = trouble.open_with_trouble,
			},
		},
	},
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ultisnips")

wk.register({
	name = "telescope",
	g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live grep" },
	b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Open buffers" },
	h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
	t = { "<cmd>lua require('telescope.builtin').current_buffer_tags()<CR>", "Buffer tags" },
	f = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer" },
	T = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Project tags" },
	s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Suggest spelling" },
	c = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Execute commands" },
	C = { "<cmd>lua require('telescope.builtin').command_history()<CR>", "Command history" },
	S = { "<cmd>lua require('telescope.builtin').search_history()<CR>", "Search history" },
	o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Previously open files" },
	q = { "<cmd>lua require('telescope.builtin').quickfix()<CR>", "Quickfix list" },
	l = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Location list" },
	r = { "<cmd>lua require('telescope.builtin').registers()<CR>", "Registers" },
	i = { "<cmd>lua require('telescope.builtin').treesitter()<CR>", "Treesitter" },
	u = { "<cmd>Telescope ultisnips<CR>", "Ultisnips" },
	d = { "<cmd>TodoTelescope<CR>", "Todo items" },
}, { prefix = "<leader>t" })

wk.register({
	name = "telescope",
	["<C-p>"] = {
		"<cmd>lua require('telescope.builtin').find_files({ hidden = true, find_command = { 'rg', '--files', '--hidden', '--follow', '--ignore-file','"
			.. vimignore
			.. "'} })<CR>",
		"Find files",
	},
})
