local config = function()
	require("go").setup()

	local wk = require("which-key")

	wk.add({
		{ "<leader><leader>g", group = "go" },
		{ "<leader><leader>gT", "<cmd>GoRmTag<CR>", desc = "Remove struct tags" },
		{ "<leader><leader>gr", "<cmd>GoTestFunc<CR>", desc = "Run test under cursor" },
		{ "<leader><leader>gi", "<cmd>GoImports<CR>", desc = "Run goimports on current file" },
		{ "<leader><leader>gt", "<cmd>GoAddTag<CR>", desc = "Add struct tags" },
		{ "<leader><leader>gfs", "<cmd>GoFillStruct<CR>", desc = "Auto fill struct" },
		{ "<leader><leader>gfw", "<cmd>GoFillSwitch<CR>", desc = "Auto fill switch" },
		{ "<leader><leader>ge", "<cmd>GoIfErr<CR>", desc = "Add if err" },
		{ "<leader><leader>gp", "<cmd>GoFixPlurals<CR>", desc = "Fix plurals" },
	})
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
