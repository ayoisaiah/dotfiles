local config = function()
	local wk = require("which-key")
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local vimignoreFile = os.getenv("HOME") .. "/.vimignore"
	local trouble = require("trouble.sources.telescope")
	local builtin = require("telescope.builtin")

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
					["<C-t>"] = trouble.open,
				},
				n = {
					["<C-c>"] = actions.close,
					["<C-t>"] = trouble.open,
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

	wk.add({
		{ "<leader>f", group = "Finder" },
		{ "<leader>f/", builtin.search_history, desc = "Search history" },
		{ "<leader>f:", builtin.commands, desc = "Search & execute commands" },
		{ "<leader>fb", builtin.buffers, desc = "Open buffers" },
		{ "<leader>fc", builtin.command_history, desc = "Command history" },
		{ "<leader>fd", "<cmd>TodoTelescope<CR>", desc = "Todo items" },
		{ "<leader>ff", builtin.current_buffer_fuzzy_find, desc = "Fuzzy find in buffer" },
		{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
		{ "<leader>fh", builtin.help_tags, desc = "Help tags" },
		{ "<leader>fk", builtin.keymaps, desc = "Keymaps" },
		{ "<leader>fl", builtin.loclist, desc = "Location list" },
		{ "<leader>fo", builtin.oldfiles, desc = "Previously open files" },
		{ "<leader>fq", builtin.quickfix, desc = "Quickfix list" },
		{ "<leader>fr", builtin.registers, desc = "Registers" },
		{ "<leader>fs", builtin.git_status, desc = "Git status" },
		{ "<leader>ft", builtin.tags, desc = "Project tags" },
		{ "<leader>fu", builtin.resume, desc = "Open results of last picker" },
		{
			"<C-p>",
			function()
				builtin.find_files({
					hidden = true,
					find_command = {
						"fd",
						"--type",
						"file",
						"--hidden",
						"--follow",
						"--ignore-file",
						vimignoreFile,
					},
				})
			end,
			desc = "Find files",
		},
	})

	wk.add({
		{ "<leader>d", group = "Debugger" },
		{ "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "List frames" },
		{ "<leader>dg", "<cmd>Telescope dap configurations<CR>", desc = "List configurations" },
		{ "<leader>dm", "<cmd>Telescope dap commands<CR>", desc = "List dap commands" },
		{ "<leader>dp", "<cmd>Telescope dap list_breakpoints<CR>", desc = "List breakpoints" },
		{ "<leader>dv", "<cmd>Telescope dap variables<CR>", desc = "List variables" },
	})
end

return {
	"nvim-telescope/telescope.nvim",
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
