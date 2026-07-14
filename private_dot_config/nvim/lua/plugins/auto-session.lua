local config = function()
	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

	require("auto-session").setup({
		log_level = vim.log.levels.ERROR,
		session_lens = {
			load_on_setup = false,
			picker_opts = { border = true },
		},
	})
end

return {
	"rmagatti/auto-session",
	config = config,
	keys = {
		{ "<leader>sd", "<cmd>AutoSession delete<CR>", desc = "Delete session" },
		{ "<leader>sr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
		{ "<leader>ss", "<cmd>AutoSession search<CR>", desc = "Search sessions" },
		{ "<leader>st", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
		{ "<leader>sw", "<cmd>AutoSession save<CR>", desc = "Save session" },
	},
	lazy = false,
}
