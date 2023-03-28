local config = function()
	require("indent_blankline").setup({
		char = "|",
		buftype_exclude = { "terminal" },
		filetype_exclude = { "dashboard" },
		show_current_context = true,
		show_current_context_start = true,
		show_end_of_line = true,
	})
end

return {
	"lukas-reineke/indent-blankline.nvim",
	tag = "v2.20.4",
	lazy = true,
	config = config,
	event = { "BufReadPost", "BufNewFile" },
}
