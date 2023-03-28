local config = function()
	require("gitsigns").setup({
		keymaps = {
			-- Default keymap options
			noremap = true,

			["n ]h"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>zz'" },
			["n [h"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>zz'" },
		},
	})
end

return {
	"lewis6991/gitsigns.nvim",
	config = config,
}
