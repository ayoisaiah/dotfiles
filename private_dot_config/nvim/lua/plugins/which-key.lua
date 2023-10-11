local config = function()
	require("which-key").setup()
end

return {
	"folke/which-key.nvim",
	tag = "v1.5.1",
	event = "VeryLazy",
	config = config,
}
