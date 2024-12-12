local config = function()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			buffer_close_icon = "",
		},
	})
end

return {
	"akinsho/nvim-bufferline.lua",
	tag = "v4.6.1",
	event = "BufEnter",
	config = config,
}
