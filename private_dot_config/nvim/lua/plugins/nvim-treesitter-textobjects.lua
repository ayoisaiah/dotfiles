local config = function()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aa"] = { query = "@assignment.outer", desc = "Select outer part of assignment" },
					["ia"] = { query = "@assignment.inner", desc = "Select inner part of assignment" },
					["lh"] = { query = "@assignment.lhs", desc = "Select left-hand side of assignment" },
					["rh"] = { query = "@assignment.rhs", desc = "Select right-hand side of assignment" },
					["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
					["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["am"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
					["im"] = { query = "@comment.inner", desc = "Select inner part of a comment" },
					["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
					["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },
					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
					["ap"] = { query = "@parameter.outer", desc = "Select outer part of parameters" },
					["ip"] = { query = "@parameter.inner", desc = "Select inner part of parameters" },
					["an"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
					["in"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
					["ar"] = { query = "@regex.outer", desc = "Select outer part of a regular expression" },
					["ir"] = { query = "@regex.inner", desc = "Select inner part of a regular expression" },
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = { query = "@function.outer", desc = "Go to next function" },
					["]F"] = { query = "@function.inner", desc = "Go to next function inner" },
				},
				goto_previous_start = {
					["[f"] = { query = "@function.outer", desc = "Go to previous function" },
					["[F"] = { query = "@function.inner", desc = "Go to previous function inner" },
				},
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = config,
}
