return {
	"numtostr/comment.nvim",
	config = function()
		require("Comment").setup()
	end,
	event = "VeryLazy",
}
