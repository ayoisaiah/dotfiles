local config = function()
	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

	require("auto-session").setup({
		log_level = vim.log.levels.ERROR,
		auto_save_enabled = true,
		auto_restore_enabled = true,
		lazy = false,
		session_lens = {
			load_on_setup = true,
			theme_conf = { border = true },
			previewer = false,
		},
	})
end

return {
	"rmagatti/auto-session",
	config = config,
}
