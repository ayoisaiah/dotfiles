local config = function()
	require("go").setup()

	local wk = require("which-key")

	-- TODO: Register keybindings
	-- wk.register({
	-- 	name = "go",
	-- 	t = { "<cmd>GoAddTag<CR>", "Add struct tags" },
	-- 	T = { "<cmd>GoRmTag<CR>", "Remove struct tags" },
	-- }, { prefix = "<leader>g" })
end

return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = config,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
