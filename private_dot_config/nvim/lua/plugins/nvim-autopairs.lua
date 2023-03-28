local config = function()
	require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
	})
end

return {
	"windwp/nvim-autopairs",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
