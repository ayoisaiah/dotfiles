return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			-- fix_pos = true,
			-- toggle_key = "<C-m>",
			-- select_signature_key = "<C-q>",
		})
	end,
}
