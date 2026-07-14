local config = function()
	local wk = require("which-key")

	wk.setup()

	wk.add({
		{ "<leader>b", group = "Buffer" },
		{ "<leader>d", group = "Debugger" },
		{ "<leader>f", group = "Finder" },
		{ "<leader>g", group = "Git" },
		{ "<leader>h", group = "GitHub" },
		{ "<leader>hi", group = "GitHub issues" },
		{ "<leader>hl", group = "GitHub labels" },
		{ "<leader>hp", group = "GitHub PRs" },
		{ "<leader>hr", group = "GitHub reviews" },
		{ "<leader>hs", group = "GitHub reactions" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>m", group = "Markdown" },
		{ "<leader>r", group = "Refactor" },
		{ "<leader>s", group = "Sessions" },
		{ "<leader>t", group = "Tasks" },
		{ "<leader>z", group = "Docs" },
		{ "[", group = "previous" },
		{ "]", group = "next" },
	})
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = config,
}
