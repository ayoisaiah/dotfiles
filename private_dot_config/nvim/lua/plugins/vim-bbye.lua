return {
	"moll/vim-bbye",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bl", "<cmd>Bwipeout<CR>", desc = "Clear current buffer" },
			{ "<leader>bx", "<cmd>bufdo :Bdelete<CR>", desc = "Clear all buffers" },
		})
	end,
	event = "VeryLazy",
}
