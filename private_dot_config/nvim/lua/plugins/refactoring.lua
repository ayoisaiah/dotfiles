return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({})

		local wk = require("which-key")

		-- Visual mode refactoring keys
		wk.add({
			{
				mode = { "x" },
				{ "<leader>r", group = "Refactor" },
				{ "<leader>re", ":Refactor extract_func ", desc = "Extract Function" },
				{ "<leader>rf", ":Refactor extract_func_to_file ", desc = "Extract Function to File" },
				{ "<leader>rv", ":Refactor extract_var ", desc = "Extract Variable" },
				{ "<leader>ri", ":Refactor inline_var ", desc = "Inline Variable" },
			},
		})

		-- Normal mode refactoring keys
		wk.add({
			{
				mode = { "n" },
				{ "<leader>r", group = "Refactor" },
				{ "<leader>ri", ":Refactor inline_var<CR>", desc = "Inline Variable" },
			},
		})
	end,
	event = "VeryLazy",
}
