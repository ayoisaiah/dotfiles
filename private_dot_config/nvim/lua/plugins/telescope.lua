local vimignore_file = vim.fn.expand("~/.vimignore")

local function builtin(name, opts)
	return function()
		require("telescope.builtin")[name](opts or {})
	end
end

local function live_grep_args()
	require("telescope").extensions.live_grep_args.live_grep_args()
end

local function dap_picker(name)
	return function()
		local telescope = require("telescope")
		telescope.load_extension("dap")
		telescope.extensions.dap[name]()
	end
end

local function visual_live_grep()
	local old_reg = vim.fn.getreg("v")
	vim.cmd('normal! "vy')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", old_reg)
	require("telescope.builtin").live_grep({ default_text = text })
end

local function find_files()
	require("telescope.builtin").find_files({
		hidden = true,
		find_command = {
			"fd",
			"--type",
			"file",
			"--hidden",
			"--follow",
			"--ignore-file",
			vimignore_file,
		},
	})
end

local function config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local trouble = require("trouble.sources.telescope")

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
				vimignore_file,
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
	telescope.load_extension("live_grep_args")
	telescope.load_extension("ui-select")
	telescope.load_extension("file_browser")
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<C-p>", find_files, desc = "Find files" },
		{ "<leader>f/", builtin("search_history"), desc = "Search history" },
		{ "<leader>f:", builtin("commands"), desc = "Commands" },
		{
			"<leader>fA",
			builtin("live_grep", { additional_args = { "--no-ignore", "--hidden" } }),
			desc = "Grep all files",
		},
		{ "<leader>fa", builtin("find_files", { no_ignore = true, hidden = true }), desc = "Find all files" },
		{ "<leader>fb", builtin("buffers"), desc = "Buffers" },
		{ "<leader>fc", builtin("command_history"), desc = "Command history" },
		{ "<leader>fd", "<cmd>TodoTelescope<CR>", desc = "Todo items" },
		{ "<leader>fe", "<cmd>Telescope file_browser<CR>", desc = "File browser" },
		{ "<leader>ff", builtin("current_buffer_fuzzy_find"), desc = "Find in buffer" },
		{ "<leader>fg", builtin("live_grep"), desc = "Live grep" },
		{ "<leader>fG", live_grep_args, desc = "Live grep with args" },
		{ "<leader>fh", builtin("help_tags"), desc = "Help tags" },
		{ "<leader>fj", builtin("jumplist"), desc = "Jumplist" },
		{ "<leader>fk", builtin("keymaps"), desc = "Keymaps" },
		{ "<leader>fl", builtin("loclist"), desc = "Location list" },
		{ "<leader>fm", builtin("marks"), desc = "Marks" },
		{ "<leader>fo", builtin("oldfiles"), desc = "Recent files" },
		{ "<leader>fp", builtin("find_files"), desc = "Find files (Telescope)" },
		{ "<leader>fq", builtin("quickfix"), desc = "Quickfix list" },
		{ "<leader>fr", builtin("registers"), desc = "Registers" },
		{ "<leader>fs", builtin("git_status"), desc = "Git status" },
		{ "<leader>ft", builtin("tags"), desc = "Project tags" },
		{ "<leader>fu", builtin("resume"), desc = "Resume picker" },
		{ "<leader>fw", builtin("grep_string"), desc = "Search word under cursor" },
		{ "<leader>fv", visual_live_grep, desc = "Search visual selection", mode = "v" },
		{ "<leader>gB", builtin("git_bcommits"), desc = "Git buffer commits" },
		{ "<leader>gC", builtin("git_commits"), desc = "Git commits" },
		{ "<leader>gG", builtin("git_files"), desc = "Git tracked files" },
		{ "<leader>gh", builtin("git_stash"), desc = "Git stash list" },
		{ "<leader>gl", builtin("git_branches"), desc = "Git branches" },
		{ "<leader>gt", builtin("git_status"), desc = "Git status list" },
		{ "<leader>df", dap_picker("frames"), desc = "List frames" },
		{ "<leader>dg", dap_picker("configurations"), desc = "List configurations" },
		{ "<leader>dm", dap_picker("commands"), desc = "List dap commands" },
		{ "<leader>dp", dap_picker("list_breakpoints"), desc = "List breakpoints" },
		{ "<leader>dv", dap_picker("variables"), desc = "List variables" },
	},
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
