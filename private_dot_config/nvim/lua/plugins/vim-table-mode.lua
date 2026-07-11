return {
	"dhruvasagar/vim-table-mode",
	ft = "markdown",
	init = function()
		vim.g.table_mode_disable_mappings = 1
		vim.g.table_mode_corner = "|"
	end,
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>mT", "<cmd>TableModeToggle<CR>", desc = "Toggle table mode" },
			{ "<leader>ma", "<cmd>TableModeRealign<CR>", desc = "Align table" },
		})
	end,
}
