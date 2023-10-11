--TODO: Learn about folding workflow
local config = function()
	vim.o.foldcolumn = "1"
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

	local ufo = require("ufo")
	ufo.setup({
		close_fold_kinds = { "imports", "comment" },
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	})
end

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "VeryLazy",
	-- config = config,
}
