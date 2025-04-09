local config = function()
	local wk = require("which-key")

	wk.add({
		{ "<leader>g", group = "Git" },
		{ "<leader>ga", "<cmd>Git commit --amend<CR>", desc = "Amend commit" },
		{ "<leader>gc", "<cmd>Git commit --verbose<CR>", desc = "Git commit" },
	})
end

return {
	"tpope/vim-fugitive",
	config = config,
	event = "VeryLazy",
}
