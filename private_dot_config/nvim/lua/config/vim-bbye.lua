local wk = require("which-key")

wk.register({
	name = "buffers",
	l = { "<cmd>Bwipeout<CR>", "Clear current buffer" },
}, { prefix = "<leader>b" })
