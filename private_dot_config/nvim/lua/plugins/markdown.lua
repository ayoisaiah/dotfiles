return {
	"tadmccorkle/markdown.nvim",
	ft = "markdown",
	opts = {
		mappings = {
			inline_surround_toggle = "gs",
			inline_surround_toggle_line = "gss",
			inline_surround_delete = "ds",
			inline_surround_change = "cs",
			link_add = "<leader>ml",
			link_follow = "gx",
			go_curr_heading = "<leader>mh",
			go_parent_heading = "<leader>mH",
			go_next_heading = "]m",
			go_prev_heading = "[m",
		},
		link = {
			paste = {
				enable = true,
			},
		},
		on_attach = function(bufnr)
			require("lang.markdown").setup_markdown_nvim_keymaps(bufnr)
		end,
	},
}
