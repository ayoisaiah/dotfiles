local config = function()
	local wk = require("which-key")

	wk.register({
		name = "Git",
		a = { "<cmd>Git commit --amend<CR>", "Amend commit" },
		c = { "<cmd>Git commit --verbose<CR>", "Git commit" },
	}, { prefix = "<leader>g" })
end

return {
	"tpope/vim-fugitive",
	config = config,
	event = "VeryLazy",
}
