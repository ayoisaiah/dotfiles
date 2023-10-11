return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})

		local wk = require("which-key")

		wk.register({
			name = "LSP",
			["<F3>"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
		})

		wk.register({
			name = "LSP",
			["]"] = {
				name = "next",
				t = {
					"<cmd>lua require('trouble').next({skip_groups = true, jump = true});<CR>",
					"Go to next item in Trouble",
				},
			},
			["["] = {
				name = "previous",
				t = {
					"<cmd>lua require('trouble').previous({skip_groups = true, jump = true});<CR>",
					"Go to previous item in Trouble",
				},
			},
		})
	end,
	event = "VeryLazy",
}
