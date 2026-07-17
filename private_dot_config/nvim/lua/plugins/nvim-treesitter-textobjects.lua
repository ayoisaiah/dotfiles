local config = function()
	require("nvim-treesitter-textobjects").setup({
		move = {
			set_jumps = true,
		},
		select = {
			lookahead = true,
		},
	})

	local select = require("nvim-treesitter-textobjects.select")
	local swap = require("nvim-treesitter-textobjects.swap")
	local move = require("nvim-treesitter-textobjects.move")

	local select_keymaps = {
		aa = { query = "@assignment.outer", desc = "Select outer part of assignment" },
		ia = { query = "@assignment.inner", desc = "Select inner part of assignment" },
		lh = { query = "@assignment.lhs", desc = "Select left-hand side of assignment" },
		rh = { query = "@assignment.rhs", desc = "Select right-hand side of assignment" },
		af = { query = "@function.outer", desc = "Select outer part of a function" },
		["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
		ac = { query = "@class.outer", desc = "Select outer part of a class region" },
		ic = { query = "@class.inner", desc = "Select inner part of a class region" },
		am = { query = "@comment.outer", desc = "Select outer part of a comment" },
		im = { query = "@comment.inner", desc = "Select inner part of a comment" },
		ab = { query = "@block.outer", desc = "Select outer part of a block" },
		ib = { query = "@block.inner", desc = "Select inner part of a block" },
		al = { query = "@loop.outer", desc = "Select outer part of a loop" },
		il = { query = "@loop.inner", desc = "Select inner part of a loop" },
		ap = { query = "@parameter.outer", desc = "Select outer part of parameters" },
		ip = { query = "@parameter.inner", desc = "Select inner part of parameters" },
		an = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
		["in"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
		ar = { query = "@regex.outer", desc = "Select outer part of a regular expression" },
		ir = { query = "@regex.inner", desc = "Select inner part of a regular expression" },
	}

	for lhs, mapping in pairs(select_keymaps) do
		vim.keymap.set({ "x", "o" }, lhs, function()
			select.select_textobject(mapping.query, "textobjects")
		end, { desc = mapping.desc })
	end

	vim.keymap.set("n", "<leader>a", function()
		swap.swap_next("@parameter.inner", "textobjects")
	end, { desc = "Swap with next parameter" })

	vim.keymap.set("n", "<leader>A", function()
		swap.swap_previous("@parameter.inner", "textobjects")
	end, { desc = "Swap with previous parameter" })

	vim.keymap.set({ "n", "x", "o" }, "]f", function()
		move.goto_next_start("@function.outer", "textobjects")
	end, { desc = "Go to next function" })

	vim.keymap.set({ "n", "x", "o" }, "]F", function()
		move.goto_next_start("@function.inner", "textobjects")
	end, { desc = "Go to next function inner" })

	vim.keymap.set({ "n", "x", "o" }, "[f", function()
		move.goto_previous_start("@function.outer", "textobjects")
	end, { desc = "Go to previous function" })

	vim.keymap.set({ "n", "x", "o" }, "[F", function()
		move.goto_previous_start("@function.inner", "textobjects")
	end, { desc = "Go to previous function inner" })
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	config = config,
}
