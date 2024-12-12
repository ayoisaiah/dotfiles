return {
	"carbon-steel/detour.nvim",
	config = function()
		vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>")
		--   local wk = require("which-key")
		--
		-- wk.register({
		-- 	name = "Buffer",
		-- 	x = { "<cmd>bufdo :Bdelete<CR>", "Clear all buffers" },
		-- }, { prefix = "<leader>b" })
	end,
	event = "VeryLazy",
}
