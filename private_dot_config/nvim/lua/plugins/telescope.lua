local config = function()
	local wk = require("which-key")
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local vimignoreFile = vim.fn.expand("~/.vimignore")
	local trouble = require("trouble.sources.telescope")
	local builtin = require("telescope.builtin")

	local function get_visual_selection()
		local old_reg = vim.fn.getreg("v")
		vim.cmd('normal! "vy')
		local text = vim.fn.getreg("v")
		vim.fn.setreg("v", old_reg)
		return text
	end

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
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("dap")
	telescope.load_extension("live_grep_args")
	telescope.load_extension("ui-select")
	telescope.load_extension("file_browser")

	wk.add({
		{ "<leader>f", group = "Finder" },
		{ "<leader>f/", builtin.search_history, desc = "Search history" },
		{ "<leader>f:", builtin.commands, desc = "Search & execute commands" },
		{ "<leader>fb", builtin.buffers, desc = "Open buffers" },
		{ "<leader>fc", builtin.command_history, desc = "Command history" },
		{ "<leader>fd", "<cmd>TodoTelescope<CR>", desc = "Todo items" },
		{ "<leader>ff", builtin.current_buffer_fuzzy_find, desc = "Fuzzy find in buffer" },
		{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
		{
			"<leader>fG",
			function()
				telescope.extensions.live_grep_args.live_grep_args()
			end,
			desc = "Advanced live grep (args)",
		},
		{ "<leader>fh", builtin.help_tags, desc = "Help tags" },
		{ "<leader>fj", builtin.jumplist, desc = "Jumplist" },
		{ "<leader>fk", builtin.keymaps, desc = "Keymaps" },
		{ "<leader>fl", builtin.loclist, desc = "Location list" },
		{ "<leader>fm", builtin.marks, desc = "Marks" },
		{ "<leader>fo", builtin.oldfiles, desc = "Previously open files" },
		{ "<leader>fp", builtin.find_files, desc = "Find files (Telescope)" },
		{
			"<leader>fa",
			function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end,
			desc = "Find all files (no-ignore)",
		},
		{
			"<leader>fA",
			function()
				builtin.live_grep({ additional_args = { "--no-ignore", "--hidden" } })
			end,
			desc = "Live grep all files (no-ignore)",
		},
		{ "<leader>fq", builtin.quickfix, desc = "Quickfix list" },
		{ "<leader>fr", builtin.registers, desc = "Registers" },
		{ "<leader>fs", builtin.git_status, desc = "Git status" },
		{ "<leader>ft", builtin.tags, desc = "Project tags" },
		{ "<leader>fu", builtin.resume, desc = "Open results of last picker" },
		{ "<leader>fw", builtin.grep_string, desc = "Search word under cursor" },
		{
			"<leader>fe",
			"<cmd>Telescope file_browser<CR>",
			desc = "File browser",
		},
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
			desc = "Find files (Fast/Ignored)",
		},
	})

	wk.add({
		{
			mode = { "v" },
			{ "<leader>f", group = "Finder" },
			{
				"<leader>fv",
				function()
					local text = get_visual_selection()
					builtin.live_grep({ default_text = text })
				end,
				desc = "Search visual selection",
			},
		},
	})

	wk.add({
		{ "<leader>g", group = "Git" },
		{ "<leader>gB", builtin.git_bcommits, desc = "Git buffer commits" },
		{ "<leader>gC", builtin.git_commits, desc = "Git commits" },
		{ "<leader>gG", builtin.git_files, desc = "Git tracked files" },
		{ "<leader>gh", builtin.git_stash, desc = "Git stash list" },
		{ "<leader>gl", builtin.git_branches, desc = "Git branches" },
		{ "<leader>gt", builtin.git_status, desc = "Git status list" },
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
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
}
