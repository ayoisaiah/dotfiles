local config = function()
	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

	require("auto-session").setup({
		log_level = vim.log.levels.ERROR,
		session_lens = {
			theme_conf = { border = true },
		},
	})
end

return {
	"rmagatti/auto-session",
	config = config,
	lazy = false,
}
