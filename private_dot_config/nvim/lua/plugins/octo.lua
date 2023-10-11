local config = function()
	require("octo").setup({})

	local wk = require("which-key")

	wk.register({
		name = "GitHub",
		l = { "<cmd>Octo issue list<CR>", "List current repo issues" },
		c = { "<cmd>Octo issue create<CR>", "Create a new issue" },
		e = { ":Octo issue edit ", "Edit an issue" },
		b = { "<cmd>Octo issue browser<CR>", "Open the current issue in the browser" },
		u = { "<cmd>Octo issue url<CR>", "Copy issue URL to clipboard" },
		x = { "<cmd>Octo issue close<CR>", "Close the current issue" },
		o = { "<cmd>Octo issue reopen<CR>", "Reopen the current issue" },
	}, { prefix = "<leader>hi" })

	wk.register({
		name = "GitHub",
		["+"] = { "<cmd>Octo reaction +1<CR>", "Thumbs up" },
		["-"] = { "<cmd>Octo reaction -1<CR>", "Thumbs down" },
		e = { "<cmd>Octo reaction eyes<CR>", "Eyes" },
		l = { "<cmd>Octo reaction laugh<CR>", "Laugh" },
		c = { "<cmd>Octo reaction confused<CR>", "Confused" },
		h = { "<cmd>Octo reaction heart<CR>", "Heart" },
		p = { "<cmd>Octo reaction party<CR>", "Party" },
	}, { prefix = "<leader>hs" })

	wk.register({
		name = "GitHub",
		l = { "<cmd>Octo pr list<CR>", "Select an issue label to add" },
		e = { ":Octo label edit ", "Edit a PR" },
		r = { "<cmd>Octo pr reopen<CR>", "Reopen the current PR" },
		c = { "<cmd>Octo pr changes<CR>", "Show all PR changes (diffs)" },
		h = { "<cmd>Octo pr checks<CR>", "Show all PR checks" },
		u = { "<cmd>Octo pr url<CR>", "Copy PR url to clipboard" },
	}, { prefix = "<leader>hp" })

	wk.register({
		name = "GitHub",
		a = { "<cmd>Octo label add<CR>", "Select an issue label to add" },
		A = { ":Octo label add ", "Add an issue label" },
		r = { "<cmd>Octo label remove<CR>", "Select an issue label to remove" },
		R = { ":Octo label remove ", "Remove an issue label" },
	}, { prefix = "<leader>hl" })

	wk.register({
		name = "GitHub",
		r = { "<cmd>Octo review resume<CR>", "Resume last review" },
		s = { "<cmd>Octo review start<CR>", "Start a review" },
		c = { "<cmd>Octo review close<CR>", "Close review and return to PR" },
	}, { prefix = "<leader>hr" })
end

return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"DaikyXendo/nvim-web-devicons",
	},
	config = config,
	event = "VeryLazy",
}
