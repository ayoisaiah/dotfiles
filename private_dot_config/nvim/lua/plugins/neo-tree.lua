return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"DaikyXendo/nvim-web-devicons", -- Use user's preferred web devicons fork
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle filesystem left<cr>",
			desc = "Toggle file explorer",
		},
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true, -- Focuses the tree on the active buffer's file
			},
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
					"node_modules",
				},
			},
		},
		window = {
			width = 30,
			mappings = {
				["<space>"] = "none", -- Unbind space so it doesn't conflict with leader
			},
		},
	},
}
