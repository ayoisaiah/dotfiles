local config = function()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
		},
	})
end

return {
	"akinsho/nvim-bufferline.lua",
	tag = "v3.5.0",
	config = config,
}
