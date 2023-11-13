return {
	"numtostr/comment.nvim",
	config = function()
		require("Comment").setup()
		local ft = require("Comment.ft")
		ft.kdl = { "//%s" }
	end,
	event = "VeryLazy",
}
