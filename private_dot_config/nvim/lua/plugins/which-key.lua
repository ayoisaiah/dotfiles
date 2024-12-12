local config = function()
	require("which-key").setup()
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = config,
}
