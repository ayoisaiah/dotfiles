return {
	"lukas-reineke/headlines.nvim",
	dependencies = { "nvim-treesitter" },
	config = function()
		require("headlines").setup({})
		vim.cmd([[highlight CodeBlock guibg=#2B3328]])
		vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
	end,
	event = "BufEnter *.md",
}
