local config = function()
	require("which-key").setup()
end

return {
	"folke/which-key.nvim",
	tag = "v1.2.0",
	lazy = true,
	config = config,
}
