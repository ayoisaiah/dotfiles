return {
	url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup({})
		local wk = require("which-key")

		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = false,
		})

		wk.add({
			{ "<leader>lL", require("lsp_lines").toggle, desc = "Toggle diagnostic lines" },
		})
	end,
	dependencies = {
		"folke/which-key.nvim",
	},
}
