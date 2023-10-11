local config = function()
	local wk = require("which-key")
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local vimignoreFile = "/home/ayo/.vimignore"
	local trouble = require("trouble.providers.telescope")

	telescope.setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--ignore-file",
				vimignoreFile,
			},
			mappings = {
				i = {
					["<Esc>"] = actions.close,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-x>"] = actions.delete_buffer,
					["<C-s>"] = actions.select_horizontal,
					["<C-t>"] = trouble.open_with_trouble,
				},
				n = {
					["<C-c>"] = actions.close,
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
		extensions = {},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("dap")

	wk.register({
		name = "Finder",
		b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Open buffers" },
		c = { "<cmd>lua require('telescope.builtin').command_history()<CR>", "Command history" },
		d = { "<cmd>TodoTelescope<CR>", "Todo items" },
		f = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer" },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live grep" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
		k = { "<cmd>lua require('telescope.builtin').keymaps()<CR>", "Keymaps" },
		l = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Location list" },
		o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Previously open files" },
		q = { "<cmd>lua require('telescope.builtin').quickfix()<CR>", "Quickfix list" },
		r = { "<cmd>lua require('telescope.builtin').registers()<CR>", "Registers" },
		t = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Project tags" },
		u = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Open results of last picker" },
		[":"] = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Search & execute commands" },
		["/"] = { "<cmd>lua require('telescope.builtin').search_history()<CR>", "Search history" },
	}, { prefix = "<leader>f" })

	wk.register({
		name = "Finder",
		["<C-p>"] = {
			"<cmd>lua require('telescope.builtin').find_files({ hidden = true, find_command = { 'fd', '--type', 'file', '--hidden', '--follow', '--ignore-file','"
				.. vimignoreFile
				.. "'} })<CR>",
			"Find files",
		},
	})

	wk.register({
		name = "Debugger",
		f = { "<cmd>Telescope dap frames<CR>", "List frames" },
		g = { "<cmd>Telescope dap configurations<CR>", "List configurations" },
		m = { "<cmd>Telescope dap commands<CR>", "List dap commands" },
		p = { "<cmd>Telescope dap list_breakpoints<CR>", "List breakpoints" },
		v = { "<cmd>Telescope dap variables<CR>", "List variables" },
	}, { prefix = "<leader>d" })
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-dap.nvim",
		"neovim/nvim-lspconfig",
		"DaikyXendo/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
}
