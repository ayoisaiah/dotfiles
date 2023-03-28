return {
	"moll/vim-bbye",
	config = function()
		local wk = require("which-key")

		wk.register({
			name = "buffers",
			l = { "<cmd>Bwipeout<CR>", "Clear current buffer" },
		}, { prefix = "<space>" })
	end,
}
