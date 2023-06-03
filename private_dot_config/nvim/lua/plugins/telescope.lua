local config = function()
	local wk = require("which-key")
	local telescope = require("telescope")
	local vimignore = "/home/ayo/.vimignore"
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			-- TODO: Update this
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

	-- TODO: Review keybindings

	wk.register({
		name = "+telescope",
		g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live grep" },
		G = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", "Find string under cursor" },
		b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Open buffers" },
		x = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Git status" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
		f = { "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Editing history" },
		F = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer" },
		T = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Project tags" },
		s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Suggest spelling" },
		c = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Execute commands" },
		C = { "<cmd>lua require('telescope.builtin').command_history()<CR>", "Command history" },
		S = { "<cmd>lua require('telescope.builtin').search_history()<CR>", "Search history" },
		o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Previously open files" },
		q = { "<cmd>lua require('telescope.builtin').quickfix()<CR>", "Quickfix list" },
		L = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Location list" },
		lm = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, symbols = {'method', 'function'}})<CR>",
			"Document methods and functions",
		},
		ls = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, symbols = {'method', 'function'}})<CR>",
			"Document methods and functions",
		},
		r = { "<cmd>lua require('telescope.builtin').registers()<CR>", "Registers" },
		R = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Open results of last picker" },
		t = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({show_line = true, ignore_symbols = {'field'}})<CR>",
			"Document symbols",
		},
		d = { "<cmd>TodoTelescope<CR>", "Todo items" },
	}, { prefix = "<leader>t" })

	wk.register({}, { prefix = "<leader>l" })

	wk.register({
		name = "telescope lsp",
		r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References for word under cursor" },
		i = { "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>", "Incoming calls" },
		o = { "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<CR>", "Outgoing calls" },
		s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document symbols" },
		w = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace symbols" },
		W = {
			"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
			"Dynamic workspace symbols",
		},
		d = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics in all open buffers" },
		D = { "<cmd>lua require('telescope.builtin').diagnostics(bufnr=0)<CR>", "Diagnostics in current buffer" },
		l = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "Go to definition" },
		t = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", "Go to type definition" },
		m = { "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", "Go to implementation" },
	}, { prefix = "<leader>." })

	wk.register({
		name = "+telescope",
		["<C-p>"] = {
			"<cmd>lua require('telescope.builtin').find_files({ hidden = true, find_command = { 'fd', '--type', 'file', '--hidden', '--follow', '--ignore-file','"
				.. vimignore
				.. "'} })<CR>",
			"Find files",
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	lazy = false,
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
}
