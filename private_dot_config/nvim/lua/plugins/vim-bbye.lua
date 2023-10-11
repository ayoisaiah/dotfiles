return {
	"moll/vim-bbye",
	config = function()
		local wk = require("which-key")

		wk.register({
			name = "Buffer",
			l = { "<cmd>Bwipeout<CR>", "Clear current buffer" },
			x = { "<cmd>bufdo :Bdelete<CR>", "Clear all buffers" },
		}, { prefix = "<leader>b" })
	end,
	event = "VeryLazy",
}
