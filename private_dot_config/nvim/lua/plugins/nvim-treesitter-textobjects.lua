-- TODO: Not working
local config = function()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = config,
}
