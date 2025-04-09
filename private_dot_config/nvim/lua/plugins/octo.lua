local config = function()
	require("octo").setup({
		suppress_missing_scope = {
			projects_v2 = true,
		},
	})

	local wk = require("which-key")

	wk.add({
		{ "<leader>hi", group = "GitHub" },
		{ "<leader>hib", "<cmd>Octo issue browser<CR>", desc = "Open the current issue in the browser" },
		{ "<leader>hic", "<cmd>Octo issue create<CR>", desc = "Create a new issue" },
		{ "<leader>hie", "<cmd>Octo issue edit<CR>", desc = "Edit an issue" },
		{ "<leader>hil", "<cmd>Octo issue list<CR>", desc = "List current repo issues" },
		{ "<leader>hio", "<cmd>Octo issue reopen<CR>", desc = "Reopen the current issue" },
		{ "<leader>hiu", "<cmd>Octo issue url<CR>", desc = "Copy issue URL to clipboard" },
		{ "<leader>hix", "<cmd>Octo issue close<CR>", desc = "Close the current issue" },
	})

	wk.add({
		{ "<leader>hs", group = "GitHub" },
		{ "<leader>hs+", "<cmd>Octo reaction +1<CR>", desc = "Thumbs up" },
		{ "<leader>hs-", "<cmd>Octo reaction -1<CR>", desc = "Thumbs down" },
		{ "<leader>hsc", "<cmd>Octo reaction confused<CR>", desc = "Confused" },
		{ "<leader>hse", "<cmd>Octo reaction eyes<CR>", desc = "Eyes" },
		{ "<leader>hsh", "<cmd>Octo reaction heart<CR>", desc = "Heart" },
		{ "<leader>hsl", "<cmd>Octo reaction laugh<CR>", desc = "Laugh" },
		{ "<leader>hsp", "<cmd>Octo reaction party<CR>", desc = "Party" },
	})

	wk.add({
		{ "<leader>hp", group = "GitHub" },
		{ "<leader>hpc", "<cmd>Octo pr changes<CR>", desc = "Show all PR changes (diffs)" },
		{ "<leader>hpe", "<cmd>Octo label edit<CR>", desc = "Edit a PR" },
		{ "<leader>hph", "<cmd>Octo pr checks<CR>", desc = "Show all PR checks" },
		{ "<leader>hpl", "<cmd>Octo pr list<CR>", desc = "Select an issue label to add" },
		{ "<leader>hpr", "<cmd>Octo pr reopen<CR>", desc = "Reopen the current PR" },
		{ "<leader>hpu", "<cmd>Octo pr url<CR>", desc = "Copy PR url to clipboard" },
	})

	wk.add({
		{ "<leader>hl", group = "GitHub" },
		{ "<leader>hlA", "<cmd>Octo label add<CR>", desc = "Add an issue label" },
		{ "<leader>hlR", "<cmd>Octo label remove<CR>", desc = "Remove an issue label" },
		{ "<leader>hla", "<cmd>Octo label add<CR>", desc = "Select an issue label to add" },
		{ "<leader>hlr", "<cmd>Octo label remove<CR>", desc = "Select an issue label to remove" },
	})

	wk.add({
		{ "<leader>hr", group = "GitHub" },
		{ "<leader>hrc", "<cmd>Octo review close<CR>", desc = "Close review and return to PR" },
		{ "<leader>hrr", "<cmd>Octo review resume<CR>", desc = "Resume last review" },
		{ "<leader>hrs", "<cmd>Octo review start<CR>", desc = "Start a review" },
	})
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
